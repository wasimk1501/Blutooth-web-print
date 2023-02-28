 // import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:typed_data';
// import 'package:md_calculator/pages/generatedPdf.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:senraise_printer/senraise_printer.dart';
 
  // void initPrinter() {
  //   _printerManager.startScan(Duration(seconds: 2));
  //   _printerManager.scanResults.listen((val) {
  //     print(val);
  //   });
  // }






   // Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
  //   final pdf = pw.Document();

  //   pdf.addPage(
  //     pw.Page(
  //       pageFormat: format,
  //       build: (context) => pw.Placeholder(),
  //     ),
  //   );

  //   return pdf.save();
  // }

  // final _senraisePrinter = SenraisePrinter();





  
 
 
 
 
 
 
 
 
 // onTap: () async {
                      //   // await print();
                      //   final profile = await CapabilityProfile.load();
                      //   final generator = Generator(PaperSize.mm58, profile);
                      //   generator.text("hello");
                      // },
                      // onTap: () async {
                      //   // Navigator.push(
                      //   //     context,
                      //   //     MaterialPageRoute(
                      //   //         builder: ((context) => GeneratedPdf())));
                      //   // final doc = pw.Document();
                      //   // // final ttf =
                      //   // //     await fontFromAssetBundle('assets/open-sans.ttf');
                      //   // doc.addPage(pw.Page(build: (pw.Context context) {
                      //   //   return pw.Center(
                      //   //     child: pw.Text('Dart is awesome',
                      //   //         style: pw.TextStyle(fontSize: 40)),
                      //   //   ); // Center
                      //   // }));
                      //   // await Printing.layoutPdf(
                      //   //     onLayout: (PdfPageFormat format) async =>
                      //   //         doc.save()); // Page
                      //   // //share
                      //   // await Printing.sharePdf(
                      //   //     bytes: await doc.save(),
                      //   //     filename: 'my-document.pdf');
                      //   // //PdfPreview
                      //   // PdfPreview(
                      //   //   build: (format) => doc.save(),
                      //   // );
                      //   // final image =
                      //   //     await imageFromAssetBundle('assets/bmiIcon.png');

                      //   // doc.addPage(pw.Page(build: (pw.Context context) {
                      //   //   return pw.Center(
                      //   //     child: pw.Image(image),
                      //   //   ); // Center
                      //   // })); // Page
                      //   // //

                      //   // await Printing.layoutPdf(
                      //   //     onLayout: (format) =>
                      //   //         _generatePdf(format, "Flutter Demo"));
                      // },
                      // onTap: () async {
                      //   await main();
                      //   final prof = await CapabilityProfile.load();
                      //   print("profile Name: ${prof}");
                      //   final generator = Generator(PaperSize.mm58, prof);
                      //   print("generator: ${generator}");
                      //   generator.text('hello world');
                      // },
                      // onTap: isVisible
                      //     ? () async {
                      // await main();

                      // var dateTime = DateFormat("dd/MM/yyyy hh:mm a")
                      //     .format(DateTime.now());
                      // setState(() {
                      //   isVisible = false;
                      // });
                      // // await _senraisePrinter.nextLine(1);
                      // await _senraisePrinter.setTextDoubleWidth(false);
                      // await _senraisePrinter
                      //     .setAlignment(0); //leftAlignment
                      // await _senraisePrinter.setTextBold(true);
                      // Uint8List data =
                      //     (await rootBundle.load('assets/bmiIcon.png'))
                      //         .buffer
                      //         .asUint8List();
                      // await _senraisePrinter.printPic(data);

                      // // await _senraisePrinter.setDark(4); /*No Change*/
                      // // await _senraisePrinter.setLineHeight(
                      // //     1.0); /* Error: java.lang.Double cannot be cast to java.lang.Float*/
                      // // await _senraisePrinter.setTextSize(
                      // //     10.0); /* Error: java.lang.Double cannot be cast to java.lang.Float*/

                      // await _senraisePrinter
                      //     .setAlignment(1); //centerAlignment
                      // await _senraisePrinter.setTextDoubleWidth(true);
                      // await _senraisePrinter.printText(
                      //   "\nBMI Test\n",
                      // );
                      // await _senraisePrinter.setTextDoubleWidth(false);
                      // await _senraisePrinter
                      //     .setAlignment(0); //leftAlignment

                      // await _senraisePrinter.printText(
                      //   "$doctorName ( $doctorSpeciality )\n",
                      // );

                      // await _senraisePrinter.printText(
                      //   "Patient Name: $patientName\n",
                      // );
                      // await _senraisePrinter.printText(
                      //   "Age: $patientAge | Gender: $patientGender\n",
                      // );

                      // await _senraisePrinter.printText(
                      //   "Score :  ",
                      // );

                      // await _senraisePrinter.setTextDoubleWidth(true);
                      // await _senraisePrinter.printText(
                      //   bmiString,
                      // );

                      // await _senraisePrinter.nextLine(1);
                      // await _senraisePrinter.setTextDoubleWidth(false);
                      // await _senraisePrinter.setTextBold(true);
                      // await _senraisePrinter.printText(
                      //   "( $bmiMessage )\n",
                      // );

                      // await _senraisePrinter.nextLine(1);
                      // await _senraisePrinter.printText(
                      //   "-----------Disclaimer-----------\n",
                      // );
                      // await _senraisePrinter.printText(
                      //   "Lorem Ipsum Calculation When \nyou have a dream, you've got to \ngrab it and never let go.\n",
                      // );
                      // await _senraisePrinter.printText(
                      //   "Thank You\n",
                      // );
                      // await _senraisePrinter.printText(
                      //   "$dateTime\n",
                      // );
                      // await _senraisePrinter
                      //     .nextLine(4); //leave 2 lines
                      //   }
                      // : null,