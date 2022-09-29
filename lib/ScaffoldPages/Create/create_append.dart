import 'package:flutter/material.dart';

class CreateAppend extends StatefulWidget {
  const CreateAppend({Key? key}) : super(key: key);

  @override
  State<CreateAppend> createState() => _CreateAppendState();
}

class _CreateAppendState extends State<CreateAppend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Append'),
      ),
    );
  }
}
