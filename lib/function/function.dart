import 'package:flutter/material.dart';
import 'package:googlekeep/model/model.dart';

import 'package:hive/hive.dart';

ValueNotifier<List<googleKeep>> googleNotifier = ValueNotifier([]);

Future addData(googleKeep value) async {
  final googleDB = await Hive.openBox<googleKeep>('database');
  googleDB.add(value);
  getAllDAta();
}

Future getAllDAta() async {
  final googleDB = await Hive.openBox<googleKeep>('database');
  googleNotifier.value.clear();
  googleNotifier.value.addAll(googleDB.values);
  googleNotifier.notifyListeners();
}

Future deleteData(int index) async {
  final googleDB = await Hive.openBox<googleKeep>('database');
  googleDB.deleteAt(index);
  getAllDAta();
}

Future<void> editing(index, googleKeep value) async {
  final googleDB = await Hive.openBox<googleKeep>('database');
  googleDB.putAt(index, value);
  getAllDAta();
}
