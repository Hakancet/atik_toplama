import 'package:flutter/material.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: Center(child: Text('Qr Kodu Okut' , style: TextStyle(color: Colors.white),)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text('  Biriktirmiş olduğunuz atıkları teslim etmek için lütfen \n geri dönüşüm personeline QR kodu gösteriniz.' , style: TextStyle(fontSize: 15),),
              SizedBox(
                height: 25,
              ),
              Image.asset('assets/images/qrkod.png' , fit: BoxFit.cover,)
            ],
          ),
        ),
      ),
    );
  }
}
