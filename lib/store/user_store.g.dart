// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_UserStore.isFormValid'))
          .value;

  late final _$emailAtom = Atom(name: '_UserStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_UserStore.password', context: context);

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

  late final _$nameAtom = Atom(name: '_UserStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$cpfAtom = Atom(name: '_UserStore.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$userIdAtom = Atom(name: '_UserStore.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$isRegisteredAtom =
      Atom(name: '_UserStore.isRegistered', context: context);

  @override
  bool get isRegistered {
    _$isRegisteredAtom.reportRead();
    return super.isRegistered;
  }

  @override
  set isRegistered(bool value) {
    _$isRegisteredAtom.reportWrite(value, super.isRegistered, () {
      super.isRegistered = value;
    });
  }

  late final _$isLoggedinAtom =
      Atom(name: '_UserStore.isLoggedin', context: context);

  @override
  String get isLoggedin {
    _$isLoggedinAtom.reportRead();
    return super.isLoggedin;
  }

  @override
  set isLoggedin(String value) {
    _$isLoggedinAtom.reportWrite(value, super.isLoggedin, () {
      super.isLoggedin = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UserStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<UserModel?> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setLogin(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mostrarDados() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.mostrarDados');
    try {
      return super.mostrarDados();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addRegisteredUser(UserModel user) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.addRegisteredUser');
    try {
      return super.addRegisteredUser(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  UserModel? getUserById(String userId) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getUserById');
    try {
      return super.getUserById(userId);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveUser() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.saveUser');
    try {
      return super.saveUser();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUserProfile(String userId) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updateUserProfile');
    try {
      return super.updateUserProfile(userId);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
cpf: ${cpf},
userId: ${userId},
isRegistered: ${isRegistered},
isLoggedin: ${isLoggedin},
errorMessage: ${errorMessage},
isFormValid: ${isFormValid}
    ''';
  }
}
