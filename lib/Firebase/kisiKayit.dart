import 'package:atiktoplama/adres/AdresEkle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


const List<String> list = <String>['Ev',
  'Eğitim Kurumu',
  'Site-Apartman Yönetimi',
  'İşletme',
  'Envanter',
  'Muhtar',
  'Eczane',
  'Market',
  'Tekstil İşletmesi',
  'Kamu Kurumu',
  'Büyük Atık Üretici Kaynaklar',
  'Sanayi İşletme',
  'Atık Toplayıcılar',
  'Akaryakıt İstasyonu',
  'Dini Müessese',];
class kisiKayit extends StatefulWidget {
  const kisiKayit({Key? key}) : super(key: key);

  @override
  State<kisiKayit> createState() => _kisiKayitState();
}

class _kisiKayitState extends State<kisiKayit> {
  TextEditingController adController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController soyadController = TextEditingController();
  String meslek = list.first;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void _kaydet() {
    String ad = adController.text;
    String email = emailController.text;
    String soyad = soyadController.text;
    String Meslek = meslek.toString();

    _firestore.collection('phone').doc('userId').collection('kisiBilgi').add({
      'ad': ad,
      'soyad': soyad,
      'email': email,
      'Meslek': Meslek,
    }).then((value) {
      print('Kullanıcı bilgileri kaydedildi.');
    }).catchError((error) {
      print('Hata oluştu: $error');
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Center(
                  child: Text(
                'Hoşgeldiniz!',
                style: TextStyle(color: Colors.teal, fontSize: 45),
              )),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text('Bilgilerinizi girerek kayıdınızı tamamlayınız.',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: adController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Ad Giriniz*',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            strokeAlign: 15,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.elliptical(2, 2)),
                        gapPadding: 5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: soyadController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Soyad Giriniz*',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            strokeAlign: 15,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.elliptical(2, 2)),
                        gapPadding: 5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'E-Posta Giriniz*',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            strokeAlign: 15,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.elliptical(2, 2)),
                        gapPadding: 5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: meslek,
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor:Colors.grey,
                    elevation: 60,
                    isExpanded: true,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        meslek = value!;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Card(
                margin: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.teal),
                ),
                child: InkWell(
                  onTap: () {
                    _kaydet();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdresEkle()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal:1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 5,
                          color: Colors.teal),
                      color: Colors.teal,
                    ),
                    child: Center(
                      child: Text(
                        'Tamamla',
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
