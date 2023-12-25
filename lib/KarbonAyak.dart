import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KarbonAyak extends StatefulWidget {
  const KarbonAyak({Key? key}) : super(key: key);

  @override
  State<KarbonAyak> createState() => _KarbonAyakState();
}

class _KarbonAyakState extends State<KarbonAyak> {
  String araba = arabalistesi[0];
  String motorsiklet = motorsikletlistesi[0];
  String ucus = ucuslistesi[0];
  TextEditingController ocakController = TextEditingController();
  TextEditingController nisanController = TextEditingController();
  TextEditingController temmuzController = TextEditingController();
  TextEditingController ekimController = TextEditingController();
  TextEditingController komurController = TextEditingController();
  TextEditingController odunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: Text(
          'Kişisel Karbon Ayakizi Hesaplama',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Evde yaşayan kaç kişi var?',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Evde yaşayan kaç kişi var?',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal,
                          strokeAlign: 15,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                      gapPadding: 5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLength: 4,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Ortalama elektrik faturanız',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Ortalama elektrik faturanız',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          strokeAlign: 15,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                      gapPadding: 5),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Verilen aylar için ortalama doğalgaz faturanızı giriniz.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLength: 4,
                    controller: ocakController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Ocak Ayı Faturası',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Ocak Ayı Faturası',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          strokeAlign: 15,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLength: 4,
                    controller: nisanController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Nisan Ayı Faturası',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Nisan Ayı Faturası',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          strokeAlign: 15,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLength: 4,
                    controller: temmuzController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Temmuz Ayı Faturası',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Temmuz Ayı Faturası',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          strokeAlign: 15,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: ekimController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Ekim Ayı Faturası',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Ekim Ayı Faturası',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          strokeAlign: 15,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Yıllık Tükettiğiniz yakacak miktarını giriniz.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: komurController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Yıllık Ortalama Kömür Kullanımı',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Yıllık Ortalama Kömür Kullanımı',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          strokeAlign: 15,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        gapPadding: 5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: odunController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Yıllık Ortalama Odun Kullanımı',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'Yıllık Ortalama Odun Kullanımı',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                strokeAlign: 15,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(5, 5)),
                              gapPadding: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: araba,
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        iconEnabledColor: Colors.grey,
                        elevation: 60,
                        isExpanded: true,
                        items: arabalistesi
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            araba = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: motorsiklet,
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        iconEnabledColor: Colors.grey,
                        elevation: 60,
                        isExpanded: true,
                        items: motorsikletlistesi
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            motorsiklet = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Son 1 yıl içinde yaptığınız uçak seyahatlerini yazınız.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: DropdownButton<String>(
                            underline: Container(
                              decoration: BoxDecoration(

                              ),
                            ),
                            value: ucus,
                            focusColor: Colors.white,
                            dropdownColor: Colors.white,
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Colors.grey,
                            elevation: 60,
                            isExpanded: true,
                            items: ucuslistesi
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                ucus = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Türkiye-Uzakdoğu',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'Türkiye-Uzakdoğu',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: DropdownButton<String>(
                            underline: Container(
                              decoration: BoxDecoration(

                              ),
                            ),
                            value: ucus,
                            focusColor: Colors.white,
                            dropdownColor: Colors.white,
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Colors.grey,
                            elevation: 60,
                            isExpanded: true,
                            items: ucuslistesi
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                ucus = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Avrupa-Amerika',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'Avrupa-Amerika',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: DropdownButton<String>(
                            underline: Container(
                              decoration: BoxDecoration(
                              ),
                            ),
                            value: ucus,
                            focusColor: Colors.white,
                            dropdownColor: Colors.white,
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Colors.grey,
                            elevation: 60,
                            isExpanded: true,
                            items: ucuslistesi
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                ucus = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Türkiye-Amerika',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'Türkiye-Amerika',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(

                          ),
                          child: SizedBox(
                            height: 100,
                            child: DropdownButton<String>(
                              value: ucus,
                              underline: Container(
                                decoration: BoxDecoration(

                                ),
                              ),
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              iconDisabledColor: Colors.grey,
                              iconEnabledColor: Colors.grey,
                              elevation: 60,
                              isExpanded: true,
                              items: ucuslistesi
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  ucus = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Türkiye-Uzakdoğu',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintText: 'Türkiye-Uzakdoğu',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            'Hesapla',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

const List<String> ucuslistesi = [
  'Gidiş-Geliş',
  'Tek-Gidiş',
];
const List<String> arabalistesi = [
  'Arabam Yok',
  'Dizel',
  'LPG',
  'Benzin',
];
const List<String> motorsikletlistesi = [
  'Motorsikletim Yok',
  'Elektrik',
  'Benzin',
];
