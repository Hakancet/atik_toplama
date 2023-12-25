import 'package:flutter/material.dart';

import '../adres/AdresListesi.dart';

class UrunAgac extends StatefulWidget {
  const UrunAgac({Key? key}) : super(key: key);

  @override
  State<UrunAgac> createState() => _UrunAgacState();
}

class _UrunAgacState extends State<UrunAgac> {
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
        title: const Center(child: Text('Ürün Detayı', style: TextStyle(color: Colors.white))),
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
                child: Image.asset('assets/images/buyukagac.jpg'),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Fidan(1 Adet)',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      '25 Puan',
                      style: TextStyle(fontSize: 20, color: Colors.orange),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Ürün Açıklaması',
                      style: TextStyle(fontSize: 15),
                    ),
                    const Text(
                      'Test Ürün',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const Text(
                      'Adet',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: azalt,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Icon(Icons.remove , color: Colors.black,),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '$adetSayisi ',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: artir,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Icon(Icons.add , color: Colors.black,),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Sipariş Adresi',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AdresListesi()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Colors.grey,
                          ),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: const Align(
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
                    const Text(
                      'Sipariş Notu',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AdresListesi()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Colors.grey,
                          ),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: const Align(
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
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.teal),
                      ),
                      child: InkWell(
                        onTap: () {

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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
