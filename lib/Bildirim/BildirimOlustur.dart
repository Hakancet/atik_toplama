import 'package:atiktoplama/adres/AdresListesi.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BildirimOlustur extends StatefulWidget {
  const BildirimOlustur({Key? key}) : super(key: key);

  @override
  State<BildirimOlustur> createState() => _BildirimOlusturState();
}

class _BildirimOlusturState extends State<BildirimOlustur> {
  String? secilenBildirim;
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _gonder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Gönderildi"),
          content: const Text("Bildiriminiz başarıyla gönderildi!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tamam"),
            ),
          ],
        );
      },
    );
  }

  void _showImageOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Resim Seçeneği"),
          content: const Text("Resimle ne yapmak istersiniz?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _image = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text("Sil"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showImageInGallery();
              },
              child: const Text("Galeride Görüntüle"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("İptal"),
            ),
          ],
        );
      },
    );
  }

  void _showImageInGallery() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text("Resim")),
            body: Center(
              child: Image.file(_image!),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text(
            'Geri Bildirim Oluştur',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: secilenBildirim,
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
                    elevation: 60,
                    isExpanded: true,
                    items: bildirimListesi
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        secilenBildirim = value;
                      });
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AdresListesi()));
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
                    child: Text(
                      'Adres Seç',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AdresListesi()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list, color: Colors.teal),
                    Text(
                      'Adres Listesi',
                      style: TextStyle(color: Colors.teal),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_location, color: Colors.teal),
                    Text(
                      'Adres ve Konumdan Otomatik Bul',
                      style: TextStyle(color: Colors.teal),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText:
                        'Belediyeye iletmek istediğiniz istek şikayet,önerilerinizi \n buraya yazabilirsiniz.',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.elliptical(2, 2)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: _getImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.add, color: Colors.black),
                          ),
                          Text(
                            'Resim Ekle',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: _showImageOptions,
                        child: const SizedBox(width: 5)),
                    _image != null
                        ? Image.file(
                      _image!,
                      height: 100,
                      width: 100,
                    )
                        : const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.teal),
                ),
                child: InkWell(
                  onTap: _gonder,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 5,
                          color: Colors.teal),
                      color: Colors.teal,
                    ),
                    child: const Center(
                      child: Text(
                        'Gönder',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
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

const List<String> bildirimListesi = [
  'Eski Ev Eşyası Alım Türü',
  'Evsel Atık (Çöp) Toplama Talebi',
  'Konteyner Şikayeti',
  'Personel Şikayeti',
];
