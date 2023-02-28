// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class GeneratedPdf extends StatefulWidget {
//   const GeneratedPdf({super.key});

//   @override
//   State<GeneratedPdf> createState() => _GeneratedPdfState();
// }

// class _GeneratedPdfState extends State<GeneratedPdf> {
//   Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
//     final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
//     final font = await PdfGoogleFonts.nunitoExtraLight();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) {
//           return pw.Column(
//             children: [
//               pw.SizedBox(
//                 width: double.infinity,
//                 child: pw.FittedBox(
//                   child: pw.Text(title, style: pw.TextStyle(font: font)),
//                 ),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Flexible(
//                 child: pw.FlutterLogo(),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     return pdf.save();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Pdf Preview")),
//         body: PdfPreview(
//           canChangePageFormat: true,
//           build: (format) => _generatePdf(format, "Hello"),
//         ),
//       ),
//     );
//   }
// }
