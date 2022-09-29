import 'package:flutter/material.dart';

class FinancialRecords extends StatefulWidget {
  const FinancialRecords({Key? key}) : super(key: key);

  @override
  State<FinancialRecords> createState() => _FinancialRecordsState();
}

class _FinancialRecordsState extends State<FinancialRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Records'),
      ),
    );
  }
}
