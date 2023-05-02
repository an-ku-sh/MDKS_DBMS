import 'package:flutter/material.dart';

class MDKSHome extends StatefulWidget {
  const MDKSHome({Key? key}) : super(key: key);

  @override
  State<MDKSHome> createState() => _MDKSHomeState();
}

class _MDKSHomeState extends State<MDKSHome> {
  final listOfImages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('MDKS Home'),
      // ),
      body: Container(
        child: Center(
            child: Image.asset(
          'lib/IMG/IMG1.jpg',
          height: 1080,
          width: 1920,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
