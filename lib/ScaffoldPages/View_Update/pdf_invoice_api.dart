import 'dart:io';

import 'package:mdks/ScaffoldPages/View_Update/pdf_api.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceAPI {
  //Method to generate PDF
  static Future<File> generatePdf(Map<String, dynamic> studentDataMap) async {
    final pdf = Document();
    //formatting the pdf
    pdf.addPage(MultiPage(
        build: (context) => [
              buildTitle(studentDataMap),
            ]));
    return PdfApi.saveDocument(name: 'debugInvoice', pdf: pdf);
  }

  static Widget buildTitle(Map<String, dynamic> studentDataMap) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('DEbug invoce')]);
}
