import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String login = '';

  @observable
  String loginError = '';

  @observable
  String password = '';

  @observable
  String passwordError = '';

  @action
  void setLogin(String value) => login = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void validateLogin() {
    if (login.isEmpty) {
      loginError = 'Nome de usuário não pode estar vazio';
    } else if (login.length > 20) {
      loginError = 'Nome de usuário deve ter menos de 20 caracteres';
    } else if (login.length < 2) {
      loginError = 'Nome de usuário deve ter pelo menos 2 caracteres';
    } else if (login.contains(' ')) {
      loginError = 'Nome de usuário não pode conter espaços';
    } else {
      loginError = '';
    }
  }

  @action
  void validatePassword() {
    if (password.isEmpty) {
      passwordError = 'Campo de senha não pode estar vazio';
    } else if (password.length < 2) {
      passwordError = 'Senha deve ter pelo menos 2 caracteres';
    } else if (password.length > 20) {
      passwordError = 'Senha deve ter menos de 20 caracteres';
    } else if (!isPasswordValid) {
      passwordError = 'Senha deve conter apenas letras e números';
    } else if (password.contains(' ')) {
      passwordError = 'Senha não pode conter espaços';
    } else {
      passwordError = '';
    }
  }

  @computed
  bool get isFormValid =>
      login.isNotEmpty &&
      login.length <= 20 &&
      !login.contains(' ') &&
      password.length >= 2 &&
      password.length <= 20 &&
      isPasswordValid &&
      !password.contains(' ');

  @computed
  bool get isPasswordValid => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password);
}