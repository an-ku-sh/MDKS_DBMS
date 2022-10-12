import 'package:flutter/material.dart';
import 'package:mdks/DataBaseBackend/json_api.dart';
import 'package:mdks/ScaffoldPages/View_Update/pdf_api.dart';
import 'package:mdks/ScaffoldPages/View_Update/pdf_invoice_api.dart';
import 'package:mdks/ScaffoldPages/View_Update/view_update_export.dart';

import '../../DataBaseBackend/DataModels/generic_data_model.dart';
import '../../DataBaseBackend/DataModels/playschool_data.model.dart';

String worksheetName = '';
var studentDataModelObject;
String valueafterchangeee = '';

// Map<String, dynamic> mapObjFromStudentObj = studentDataModelObject.toJson();
Map<String, dynamic>? mapObj;

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  //Class level fields & methods

  //Updating Field Values
  setStudentFieldValue(
      {required String worksheetName,
      required Map<String, dynamic> mapFromStdObj,
      required String fieldName,
      required String fieldVal}) {
    mapFromStdObj[fieldName] = fieldVal;
    //converting map back to json
    if (worksheetName.toLowerCase().contains('playschool')) {
      PlaySchoolDataModel playSchoolDataModel =
          PlaySchoolDataModel.fromJson(mapFromStdObj);
      return playSchoolDataModel;
    } else {
      GenericInstitute genericInstitute =
          GenericInstitute.fromJson(mapFromStdObj);
      return genericInstitute;
    }
  }

  @override
  void initState() {
    Map<String, dynamic> mapObjFromStudentObj = studentDataModelObject.toJson();
    mapObj = mapObjFromStudentObj;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //inside build
    return AlertDialog(
      title: const Text('View Student Record'),
      content: worksheetName.toLowerCase().contains('playschool')
          //PlaySchool
          ? Container(
              color: Colors.amber.shade100,
              height: 800,
              width: 1100,
              child: Column(
                children: [
                  //Student Name
                  //Father Name / Phone No
                  //List Of Editable Fields dynamic
                  Expanded(
                    child: ListView.builder(
                      itemCount: listOfPlaySchoolObjectParameters.length,
                      itemBuilder: ((context, i) => ListTile(
                            title: Text(
                              '${listOfPlaySchoolObjectParameters[i]} : ${mapObj!["${listOfPlaySchoolObjectParameters[i]}"]}',
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Edit ?? ${listOfPlaySchoolObjectParameters[i]}'),
                                          content: TextField(
                                            onChanged: (value) {
                                              valueafterchangeee = value;
                                            },
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () async {
                                                  var studentDataObj =
                                                      await setStudentFieldValue(
                                                          worksheetName:
                                                              worksheetName,
                                                          mapFromStdObj:
                                                              mapObj!,
                                                          fieldName:
                                                              "${listOfPlaySchoolObjectParameters[i]}",
                                                          fieldVal:
                                                              valueafterchangeee);
                                                  //debug
                                                  setState(() {
                                                    studentDataModelObject =
                                                        studentDataObj;
                                                    Map<String, dynamic>
                                                        mapObjFromStudentObj =
                                                        studentDataModelObject
                                                            .toJson();
                                                    mapObj =
                                                        mapObjFromStudentObj;
                                                  });
                                                  updateStudentRecord(
                                                      jsonFileName:
                                                          worksheetName,
                                                      sname:
                                                          studentDataModelObject
                                                              .StudentName,
                                                      fnamephone:
                                                          studentDataModelObject
                                                              .FatherNamePhone,
                                                      studentDataObject:
                                                          studentDataObj);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Submit'))
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.edit)),
                          )),
                    ),
                  ),
                ],
              ),
            )
          //Generic
          : Container(
              color: Colors.orange.shade100,
              height: 800,
              width: 1100,
            ),
      actions: [
        TextButton(
          onPressed: () async {
            //Generating the invoice
            final pdfFile = await PdfInvoiceAPI.generatePdf(
              mapObj!,
            );
            //Opening the invoice
            PdfApi.openFile(pdfFile);
          },
          child: const Text('Export Invoice'),
        )
      ],
    );
  }
}
