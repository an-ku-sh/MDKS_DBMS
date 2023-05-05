import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../DataBaseBackend/json_api.dart';

class FinancialRecords extends StatefulWidget {
  const FinancialRecords({Key? key}) : super(key: key);

  @override
  State<FinancialRecords> createState() => _FinancialRecordsState();
}

class _FinancialRecordsState extends State<FinancialRecords> {
  List listOfInstitutes = List.from(['Select Institute Type'])
    ..addAll(listOfWorksheets);

  String selectedInstitute = 'Select Institute Type';
  List<String> listOfFeeTerms = [
    'Select Fee Term',
    'FeeAmountTerm1',
    'FeeAmountTerm2',
    'FeeAmountTerm3',
    'FeeAmountTerm4',
    'FeeAmountTerm5',
    'FeeAmountTerm6',
    'FeeAmountTerm7',
    'FeeAmountTerm8',
    'FeeAmountTerm9',
    'FeeAmountTerm10',
    'FeeAmountTerm12'
  ];
  String selectedFeeTerm = 'Select Fee Term';
  List<String> listOfFeeDefaulters = [];

  createFeeDefaulterList({
    required jsonFileName,
    required feeTerm,
  }) async {
    print('create fee defaulter list called');
    List l = await returnJsonObjectList(jsonFileName);
    List<String> listOfDefaulters = [];
    // print('printing from crAWE$l');
    for (var i = 0; i < l.length; i++) {
      Map<String, dynamic> mapObjFromStudentObj = l[i].toJson();
      //print('ther value of fee term is ${mapObjFromStudentObj["$feeTerm"]}');
      if (mapObjFromStudentObj["$feeTerm"] == null) {
        listOfDefaulters.add(mapObjFromStudentObj["StudentName"].toString());
        //print('PRINTING EGBHUI${l[i]}');
        //print('${mapObjFromStudentObj["StudentName"]}');
      }
    }
    setState(() {
      listOfFeeDefaulters = listOfDefaulters;
      print('updated defaulter list $listOfFeeDefaulters');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'Financial Records',
          style: GoogleFonts.adventPro(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        actions: [
          //The Drop Down Button
          Padding(
            padding:
                const EdgeInsets.only(left: 7, right: 37, top: 7, bottom: 7),
            child: SizedBox(
              width: 240,
              height: 50,
              child: DropdownButtonFormField(
                dropdownColor: Colors.grey.shade800,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                  ),
                ),
                elevation: 8,
                // alignment: Alignment.centerLeft,
                items: listOfInstitutes
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                value: selectedInstitute,
                onChanged: (item) => setState(
                  () {
                    selectedInstitute = item.toString();
                  },
                ),
              ),
            ),
          ),
          //The Drop Down Button
          Padding(
            padding:
                const EdgeInsets.only(left: 7, right: 37, top: 7, bottom: 7),
            child: SizedBox(
              width: 240,
              height: 50,
              child: DropdownButtonFormField(
                dropdownColor: Colors.grey.shade800,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                  ),
                ),
                elevation: 8,
                alignment: Alignment.centerLeft,
                items: listOfFeeTerms
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                value: selectedFeeTerm,
                onChanged: (i) => setState(
                  () {
                    selectedFeeTerm = i!;
                  },
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                if (selectedFeeTerm != 'Select Fee Term' &&
                    selectedInstitute != 'Select Institute Type') {
                  createFeeDefaulterList(
                      jsonFileName: selectedInstitute,
                      feeTerm: selectedFeeTerm);
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: listOfFeeDefaulters.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: listOfFeeDefaulters.length,
                    itemBuilder: ((context, f) => Card(
                          elevation: 1,
                          child: ListTile(
                            title: Text(listOfFeeDefaulters[f]),
                          ),
                        )),
                  ),
                ),
              ],
            )
          : const Text(''),
    );
  }
}
