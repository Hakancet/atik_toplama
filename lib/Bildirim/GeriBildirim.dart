import 'package:atiktoplama/Bildirim/BildirimOlustur.dart';
import 'package:flutter/material.dart';




class GeriBildirim extends StatefulWidget {
  const GeriBildirim({Key? key}) : super(key: key);

  @override
  State<GeriBildirim> createState() => _GeriBildirimState();
}

class _GeriBildirimState extends State<GeriBildirim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: const Center(child: Text('Geri Bildirim', style: TextStyle(color: Colors.white),)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.teal),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BildirimOlustur()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal:1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 5,
                          color: Colors.teal),
                      color: Colors.teal,
                    ),
                    child: const Center(
                      child: Text(
                        'Yeni Geri Bildirim Oluştur',
                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
