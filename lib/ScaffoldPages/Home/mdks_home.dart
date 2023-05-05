import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SizedBox(
                height: 200,
                width: 500,
                child: Center(
                  child: Image.asset(
                    'lib/IMG/mdks.png',
                    // height: 1080,
                    // width: 1920,
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child:
                // LottieBuilder.asset(
                //   'lib/IMG/ksfh.json',
                // )
                LottieBuilder.network(
              'https://assets4.lottiefiles.com/packages/lf20_sknsem5j.json',
            ),
          )
        ],
      ),
    );
  }
}
