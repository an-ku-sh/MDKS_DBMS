//Dependencies
import 'package:flutter/material.dart';
import 'package:mdks/DataBaseBackend/json_api.dart';

//Packages

//
List listOfPlaySchoolObjectParameters = [
  'mname',
  'admdt',
  'fphone',
  'mphone',
  'admno',
  'bldgrp',
  'faadhar',
  'maadhar',
  'address',
  'feeT1',
  'feeT1Amt',
  'feeT1Dt',
  'feeT1Rno',
  'feeT2',
  'feeT2Amt',
  'feeT2Dt',
  'feeT2Rno',
  'feeT3',
  'feeT3Amt',
  'feeT3Dt',
  'feeT3Rno',
  'feeT4',
  'feeT4Amt',
  'feeT4Dt',
  'feeT4Rno',
  'feeT5',
  'feeT5Amt',
  'feeT5Dt',
  'feeT5Rno',
  'feeT6',
  'feeT6Amt',
  'feeT6Dt',
  'feeT6Rno',
  'feeT7',
  'feeT7Amt',
  'feeT7Dt',
  'feeT7Rno',
  'feeT8',
  'feeT8Amt',
  'feeT8Dt',
  'feeT8Rno',
  'feeT9',
  'feeT9Amt',
  'feeT9Dt',
  'feeT9Rno',
  'feeT10',
  'feeT10Amt',
  'feeT10Dt',
  'feeT10Rno',
  'feeT11',
  'feeT11Amt',
  'feeT11Dt',
  'feeT11Rno',
  'feeT12',
  'feeT12Amt',
  'feeT12Dt',
  'feeT12Rno'
];
// allStudents == a worksheet
List allStudents = [];

//ViewUpdateExport(){}
class ViewUpdateExport extends StatefulWidget {
  const ViewUpdateExport({super.key});

  @override
  State<ViewUpdateExport> createState() => _ViewUpdateExportState();
}

class _ViewUpdateExportState extends State<ViewUpdateExport> {
  //Drop Down
  String selectedItem = listOfWorksheets[0];

  setStudentList(String jsonFileName) async {
    List l = await returnJsonObjectList(jsonFileName);
    if (mounted) {
      setState(() {
        allStudents = l;
        foundStudents = allStudents;
      });
    }
  }

  //Sorting

  // This list holds the data for the list view
  List foundStudents = [];

  //init()
  @override
  initState() {
    setStudentList(listOfWorksheets[0]);
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allStudents;
    } else {
      results = allStudents
          .where((student) => student.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundStudents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    setStudentList(selectedItem);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade300,
        title: const Text('View Student Record'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 240,
              child: DropdownButtonFormField(
                alignment: Alignment.centerLeft,
                items: listOfWorksheets
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                value: selectedItem,
                onChanged: (item) => setState(
                  () {
                    selectedItem = item!;
                    setStudentList(selectedItem);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: foundStudents.isNotEmpty
                  ? ListView.builder(
                      itemCount: foundStudents.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          title: Text(foundStudents[index].name.toString()),
                          subtitle:
                              Text(foundStudents[index].fnamephone.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          //scrollable: true,
                                          title: const Text('Student Info'),
                                          content:
                                              //checking Worksheet Type
                                              selectedItem
                                                      .contains('playschool')
                                                  //Playschool Type
                                                  ? Container(
                                                      color:
                                                          Colors.amber.shade100,
                                                      height: 800,
                                                      width: 1100,
                                                      child: Column(
                                                        children: [
                                                          //Student Name
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 4),
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              height: 40,
                                                              width: 1100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Colors
                                                                    .white54,
                                                              ),
                                                              child: Text(
                                                                  'Student Name: ${foundStudents[index].name}'),
                                                            ),
                                                          ),
                                                          //Fname/Phone
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 4),
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              height: 40,
                                                              width: 1100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Colors
                                                                    .white54,
                                                              ),
                                                              child: Text(
                                                                  'Father\'s Name \\ Phone Number : ${foundStudents[index].fnamephone}'),
                                                            ),
                                                          ),
                                                          //Editable Fields Dynamic
                                                          Expanded(
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  listOfPlaySchoolObjectParameters
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      Card(
                                                                elevation: 1,
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        2),
                                                                child: ListTile(
                                                                  title: Text(
                                                                      '${listOfPlaySchoolObjectParameters[index]}'),
                                                                  trailing:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Edit ?? ${listOfPlaySchoolObjectParameters[index]}'),
                                                                                  );
                                                                                });
                                                                          },
                                                                          icon:
                                                                              const Icon(Icons.edit_note_outlined)),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  //Genric Type
                                                  : Container(
                                                      height: 800,
                                                      width: 1100,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            color: Colors
                                                                .greenAccent,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.info_outline)),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                          'Are Your Sure You Want to Delete ${foundStudents[index].name} from $selectedItem'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            //Deleting The Student Record
                                            deleteStudentRecord(
                                                selectedItem,
                                                foundStudents[index].name,
                                                foundStudents[index]
                                                    .fnamephone);
                                            //refreshing the UI
                                            //Closing the Alert Dialogue
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Confirm'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results Found',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// trailing: IconButton(
//     onPressed: () {
// foundStudents[index].feeT1 =
//     'debugFeeT1 has been paid';
// print('changed debug parameters');
// print(selectedItem);
// writeJsonFile(
//   selectedItem,
//   foundStudents[index].name.toString(),
//   foundStudents[index].fnamephone.toString(),
//   foundStudents[index],
// );
// print(
//   '${foundStudents[index].name.toString()} is modified',
// );
// },
// icon: const Icon(Icons.info_rounded)),
