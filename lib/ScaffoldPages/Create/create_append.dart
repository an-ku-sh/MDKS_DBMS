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
        title: const Text('Create \\ Manage Worksheets'),
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
                      //removing .json from Woeksheet name
                      .substring(0, listOfWorksheets[index].indexOf('.'))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
