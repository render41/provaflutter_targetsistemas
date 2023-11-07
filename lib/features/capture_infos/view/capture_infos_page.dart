import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provaflutter_targetsistemas/common/style/app_style.dart';
import 'package:provaflutter_targetsistemas/common/widgets/privacy_policies.dart';
import 'package:provaflutter_targetsistemas/features/capture_infos/viewModel/capture_info_store.dart';
import 'package:provider/provider.dart';

class CaptureInfosPage extends StatefulWidget {
  const CaptureInfosPage({super.key});

  @override
  State<CaptureInfosPage> createState() => _CaptureInfosPageState();
}

class _CaptureInfosPageState extends State<CaptureInfosPage> {
  final TextEditingController _textController = TextEditingController();
  final privacyPoliciesButton = PrivacyPolicies();

  @override
  Widget build(BuildContext context) => Scaffold(body: body);

  Widget get body {
    return Container(
      decoration: const BoxDecoration(gradient: AppStyle.backgroundColorLinearGradient),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              child: content,
            ),
            privacyPoliciesButton.privacyPoliciesButton
          ],
        ),
      ),
    );
  }

  Widget get content {
    final captureInfoStore = Provider.of<CaptureInfoStore>(context);
    double heightResponsive = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 0.04 * heightResponsive),
          Observer(
            builder: (context) => buildInfoListView(
              captureInfoStore.infoList,
              captureInfoStore,
            ),
          ),
          SizedBox(height: 0.04 * heightResponsive),
          addTextButton,
          SizedBox(height: 0.06 * heightResponsive),
        ],
      ),
    );
  }

  Widget buildInfoListView(List<String> infoList, CaptureInfoStore captureInfoStore) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppStyle.primaryColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListView.builder(
          itemCount: infoList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                buildInfoListTile(
                  infoList[index],
                  () => _showEditDialog(context, index, captureInfoStore),
                  () async => _showDeleteDialog(context, index, captureInfoStore),
                ),
                if (index < infoList.length - 1) const Divider(thickness: 2),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildInfoListTile(String text, VoidCallback onEdit, VoidCallback onDelete) {
    return Column(
      children: [
        ListTile(
          title: Center(child: Text(text, style: AppStyle.infoTextStyle)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: AppStyle.secondaryColor),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: AppStyle.accentColor),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get addTextButton {
    double widthResponsive = MediaQuery.of(context).size.width;
    double heightResponsive = MediaQuery.of(context).size.height;
    return SizedBox(
      width: widthResponsive * 0.835,
      height: heightResponsive * 0.08,
      child: ElevatedButton(
        onPressed: () => _showInputDialog(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyle.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        child: const Text(
          'Digite seu texto',
          style: TextStyle(
            color: AppStyle.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Future<void> _showInputDialog(BuildContext context) async {
    final captureInfoStore = Provider.of<CaptureInfoStore>(context, listen: false);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Digite seu Texto', style: AppStyle.infoTextStyle),
          content: TextField(controller: _textController, style: AppStyle.infoTextStyle),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      captureInfoStore.addInfo(_textController.text);
                      _textController.clear();
                      captureInfoStore.showSnackBar(context, 'Criado com sucesso.');
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(BuildContext context, int index, CaptureInfoStore captureInfoStore) async {
    _textController.text = captureInfoStore.infoList[index];

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Editar Texto', style: AppStyle.infoTextStyle)),
          content: TextField(controller: _textController, style: AppStyle.infoTextStyle),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _textController.clear();
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      captureInfoStore.editInfo(index, _textController.text);
                      _textController.clear();
                      captureInfoStore.showSnackBar(context, 'Editado com sucesso.');
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, int index, CaptureInfoStore captureInfoStore) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Confirmação', style: AppStyle.infoTextStyle)),
          content: const Text(
            'Deseja excluir esta informação?',
            style: AppStyle.infoTextStyle,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    captureInfoStore.removeInfo(index);
                    captureInfoStore.showSnackBar(context, 'Removido com sucesso.');
                    Navigator.of(context).pop();
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
