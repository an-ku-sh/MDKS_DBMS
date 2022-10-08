//dependencies
import 'dart:io';
import 'package:mdks/DataBaseBackend/DataModels/generic_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

//Packages
import 'package:mdks/DataBaseBackend/DataModels/playschool_data.model.dart';

import '../ScaffoldPages/View_Update/view_update_export.dart';

//Global fields
List<String> listOfWorksheets = [];
String jsonFilesDir = '';

Future<String> returnJsonDirPath() async {
  var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  String documentDirectoryPath = applicationDocumentsDirectory.path;
  //Directory mdksDir = Directory('$documentDirectoryPath\\mdks');
  jsonFilesDir = '$documentDirectoryPath\\mdks';
  return jsonFilesDir;
}

//Func() to Return list of Worksheets
Future<List<String>> createListOfWorksheets() async {
  //Getting the path to User Documents Directory
  var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  String documentDirectoryPath = applicationDocumentsDirectory.path;

  //Getting the path to application files directory
  Directory mdksDir = Directory('$documentDirectoryPath\\mdks');
  jsonFilesDir = '$documentDirectoryPath\\mdks';
  //print(jsonFilesDir);
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
  //print(listOfJsonFileNames);
  return listOfJsonFileNames;
}

initializeJsonAPI() async {
  //initializing list of worksheets
  List<String> l = await createListOfWorksheets();
  listOfWorksheets = l;
  //list of json files

  //setting default worksheet
  List l2 = await returnJsonObjectList(listOfWorksheets[1]);
  allStudents = l2;
  //list of  [Instance of 'PlaySchoolDataModel', Instance of 'PlaySchoolDataModel', Instance of 'PlaySchoolDataModel']
  print(allStudents);
}

Future<List> returnJsonObjectList(String jsonFileName) async {
  //Accessing the Json File
  String dir = await returnJsonDirPath();
  File file = File('$dir\\$jsonFileName');
  String jsonData = await file.readAsString();

  //decoding the Json File
  final listFromJson = json.decode(jsonData) as List<dynamic>;

  //print(listFromJson.map((e) => ProductDataModel.fromJson(e)).toList()[0].name);
  if (jsonFileName.toLowerCase().contains('playschool')) {
    return listFromJson.map((e) => PlaySchoolDataModel.fromJson(e)).toList();
  } else {
    return listFromJson.map((e) => GenericInstitute.fromJson(e)).toList();
  }
}

writeJsonFile(String jsonFileName) async {
  //debug Data input
  final PlaySchoolDataModel _playSchoolDataModel =
      PlaySchoolDataModel(name: 'encodedName1', fnamephone: 'encodedfname1');

  //Accessing the Json File/ Worksheet
  String dir = await returnJsonDirPath();
  File _file = File('$dir\\$jsonFileName');

  //Converting the Json file to a list<Model Type>
  List l = await returnJsonObjectList(jsonFileName);
  print(l);
  
  //Writing to the Json File
  //await _file.writeAsString(json.encode(_playSchoolDataModel));
  //return _playSchoolDataModel;
}
