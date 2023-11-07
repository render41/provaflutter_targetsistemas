// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CaptureInfoStore on _CaptureInfoStore, Store {
  late final _$infoListAtom =
      Atom(name: '_CaptureInfoStore.infoList', context: context);

  @override
  ObservableList<String> get infoList {
    _$infoListAtom.reportRead();
    return super.infoList;
  }

  @override
  set infoList(ObservableList<String> value) {
    _$infoListAtom.reportWrite(value, super.infoList, () {
      super.infoList = value;
    });
  }

  late final _$_CaptureInfoStoreActionController =
      ActionController(name: '_CaptureInfoStore', context: context);

  @override
  void addInfo(String info) {
    final _$actionInfo = _$_CaptureInfoStoreActionController.startAction(
        name: '_CaptureInfoStore.addInfo');
    try {
      return super.addInfo(info);
    } finally {
      _$_CaptureInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInfo(int index) {
    final _$actionInfo = _$_CaptureInfoStoreActionController.startAction(
        name: '_CaptureInfoStore.removeInfo');
    try {
      return super.removeInfo(index);
    } finally {
      _$_CaptureInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showSnackBar(BuildContext context, String message) {
    final _$actionInfo = _$_CaptureInfoStoreActionController.startAction(
        name: '_CaptureInfoStore.showSnackBar');
    try {
      return super.showSnackBar(context, message);
    } finally {
      _$_CaptureInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editInfo(int index, String newInfo) {
    final _$actionInfo = _$_CaptureInfoStoreActionController.startAction(
        name: '_CaptureInfoStore.editInfo');
    try {
      return super.editInfo(index, newInfo);
    } finally {
      _$_CaptureInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infoList: ${infoList}
    ''';
  }
}
