import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mdks/ScaffoldPages/View_Update/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceAPI {
  //Method to generate PDF
  static Future<File> generatePdf(Map<String, dynamic> studentDataMap) async {
    print('generate pdf called');
    final pdf = Document();
    PdfPageFormat.a4;
    final mdksLogoImage =
        (await rootBundle.load('lib/IMG/mdks.png')).buffer.asUint8List();
    //formatting the pdf
    pdf.addPage(MultiPage(
        build: (context) => [
              pdfHeader(studentDataMap, mdksLogoImage),
              SizedBox(height: 0.3 * PdfPageFormat.cm),
              Divider(),
              pdfTransactionsList(studentDataMap),
              Divider(),
              SizedBox(height: 3 * PdfPageFormat.cm),
              insitituteStamp(),
              Divider(),
            ]));
    return PdfApi.saveDocument(
        name: '${studentDataMap["StudentName"]}PaymentInvoice', pdf: pdf);
  }

  //Pdf Header
  static Widget pdfHeader(
          Map<String, dynamic> studentDataMap, var mdksLogoImage) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(MemoryImage(mdksLogoImage), width: 70, height: 40),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('MDKS', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Institute Addressssssss',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              SizedBox(width: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text('${studentDataMap["FeeTerm1"]}'),
                  Text('Student Name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Father Name/ Phone No',
                      style: TextStyle(fontWeight: FontWeight.bold))
                  // Text('${studentDataMap["FeeTerm1"]}'),
                ],
              )
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text('INVOICE', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  // Pdf Transactions Table
  static Widget pdfTransactionsList(Map<String, dynamic> studentDataMap) {
    //List Of Headers
    final headersList = ['TermName', 'Amount', 'Date', 'Receipt.No.'];
    // List Of Table Values
    return Table.fromTextArray(
      headers: headersList,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 25,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerLeft,
        3: Alignment.centerLeft,
      },
      data: [
        [
          studentDataMap["FeeTerm1"].toString().toLowerCase().contains('null')
              ? '${studentDataMap["FeeTerm1"]}'
              : '---',
          'Rs ${studentDataMap["FeeAmountTerm1"]}',
          '${studentDataMap["FeePaymentDateTerm1"]}',
          '${studentDataMap["FeeReceiptNoTerm1"]}',
        ],
        [
          '${studentDataMap["FeeTerm2"]}',
          'Rs ${studentDataMap["FeeAmountTerm2"]}',
          '${studentDataMap["FeePaymentDateTerm2"]}',
          '${studentDataMap["FeeReceiptNoTerm2"]}',
        ],
        [
          '${studentDataMap["FeeTerm3"]}',
          'Rs ${studentDataMap["FeeAmountTerm3"]}',
          '${studentDataMap["FeePaymentDateTerm3"]}',
          '${studentDataMap["FeeReceiptNoTerm3"]}',
        ],
        [
          '${studentDataMap["FeeTerm4"]}',
          'Rs ${studentDataMap["FeeAmountTerm4"]}',
          '${studentDataMap["FeePaymentDateTerm4"]}',
          '${studentDataMap["FeeReceiptNoTerm4"]}',
        ],
        [
          '${studentDataMap["FeeTerm5"]}',
          'Rs ${studentDataMap["FeeAmountTerm5"]}',
          '${studentDataMap["FeePaymentDateTerm5"]}',
          '${studentDataMap["FeeReceiptNoTerm5"]}',
        ],
        [
          '${studentDataMap["FeeTerm6"]}',
          'Rs ${studentDataMap["FeeAmountTerm6"]}',
          '${studentDataMap["FeePaymentDateTerm6"]}',
          '${studentDataMap["FeeReceiptNoTerm6"]}',
        ],
        [
          '${studentDataMap["FeeTerm7"]}',
          'Rs ${studentDataMap["FeeAmountTerm7"]}',
          '${studentDataMap["FeePaymentDateTerm7"]}',
          '${studentDataMap["FeeReceiptNoTerm7"]}',
        ],
        [
          '${studentDataMap["FeeTerm8"]}',
          'Rs ${studentDataMap["FeeAmountTerm8"]}',
          '${studentDataMap["FeePaymentDateTerm8"]}',
          '${studentDataMap["FeeReceiptNoTerm8"]}',
        ],
        [
          '${studentDataMap["FeeTerm9"]}',
          'Rs ${studentDataMap["FeeAmountTerm9"]}',
          '${studentDataMap["FeePaymentDateTerm9"]}',
          '${studentDataMap["FeeReceiptNoTerm9"]}',
        ],
        [
          '${studentDataMap["FeeTerm10"]}',
          'Rs ${studentDataMap["FeeAmountTerm10"]}',
          '${studentDataMap["FeePaymentDateTerm10"]}',
          '${studentDataMap["FeeReceiptNoTerm10"]}',
        ],
        [
          '${studentDataMap["FeeTerm11"]}',
          'Rs ${studentDataMap["FeeAmountTerm11"]}',
          '${studentDataMap["FeePaymentDateTerm11"]}',
          '${studentDataMap["FeeReceiptNoTerm11"]}',
        ],
        [
          '${studentDataMap["FeeTerm12"]}',
          'Rs ${studentDataMap["FeeAmountTerm12"]}',
          '${studentDataMap["FeePaymentDateTerm12"]}',
          '${studentDataMap["FeeReceiptNoTerm12"]}',
        ],
      ],
    );
  }

  //Footer
  static Widget insitituteStamp() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Principal Signature'),
          Text("Institute Stamp"),
        ],
      ),
    );
  }
}
