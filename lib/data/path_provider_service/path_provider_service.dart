import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:iterview_test/data/models/to_do_data_model.dart';

class PathProviderService {
  Future<void> addToDo(String title, String date) async {
    final appDir = await getApplicationDocumentsDirectory();
    final appDocPath = "${appDir.path}/fileName.json";
    final file = File(appDocPath);

    List<Map<String, dynamic>> toDoList = [];

      final jsonString = await file.readAsString();
      toDoList = List<Map<String, dynamic>>.from(jsonDecode(jsonString));
    
    final newToDo = {
      "title": title,
      "due_date": date,
    };
    toDoList.add(newToDo);
    await file.writeAsString(jsonEncode(toDoList));
  }

  

  Future<List<ToDoDataModel>> getToDo() async {
    final appDir = await getApplicationDocumentsDirectory();
    final appDocPath = "${appDir.path}/fileName.json";
    final file = File(appDocPath);

    
      final jsonString = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<ToDoDataModel> toDoList = jsonList
          .map((jsonItem) => ToDoDataModel.fromJson(Map<String, dynamic>.from(jsonItem)))
          .toList();
      return toDoList;
    
  }
}
