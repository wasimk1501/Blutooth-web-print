// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
// import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:md_calculator/pages/gerd_screen.dart';
// import 'package:md_calculator/pages/home_page.dart';
// import 'package:md_calculator/utils/printers.dart';
// import 'package:share_plus/share_plus.dart';
// import '../main.dart';

// class GerdResult extends StatefulWidget {
//   const GerdResult(
//       {super.key, required this.acidReflux, required this.dyspeptic});
//   final int acidReflux;
//   final int dyspeptic;
//   @override
//   State<GerdResult> createState() => _GerdResultState();
// }

// class _GerdResultState extends State<GerdResult> {
//   late String? bmiMessage;
//   bool isVisible = true;
//   var doctorName;
//   var doctorSpeciality;
//   var doctorMobileNo;
//   var patientName;
//   var patientAge;
//   var patientGender;
//   var testName;
//   String testing = "";
//   String testings = "";

//   @override
//   Widget build(BuildContext context) {
//     doctorName = doctorBox.get("doctorName");
//     doctorMobileNo = patientBox.get("doctorMobileNo");
//     doctorSpeciality = doctorBox.get("doctorSpeciality");
//     patientName = patientBox.get("patientName");
//     patientAge = patientBox.get("patientAge");
//     patientGender = patientBox.get("patientGender");
//     testName = patientBox.get("testName");

//     NumberFormat formatter = NumberFormat("0.00");
//     String bmiString = formatter.format(widget.acidReflux);
//     String bsaString = formatter.format(widget.dyspeptic);

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 10.0,
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//                 decoration: BoxDecoration(
//                   color: appColor,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.grey,
//                       blurRadius: 10.0,
//                       offset: Offset(2.0, 5.0),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Gerd Diagnostic Result",
//                         style: GoogleFonts.roboto(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10.0,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.only(
//                             left: 15, top: 15, bottom: 15),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 text: "Acid Reflux Related Symptom : ",
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text:
//                                         "\n${widget.acidReflux.toString()} points",
//                                     style: const TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               text: TextSpan(
//                                 text: "Dyspeptic (Dysmotility) Symptom : ",
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text:
//                                         "\n${widget.dyspeptic.toString()} points",
//                                     style: const TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         //print
//                         final supported = FlutterWebBluetooth
//                             .instance.isBluetoothApiSupported;
//                         // final available = FlutterWebBluetooth.instance.isAvailable;

//                         // Define the services you want to communicate with here!
//                         final requestOptions =
//                             RequestOptionsBuilder.acceptAllDevices(
//                                 // optionalServices: [BluetoothDefaultServiceUUIDS.DEVICE_INFORMATION.uuid],
//                                 );

//                         final available = FlutterWebBluetooth.instance.devices;

//                         available.listen(
//                           (event) {
//                             print(event);
//                           },
//                         );

//                         try {
//                           final device = await FlutterWebBluetooth.instance
//                               .requestDevice(requestOptions);
//                           await device.connect();
//                           final services = await device.discoverServices();
//                           final service = services.firstWhere((service) =>
//                               service.uuid ==
//                               BluetoothDefaultServiceUUIDS
//                                   .DEVICE_INFORMATION.uuid);
//                           print(service);
//                           setState(() {
//                             testing = service.toString();
//                           });
//                           // Now get the characteristic
//                           final characteristic =
//                               await service.getCharacteristic(
//                                   BluetoothDefaultCharacteristicUUIDS
//                                       .MANUFACTURER_NAME_STRING.uuid);
//                           final value = characteristic.readValue();
//                           setState(() {
//                             testings = value.toString();
//                           });
//                           print(value);

// // Now we have a [ByteData] object with the manufacturer name in it.
//                           device.disconnect();
//                         } on UserCancelledDialogError {
//                           // The user cancelled the dialog
//                         } on DeviceNotFoundError {
//                           // There is no device in range for the options defined above
//                         }

//                         // Share.share("$doctorName");
//                         // log("Printed");
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => const Printers()));
//                       },
//                       child: MouseRegion(
//                         cursor: SystemMouseCursors.click,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 20.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: isVisible ? Colors.white : Colors.grey[300],
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color.fromARGB(255, 231, 225, 225),
//                                 offset: Offset(3.0, 5.0),
//                                 blurRadius: 9,
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.print,
//                                   color:
//                                       isVisible ? Colors.black : Colors.grey),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Print",
//                                 style: GoogleFonts.abhayaLibre(
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                     color:
//                                         isVisible ? Colors.black : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     GestureDetector(
//                       child: MouseRegion(
//                         cursor: SystemMouseCursors.click,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 20.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color.fromARGB(255, 231, 225, 225),
//                                 offset: Offset(3.0, 5.0),
//                                 blurRadius: 9,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Test Again",
//                               style: GoogleFonts.abhayaLibre(
//                                   fontSize: 20.0, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           isVisible = true;
//                         });
//                         // Navigator.pushReplacement(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => BMIScreen()));
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const GerdScreen()));
//                       },
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     GestureDetector(
//                       child: MouseRegion(
//                         cursor: SystemMouseCursors.click,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 20.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color.fromARGB(255, 231, 225, 225),
//                                 offset: Offset(3.0, 5.0),
//                                 blurRadius: 9,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Main Menu",
//                               style: GoogleFonts.abhayaLibre(
//                                   fontSize: 20.0, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const HomePage()));
//                       },
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(top: 20.0),
//                         child: Text(
//                           testing,
//                           style: const TextStyle(
//                               fontSize: 18.0, color: Colors.black),
//                         )),
//                     Text(
//                       testings,
//                       style:
//                           const TextStyle(fontSize: 18.0, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
