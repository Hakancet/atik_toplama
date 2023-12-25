import 'package:atiktoplama/Menu/Homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AdresEkle extends StatefulWidget {
  const AdresEkle({Key? key}) : super(key: key);

  @override
  State<AdresEkle> createState() => _AdresEkleState();
}

class _AdresEkleState extends State<AdresEkle> {
  String isler = list.first;
  String mahallelist = mahalle.first;
  String sokaklist = Sokak.first;
  TextEditingController binaNo = TextEditingController();
  TextEditingController kat = TextEditingController();
  TextEditingController daireNo = TextEditingController();
  TextEditingController acikAdres= TextEditingController();
  TextEditingController adresController = TextEditingController();



  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konumu Onayla'),
          content: const Text('Geri dönüşüm atıkları seçtiğiniz konumdan toplanacaktır.'
              'Konnum işaretinin doğru olduğundan emin misiniz?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hayır'),
            ),
            TextButton(
              onPressed: () {
                _saveData();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Evet'),
            ),
          ],
        );
      },
    );
  }
  void initState() {
    super.initState();
    _checkLocationPermission();
  }
  Position? _currentPosition;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _saveData() {
    String adres = adresController.text;
    String mahalle = mahallelist.toString();
    String sokak = sokaklist.toString();
    String Adresturu = isler.toString();
    String BinaNo= binaNo.text;
    String Kat= kat.text;
    String DaireNo = daireNo.text;

    _firestore.collection('phone').doc('userId').collection('kisiAdres').add({
      'adres': adres,
      'mahalle': mahalle,
      'sokak': sokak,
      'BinaNo': BinaNo,
      'Kat': Kat,
      'DaireNo' : DaireNo,
      'AdresTuru': Adresturu,
    }).then((value) {
      print('Kullanıcı bilgileri kaydedildi.');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }).catchError((error) {
      print('Hata oluştu: $error');
    });
  }
  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      _getCurrentLocation();
    } else {
      await Permission.location.request();
      status = await Permission.location.status;
      if (status.isGranted) {
        _getCurrentLocation();
      } else {
        print("Konum izni verilmedi.");
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print("Hata: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text(
            'Adres Ekle',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            icon: const Icon(Icons.done, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 200,
                child: GoogleMap(
                  initialCameraPosition: _currentPosition != null
                      ? CameraPosition(
                    target: LatLng(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                    ),
                    zoom: 15.0,
                  )
                      : const CameraPosition(
                    target: LatLng(37.06449684609747, 37.34867572234171),
                    zoom: 15.0,
                  ),
                  markers: _currentPosition != null
                      ? <Marker>{
                    Marker(
                      markerId: const MarkerId("marker_1"),
                      position: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      infoWindow: const InfoWindow(title: "Bulunduğunuz Yer"),
                    ),
                  }
                      : <Marker>{},
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                    });
                  },
                ),
              ),
              const SizedBox(height: 3,),
              const Text('Aşağıdaki bilgileri doldurduktan sonra eğer haritadaki yer '
                  'yanlış ise haritaya tıklayarak düzenleyebilirsiniz.'),
              const SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: adresController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Adres Başlığı*',
                    hintStyle: TextStyle(color: Colors.grey),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: isler,
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
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
                        isler = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: mahallelist,
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
                    elevation: 60,
                    isExpanded: true,
                    items: mahalle.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        mahallelist = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: sokaklist,
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
                    elevation: 60,
                    isExpanded: true,
                    items: Sokak.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        sokaklist = value!;
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: binaNo,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Bina No',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: TextFormField(
                      controller: kat,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Kat',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      controller: daireNo,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Daire No',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: acikAdres,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Adres Açık Tarifi',
                    hintStyle: TextStyle(color: Colors.grey),
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
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> list = <String>[
  'Ev',
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
  'Dini Müessese',
];

const List<String> mahalle = <String>[
  'mahale1',
  'mahalle2',
  'mahalle3',
  'mahalle4',
];

const List<String> Sokak = <String>[
  'sokak1',
  'sokak2',
  'sokak3',
  'sokak4',
];
