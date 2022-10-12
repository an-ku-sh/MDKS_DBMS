//Dependencies
import 'package:flutter/material.dart';
import 'package:mdks/ScaffoldPages/View_Update/student_info.dart';
//Packages
import '../../DataBaseBackend/DataModels/generic_data_model.dart';
import '../../DataBaseBackend/DataModels/playschool_data.model.dart';
import '../../DataBaseBackend/json_api.dart';
import '/ScaffoldPages/View_Update/pdf_api.dart';
import '/ScaffoldPages/View_Update/pdf_invoice_api.dart';

//Top Level Fields & Methods

// allStudents == a worksheet
List allStudents = [];

recallStudentInfo() {
  print('recallStudentInfo called');
  return StudentInfo();
}

//The Stateful Widget
class ViewUpdateExport extends StatefulWidget {
  const ViewUpdateExport({super.key});

  @override
  State<ViewUpdateExport> createState() => _ViewUpdateExportState();
}

class _ViewUpdateExportState extends State<ViewUpdateExport> {
  //class Level Fields / Methods

  //Drop Down
  String selectedItem = listOfWorksheets[0];

  //Sorting

  // This list holds the data for the list view
  List foundStudents = [];

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space,
      //we'll display all users
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

  void setStudentList(String jsonFileName) async {
    List l = await returnJsonObjectList(jsonFileName);
    if (mounted) {
      setState(() {
        allStudents = l;
        foundStudents = allStudents;
      });
    }
  }

  @override
  initState() {
    setStudentList(listOfWorksheets[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //setStudentList(selectedItem);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade300,
        title: const Text('View Student Record'),
        actions: [
          //The Drop Down Button
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
      //The Search Bar
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
            //The List Tile of Student Data Objects
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
                                    // Map<String, dynamic> mapObjFromStudentObj =
                                    //     foundStudents[index].toJson();
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        worksheetName = selectedItem;
                                        studentDataModelObject =
                                            foundStudents[index];
                                        print(foundStudents[index].StudentName);
                                        return const StudentInfo();
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.info_outline)),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        //StatefulBuilder(
                                        //builder: (context, setState) =>
                                        AlertDialog(
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

                                            //Closing the Alert Dialogue
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Confirm'),
                                        ),
                                      ],
                                    ),
                                  );
                                  // );
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
