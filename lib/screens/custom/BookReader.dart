import 'package:argon_flutter/models/books.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookReader extends StatelessWidget {
// Load from URL

  @override
  Widget build(BuildContext context) {
    final _bookUrl = ModalRoute.of(context).settings.arguments as Book;

    return Scaffold(
        appBar: AppBar(
          title: Text(_bookUrl.namabuku),
        ),
        body: Center(
          child: _bookUrl == null
              ? Center(child: CircularProgressIndicator())
              : SfPdfViewer.network(_bookUrl.ebook),
        ));
  }
}
