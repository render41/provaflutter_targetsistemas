import 'package:flutter_test/flutter_test.dart';
import 'package:provaflutter_targetsistemas/features/capture_infos/viewModel/capture_info_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('CaptureInfoStore', () {
    test('Adicionar informação', () async {
      SharedPreferences.setMockInitialValues({});
      final store = CaptureInfoStore();
      store.addInfo('Teste');
      expect(store.infoList, contains('Teste'));
    });

    test('Remover informação', () async {
      final store = CaptureInfoStore();
      store.addInfo('Teste');
      store.removeInfo(0);
      expect(store.infoList, isEmpty);
    });

    test('Editar informação', () async {
      final store = CaptureInfoStore();
      store.addInfo('Teste');
      store.editInfo(0, 'Teste Editado');
      expect(store.infoList, contains('Teste Editado'));
    });
  });
}
