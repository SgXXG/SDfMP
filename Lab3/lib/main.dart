import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
        ),
        body: QRCodeGenerator(),
      ),
    );
  }
}

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  String _qrText = '';
  late Uint8List? _qrCode = null;
  String _scannedText = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Введите текст для генерации QR-кода',
            ),
            onChanged: (text) {
              setState(() {
                _qrText = text;
              });
            },
          ),
          SizedBox(height: 10.0),
          _qrCode == null
              ? Text('QR-код будет сгенерирован здесь')
              : Image.memory(_qrCode!),
          SizedBox(height: 10.0),
          ElevatedButton(
            child: Text('Сгенерировать QR-код'),
            onPressed: () async {
              try {
                ByteData? qrCode = await QrPainter(
                  data: _qrText,
                  version: QrVersions.auto,
                  gapless: false,
                  color: Color(0xff000000),
                  emptyColor: Color(0xffffffff),
                ).toImageData(200.0);
                setState(() {
                  _qrCode = qrCode?.buffer.asUint8List();
                });
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            child: Text('Считать QR-код'),
            onPressed: () async {
              String result = await FlutterBarcodeScanner.scanBarcode(
                '#FF0000',
                'Отмена',
                false,
                ScanMode.QR,
              );
              if (result != '-1') {
                setState(() {
                  _scannedText = result;
                });
                if (result.startsWith('http') || result.startsWith('https')) {
                  if (await canLaunch(result)) {
                    await launch(result);
                  }
                } else {
                  Clipboard.setData(ClipboardData(text: result));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Скопировано в буфер обмена: $result'),
                    ),
                  );
                }
              }
            },
          ),
          SizedBox(height: 10.0),
          _scannedText == ''
              ? Text('Текст из QR-кода будет сгенерирован здесь')
              : Text('Текст из QR-кода: $_scannedText'),
        ],
      ),
    );
  }
}
