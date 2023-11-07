import 'package:flutter/material.dart';
import 'package:provaflutter_targetsistemas/common/style/app_style.dart';
import 'package:provaflutter_targetsistemas/common/widgets/privacy_policies.dart';
import 'package:provaflutter_targetsistemas/features/login/view/widgets/login_textfield.dart';
import 'package:provaflutter_targetsistemas/features/login/viewModel/login_store.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: contentForm,
            ),
            privacyPoliciesButton.privacyPoliciesButton
          ],
        ),
      ),
    );
  }

  Widget get contentForm {
    final loginStore = Provider.of<LoginStore>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loginTextField(
          context,
          onChanged: (value) => setState(() {
              loginStore.setLogin(value);
              loginStore.validateLogin();
            }),
          widthResponsive: 0.75,
          text: 'Usuário',
          errorText: loginStore.loginError,
          icon: const Icon(Icons.person, color: AppStyle.secondaryColor),
          obscureText: false,
        ),
        const SizedBox(height: 20),
        loginTextField(
          context,
          onChanged: (value) => setState(() {
              loginStore.setPassword(value);
              loginStore.validatePassword();
            }),
          widthResponsive: 0.75,
          text: 'Senha',
          errorText: loginStore.passwordError,
          icon: const Icon(Icons.lock, color: AppStyle.secondaryColor),
          obscureText: true,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () => (loginStore.isFormValid)
              ? Navigator.pushNamed(context, '/capture_infos')
              : null,
          style: ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
          child: const Text('Entrar', style: TextStyle(fontSize: 17)),
        ),
      ],
    );
  }
}
