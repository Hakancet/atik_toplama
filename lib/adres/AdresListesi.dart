import 'package:atiktoplama/adres/AdresEkle.dart';
import 'package:flutter/material.dart';

class AdresListesi extends StatefulWidget {
  const AdresListesi({Key? key}) : super(key: key);

  @override
  State<AdresListesi> createState() => _AdresListesiState();
}

class _AdresListesiState extends State<AdresListesi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: Center(child: Text('Adres Listesi' , style: TextStyle(color: Colors.white),)),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdresEkle()));
          }, icon: Icon(Icons.add , color: Colors.white,))
        ],
      ),
    );
  }
}
