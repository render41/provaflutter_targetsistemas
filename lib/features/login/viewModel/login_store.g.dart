// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;

  late final _$loginAtom = Atom(name: '_LoginStore.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$loginErrorAtom =
      Atom(name: '_LoginStore.loginError', context: context);

  @override
  String get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(String value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_LoginStore.passwordError', context: context);

  @override
  String get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setLogin(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLogin() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validateLogin');
    try {
      return super.validateLogin();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
loginError: ${loginError},
password: ${password},
passwordError: ${passwordError},
isFormValid: ${isFormValid},
isPasswordValid: ${isPasswordValid}
    ''';
  }
}
