import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../DataBaseBackend/json_api.dart';

class CreateAppend extends StatefulWidget {
  const CreateAppend({Key? key}) : super(key: key);

  @override
  State<CreateAppend> createState() => _CreateAppendState();
}

class _CreateAppendState extends State<CreateAppend> {
  //overriding init()
  @override
  void initState() {
    super.initState();
  }

  //scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Institutes',
          style: GoogleFonts.adventPro(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listOfWorksheets.length,
              itemBuilder: (context, index) => Card(
                color: Colors.black12,
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(listOfWorksheets[index]
                      .toString()
                      //removing .json from Worksheet name
                      .substring(0, listOfWorksheets[index].indexOf('.'))
                      .toUpperCase()),
                  trailing: IconButton(
                      onPressed: () {
                        String? sname;
                        String? fnamePhone;
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // backgroundColor: Colors.black12 ,
                                title: Text(
                                    'Add Student Record in ${listOfWorksheets[index].substring(0, listOfWorksheets[index].indexOf('.')).toUpperCase()}'),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Student Name',
                                      ),
                                      onChanged: (value) {
                                        sname = value;
                                      },
                                      onSubmitted: (value) {
                                        sname = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: listOfWorksheets[index]
                                                .contains('playschool')
                                            ? 'Enter Father\'s Name'
                                            : 'Enter Father\'s Phone Number',
                                      ),
                                      onChanged: (value) {
                                        fnamePhone = value;
                                      },
                                      onSubmitted: (value) {
                                        fnamePhone = value;
                                      },
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (sname != null &&
                                          sname != '' &&
                                          fnamePhone != null &&
                                          fnamePhone != '') {
                                        createStudentRecord(
                                          listOfWorksheets[index],
                                          sname!,
                                          fnamePhone!,
                                        );
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.ubuntuCondensed(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add_link_sharp)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
