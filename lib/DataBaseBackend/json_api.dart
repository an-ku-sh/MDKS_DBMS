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
  print(jsonFilesDir);
  //making a list of all files inside directory
  List<FileSystemEntity> allFilesInDir = mdksDir.listSync();
  print(allFilesInDir);

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
  List l2 = await returnJsonObjectList(listOfWorksheets[0]);
  allStudents = l2;
  //list of  [Instance of 'PlaySchoolDataModel', Instance of 'PlaySchoolDataModel', Instance of 'PlaySchoolDataModel']
  //print(allStudents);
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

updateStudentRecord(
    {
    //Identifier Parameters
    required String jsonFileName,
    required String sname,
    required String fnamephone,
    //Data Object
    var studentDataObject}) async {
  //Accessing the Json File/ Worksheet
  String dir = await returnJsonDirPath();
  File _file = File('$dir\\$jsonFileName');

  //Converting the Json file to a list<Model Type>
  List l = await returnJsonObjectList(jsonFileName);

  //the index of the Data Object in the List
  int? indexOfDataObject;
  //Accessing the DataObject
  for (var j = 0; j < l.length; j++) {
    if (l[j].StudentName.toString() == sname &&
        l[j].FatherNamePhone.toString() == fnamephone) {
      //The DataObject's index
      indexOfDataObject = j;
    }
  }

  //writing change to List
  if (indexOfDataObject != null) {
    l[indexOfDataObject] = studentDataObject;
    print('Student Data Onbject ${studentDataObject.StudentName} set ');
  }

  //Writing the entire list to the Json File as a string
  await _file.writeAsString(json.encode(l));
}

createStudentRecord(
  //File identifier
  String jsonFileName,
  //Fields
  String sname,
  String fnamephone,
) async {
  //Accessing the Json File/ Worksheet
  String dir = await returnJsonDirPath();
  File _file = File('$dir\\$jsonFileName');

  //Converting the Json file to a list<Model Type>
  List l = await returnJsonObjectList(jsonFileName);

  if (jsonFileName.contains('playschool')) {
    PlaySchoolDataModel playSchoolDataModel =
        PlaySchoolDataModel(StudentName: sname, FatherNamePhone: fnamephone);
    l.add(playSchoolDataModel);
  } else {
    GenericInstitute genericInstitute =
        GenericInstitute(StudentName: sname, FatherNamePhone: fnamephone);
    l.add(genericInstitute);
  }

  //Writing the entire list to the Json File as a string
  await _file.writeAsString(json.encode(l));
}

deleteStudentRecord(
  //Identifier Parameters
  String jsonFileName,
  String sname,
  String fnamephone,
) async {
  //Accessing the Json File/ Worksheet
  String dir = await returnJsonDirPath();
  File _file = File('$dir\\$jsonFileName');

  //Converting the Json file to a list<Model Type>
  List l = await returnJsonObjectList(jsonFileName);

  //the index of the Data Object in the List to be deleted
  int? indexOfDataObject;

  //Accessing the index of DataObject to be deleted
  for (var j = 0; j < l.length; j++) {
    if (l[j].StudentName.toString() == sname &&
        l[j].FatherNamePhone.toString() == fnamephone) {
      //The DataObject's index
      indexOfDataObject = j;
    }
  }

  //deleting the object from the List
  if (indexOfDataObject != null) {
    l.remove(l[indexOfDataObject]);
  }

  //Writing the entire list to the Json File as a string
  await _file.writeAsString(json.encode(l));

  //returning the updated file
  List l3 = await returnJsonObjectList(jsonFileName);
  return l3;
}
