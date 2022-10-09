import 'package:flutter/material.dart';

SizedBox studentInfoWidget(
  String instituteName,
  var studentDataObject,
) {
  if (instituteName.toLowerCase().contains('playschool')) {
    return SizedBox(
      height: 800,
      width: 1100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(2),
              height: 40,
              width: 1100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                color: Colors.grey,
              ),
              child: Text('Student Name: ${studentDataObject.name}'),
            ),
          ),
        ],
      ),
    );
  } else {
    return SizedBox(
      height: 800,
      width: 1100,
      child: Column(
        children: [
          Container(
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
