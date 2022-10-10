//Dependencies
import 'package:flutter/material.dart';
import 'package:mdks/DataBaseBackend/json_api.dart';

//Packages

//
List listOfPlaySchoolObjectParameters = [
  'MotherName',
  'AdmissionDate',
  'FatherPhone',
  'MotherPhone',
  'AdmissionNo',
  'BloodGroup',
  'FatherAadhar',
  'MotherAadhar',
  'Address',
  'FeeTerm1',
  'FeeAmountTerm1',
  'FeePaymentDateTerm1',
  'FeeReceiptNoTerm1',
  'FeeTerm2',
  'FeeAmountTerm2',
  'FeePaymentDateTerm2',
  'FeeReceiptNoTerm2',
  'FeeTerm3',
  'FeeAmountTerm3',
  'FeePaymentDateTerm3',
  'FeeReceiptNoTerm3',
  'FeeTerm4',
  'FeeAmountTerm4',
  'FeePaymentDateTerm4',
  'FeeReceiptNoTerm4',
  'FeeTerm5',
  'FeeAmountTerm5',
  'FeePaymentDateTerm5',
  'FeeReceiptNoTerm5',
  'FeeTerm6',
  'FeeAmountTerm6',
  'FeePaymentDateTerm6',
  'FeeReceiptNoTerm6',
  'FeeTerm7',
  'FeeAmountTerm7',
  'FeePaymentDateTerm7',
  'FeeReceiptNoTerm7',
  'FeeTerm8',
  'FeeAmountTerm8',
  'FeePaymentDateTerm8',
  'FeeReceiptNoTerm8',
  'FeeTerm9',
  'FeeAmountTerm9',
  'FeePaymentDateTerm9',
  'FeeReceiptNoTerm9',
  'FeeTerm10',
  'FeeAmountTerm10',
  'FeePaymentDateTerm10',
  'FeeReceiptNoTerm10',
  'FeeTerm11',
  'FeeAmountTerm11',
  'FeePaymentDateTerm11',
  'FeeReceiptNoTerm11',
  'FeeTerm12',
  'FeeAmountTerm12',
  'FeePaymentDateTerm12',
  'FeeReceiptNoTerm12',
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
  //Update
  var fieldValueAfterUpdate;
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
          .where((student) => student.StudentName.toString()
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
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
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
                          title:
                              Text(foundStudents[index].StudentName.toString()),
                          subtitle: Text(
                              foundStudents[index].FatherNamePhone.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //The Icon Button that opens Student info
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
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
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: Colors
                                                                      .white54),
                                                              child: Text(
                                                                  'Student Name: ${foundStudents[index].StudentName}'),
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
                                                                  'Father\'s Name \\ Phone Number : ${foundStudents[index].FatherNamePhone}'),
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
                                                                          i) =>
                                                                      Card(
                                                                elevation: 1,
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        2),
                                                                child: ListTile(
                                                                  title: Text(
                                                                      '${listOfPlaySchoolObjectParameters[i]}'),
                                                                  trailing:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return AlertDialog(
                                                                                  title: Text('Edit ?? ${listOfPlaySchoolObjectParameters[i]}'),
                                                                                  content: TextField(
                                                                                    onChanged: (value) {
                                                                                      fieldValueAfterUpdate = value;
                                                                                    },
                                                                                  ),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        foundStudents[index].FeeTerm3 = 'deeebuggg';
                                                                                        print(foundStudents[index].FeeTerm3);
                                                                                        updateStudentRecord(
                                                                                          jsonFileName: selectedItem,
                                                                                          sname: foundStudents[index].StudentName,
                                                                                          fnamephone: foundStudents[index].FatherNamePhone,
                                                                                          studentDataObject: foundStudents[index],
                                                                                        );
                                                                                      },
                                                                                      child: const Text(
                                                                                        'Submit',
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
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
                                          'Are Your Sure You Want to Delete ${foundStudents[index].StudentName} from $selectedItem'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setStudentList(selectedItem);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            //Deleting The Student Record
                                            deleteStudentRecord(
                                                selectedItem,
                                                foundStudents[index]
                                                    .StudentName,
                                                foundStudents[index]
                                                    .FatherNamePhone);
                                            //refreshing the UI
                                            // setStudentList(selectedItem);
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
