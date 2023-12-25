import 'package:atiktoplama/Urunler/UrunAgac.dart';
import 'package:atiktoplama/Urunler/UrunDetay.dart';
import 'package:flutter/material.dart';

class Dukkan extends StatefulWidget {
  const Dukkan({Key? key}) : super(key: key);

  @override
  State<Dukkan> createState() => _DukkanState();
}

class _DukkanState extends State<Dukkan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: Center(
            child: Text('Dükkan', style: TextStyle(color: Colors.white)),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              color: Colors.teal,
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.teal,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'Ürünler', icon: Icon(Icons.view_module)),
                  Tab(text: 'Siparişler', icon: Icon(Icons.history)),
                  Tab(text: 'Kampanyalar', icon: Icon(Icons.percent))
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetay()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/kucukmasa.jpg',height: 100,width: 100,),
                                  Text('Piknik Masası'),
                                  Container(
                                    color: Colors.orangeAccent,
                                    height: 20,
                                    width: 180,
                                    child: Center(child: Text('100  Puan', style: TextStyle(color: Colors.white))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UrunAgac()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/kucuk.jpg' , height: 100, width: 100,),
                                  Text('Fidan (1 Adet)'),
                                  Container(
                                    color: Colors.orangeAccent,
                                    height: 20,
                                    width: 1700,
                                    child: Center(child: Text('100  Puan', style: TextStyle(color: Colors.white))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Icon((Icons.search_off), color: Colors.teal, size: 80),
                      Text('Hiç sipariş bulunmadı.', style: TextStyle(color: Colors.teal, fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Icon((Icons.search_off), color: Colors.teal, size: 80),
                      Text('Henüz bir kampanya yayınlanmadı.', style: TextStyle(color: Colors.teal, fontSize: 20)),
                    ],
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
