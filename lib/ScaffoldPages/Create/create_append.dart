import 'package:flutter/material.dart';

//list of worksheets
List<String> listOfWorksheets = [];

class CreateAppend extends StatefulWidget {
  const CreateAppend({Key? key}) : super(key: key);

  @override
  State<CreateAppend> createState() => _CreateAppendState();
}

class _CreateAppendState extends State<CreateAppend> {
  //

  //overriding init()
  @override
  void initState() {
    // print(listOfWorksheets);
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
          Container(
            color: Colors.blue,
            height: 60,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listOfWorksheets.length,
              itemBuilder: (context, index) => Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(listOfWorksheets[index].toString()),
                  //subtitle: Text(''),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
