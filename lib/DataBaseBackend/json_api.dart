//dependencies
import 'dart:io';
import 'package:flutter/services.dart' as services;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

//Packages
import '../DataBaseBackend/product_data_model.dart';
import '../ScaffoldPages/View_Update/view_update_export.dart';

//GLobal fields
List<String> listOfWorksheets = [];
String jsonFilesDir = '';

//Func() to Return list of Worksheets
Future<List<String>> createListOfWorksheets() async {
  //Getting the path to User Documents Directory
  var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  String documentDirectoryPath = applicationDocumentsDirectory.path;

  //Getting the path to application files directory
  Directory mdksDir = Directory('$documentDirectoryPath\\mdks');
  jsonFilesDir = '$documentDirectoryPath\\mdks';

  //making a list of all files inside directory
  List<FileSystemEntity> allFilesInDir = mdksDir.listSync();
  //print(allFilesInDir);

  //making an empty list for storing json file names
  List<String> listOfJsonFileNames = [];

  //Iterator Loop for appending .json files to the listOfJsonFileNames[];
  for (FileSystemEntity file in allFilesInDir) {
    if (file.path.toLowerCase().contains('json')) {
      listOfJsonFileNames.add(file.path.split(r'\').last);
    }
  }
  //returning the file containing names of Json files
  return listOfJsonFileNames;
}

//Func() to return a List<ProductDataModel>
Future<List<ProductDataModel>> readJsonData(String jsonFileName) async {
  final jsonData =
      await services.rootBundle.loadString(jsonFilesDir + '\\$jsonFileName');
  final listFromJson = json.decode(jsonData) as List<dynamic>;
  //print(listFromJson.map((e) => ProductDataModel.fromJson(e)).toList()[0].name);
  return listFromJson.map((e) => ProductDataModel.fromJson(e)).toList();
}

initializeListOfWorkSheets() async {
  List<String> l = await createListOfWorksheets();
  listOfWorksheets = l;
  //print(listOfWorksheets);
  allUsers = await readJsonData(l[0]);
}

createWorksheet() {}
