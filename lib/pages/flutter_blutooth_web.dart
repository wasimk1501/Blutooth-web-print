// import 'package:flutter/material.dart';
// import 'package:flutter_web_bluetooth/flutter_web_bluetooth.dart';
// import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';

// class FBWeb extends StatefulWidget {
//   const FBWeb({super.key});

//   @override
//   State<FBWeb> createState() => _FBWebState();
// }

// void btfunction() async {
//   final requestOptions = RequestOptionsBuilder.acceptAllDevices(
//       optionalServices: [BluetoothDefaultServiceUUIDS.DEVICE_INFORMATION.uuid]);

//   try {
//     final device =
//         await FlutterWebBluetooth.instance.requestDevice(requestOptions);
//   } on UserCancelledDialogError {
//     // The user cancelled the dialog
//   } on DeviceNotFoundError {
//     // There is no device in range for the options defined above
//   }
// // A stream with a [Set] of all the devices that the user has paired, and given permission for.
//   var device = FlutterWebBluetooth.instance.devices;
//   await device.connect();
//   final services = await device.discoverServices();
//   final service = services.firstWhere((service) =>
//       service.uuid == BluetoothDefaultServiceUUIDS.DEVICE_INFORMATION.uuid);
// // Now get the characteristic
//   final characteristic = await service.getCharacteristic(
//       BluetoothDefaultCharacteristicUUIDS.MANUFACTURER_NAME_STRING.uuid);
//   final value = characteristic.readValue();
// // Now we have a [ByteData] object with the manufacturer name in it.
//   device.disconnect();
// }

// @override
// Widget build(BuildContext context) {
//   // The bluetooth api exists in this user agent.
//   final supported = FlutterWebBluetooth.instance.isBluetoothApiSupported;
// // A stream that says if a bluetooth adapter is available to the browser.
//   final available = FlutterWebBluetooth.instance.isAvailable;

//   return StreamBuilder<bool>(
//     stream: FlutterWebBluetooth.instance.isAvailable,
//     initialData: false,
//     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//       final available = snapshot.requireData;
//       return MaterialApp(
//           home: Scaffold(
//         appBar: AppBar(
//           title: const SelectableText('Bluetooth web example app'),
//         ),
//         body: MainPage(
//           isBluetoothAvailable: available,
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//         floatingActionButton: const FABS(),
//       ));
//     },
//   );
// }
