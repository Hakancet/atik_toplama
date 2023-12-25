import 'package:atiktoplama/adres/AdresListesi.dart';
import 'package:flutter/material.dart';

class UrunDetay extends StatefulWidget {
  const UrunDetay({Key? key}) : super(key: key);

  @override
  State<UrunDetay> createState() => _UrunDetayState();
}

class _UrunDetayState extends State<UrunDetay> {
  int adetSayisi = 1;

  void artir() {
    setState(() {
      adetSayisi++;
    });
  }

  void azalt() {
    if (adetSayisi > 1) {
      setState(() {
        adetSayisi--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Center(child: Text('Ürün Detayı', style: TextStyle(color: Colors.white))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 1,
                child: Image.asset('assets/images/buyukmasa.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Piknik Masası',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '100 Puan',
                      style: TextStyle(fontSize: 20, color: Colors.orange),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ürün Açıklaması',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Test Ürün',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Adet',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: azalt,
                          child: Icon(Icons.remove , color: Colors.black,),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$adetSayisi ',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: artir,
                          child: Icon(Icons.add , color: Colors.black,),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Sipariş Adresi',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdresListesi()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Colors.grey,
                          ),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.teal,),
                              SizedBox(
                                width: 250,
                              ),
                              Icon(Icons.edit, color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Sipariş Notu',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdresListesi()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Colors.grey,
                          ),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(Icons.edit_note, color: Colors.teal,),
                              Text('Not' , style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.teal),
                      ),
                      child: InkWell(
                        onTap: () {

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal:1),
                          decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 5,
                                color: Colors.teal),
                            color: Colors.teal,
                          ),
                          child: Center(
                            child: Text(
                              'Sipariş Ver',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
