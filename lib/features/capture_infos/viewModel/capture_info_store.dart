import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'capture_info_store.g.dart';

class CaptureInfoStore = _CaptureInfoStore with _$CaptureInfoStore;

abstract class _CaptureInfoStore with Store {
  @observable
  ObservableList<String> infoList = ObservableList<String>();

  @action
  void addInfo(String info) {
    infoList.add(info);
    _saveInfoList();
  }

  @action
  void removeInfo(int index) {
    infoList.removeAt(index);
    _saveInfoList();
  }

  @action
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @action
  void editInfo(int index, String newInfo) {
    infoList[index] = newInfo;
    _saveInfoList();
  }

  Future<void> _saveInfoList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('infoList', infoList.toList());
  }

  Future<void> loadInfoList() async {
    final prefs = await SharedPreferences.getInstance();
    final savedInfoList = prefs.getStringList('infoList') ?? [];
    infoList = ObservableList<String>.of(savedInfoList);
  }
}