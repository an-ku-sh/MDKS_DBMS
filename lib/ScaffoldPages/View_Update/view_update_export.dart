//Dependencies
import 'package:flutter/material.dart';
import 'package:mdks/DataBaseBackend/json_api.dart';
import 'package:mdks/ScaffoldPages/View_Update/student_info.dart';

//Packages

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
    setState(() {
      allStudents = l;
      foundStudents = allStudents;
    });
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
    return Scaffold(
      appBar: AppBar(
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
                                          scrollable: true,
                                          title: const Text('Student Info'),
                                          content: studentInfoWidget(
                                            selectedItem,
                                            foundStudents[index],
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
                                        builder: (context) {
                                          return AlertDialog(
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
                                                  setState(() {
                                                    deleteStudentRecord(
                                                        selectedItem,
                                                        foundStudents[index]
                                                            .name,
                                                        foundStudents[index]
                                                            .fnamephone);
                                                  });
                                                  Navigator.of(context).pop();
                                                  //refershing the UI
                                                },
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.delete)),
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