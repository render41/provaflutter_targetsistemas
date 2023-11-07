import 'package:flutter_test/flutter_test.dart';
import 'package:provaflutter_targetsistemas/features/login/viewModel/login_store.dart';

void main() {
  group('LoginStore', () {
    test('Validação de Login', () {
      final store = LoginStore();

      store.setLogin('');
      store.validateLogin();
      expect(store.loginError, 'Nome de usuário não pode estar vazio');

      store.setLogin('loginestáficandolongopracarambaeemexcesso');
      store.validateLogin();
      expect(store.loginError, 'Nome de usuário deve ter menos de 20 caracteres');

      store.setLogin('a');
      store.validateLogin();
      expect(store.loginError, 'Nome de usuário deve ter pelo menos 2 caracteres');

      store.setLogin('login com espaço');
      store.validateLogin();
      expect(store.loginError, 'Nome de usuário não pode conter espaços');

      store.setLogin('loginvalido');
      store.validateLogin();
      expect(store.loginError, '');
    });

    test('Validação de Senha', () {
      final store = LoginStore();

      store.setPassword('');
      store.validatePassword();
      expect(store.passwordError, 'Campo de senha não pode estar vazio');

      store.setPassword('a');
      store.validatePassword();
      expect(store.passwordError, 'Senha deve ter pelo menos 2 caracteres');

      store.setPassword('senhamuitolongaquenaoévalida');
      store.validatePassword();
      expect(store.passwordError, 'Senha deve ter menos de 20 caracteres');

      store.setPassword('senha@invalida');
      store.validatePassword();
      expect(store.passwordError, 'Senha deve conter apenas letras e números');

      store.setPassword('senha com espaço');
      store.validatePassword();
      expect(store.passwordError, 'Senha deve conter apenas letras e números');

      store.setPassword('senhavalida123');
      store.validatePassword();
      expect(store.passwordError, '');
    });

    test('Validação de Formulário', () {
      final store = LoginStore();

      store.setLogin('');
      store.setPassword('');
      expect(store.isFormValid, false);

      store.setLogin('usuarioteste');
      store.setPassword('senhateste');
      expect(store.isFormValid, true);
    });
  });
}
