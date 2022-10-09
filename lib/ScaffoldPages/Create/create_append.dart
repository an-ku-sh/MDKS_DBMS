import 'package:flutter/material.dart';

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
        title: const Text('Worksheets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listOfWorksheets.length,
              itemBuilder: (context, index) => Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(listOfWorksheets[index]
                      .toString()
                      //removing .json from Worksheet name
                      .substring(0, listOfWorksheets[index].indexOf('.'))),
                  trailing: IconButton(
                      onPressed: () {
                        String? sname;
                        String? fnamePhone;
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    'Add Student Record in ${listOfWorksheets[index]}'),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Student Name'),
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
                                            fnamePhone != null) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'create a new record in ${listOfWorksheets[index]} ?'),
                                                content: SizedBox(
                                                  height: 500,
                                                  width: 500,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Student Name : $sname',
                                                      ),
                                                      Text(
                                                        'Father\'s Name \\ Phone Number: $fnamePhone',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Text('data'))
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
