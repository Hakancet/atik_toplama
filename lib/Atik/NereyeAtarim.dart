import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class NereyeAtarim extends StatefulWidget {
  const NereyeAtarim({Key? key}) : super(key: key);

  @override
  State<NereyeAtarim> createState() => _NereyeAtarimState();
}

class _NereyeAtarimState extends State<NereyeAtarim> {
  String harita = Liste[0];
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    harita = Liste[0];
    _checkLocationPermission();
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Atığımı Nereye Atabilirim',
              style: TextStyle(color: Colors.white),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.teal,
                indicatorColor: Colors.teal,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'Liste'),
                  Tab(text: 'Harita'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Adres Türü Seçin*',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      items: Liste.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          harita = newValue!;
                        });
                      },
                      value: harita,
                    ),
                  ),
                ),
              ],
            ),
            Center(
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
                  target: LatLng(0.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}

const List<String> Liste = [
  'Geri Dönüşüm Konteyneri',
  'Tel Kafes',
  'Geri Dönüşüm Toplama Alanı',
  'Çöp Konteynerları',
];
