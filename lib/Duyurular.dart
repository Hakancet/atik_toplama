import 'package:flutter/material.dart';

class Duyurular extends StatefulWidget {
  const Duyurular({Key? key}) : super(key: key);

  @override
  State<Duyurular> createState() => _DuyurularState();
}

class _DuyurularState extends State<Duyurular> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal, // App bar rengi teal
          foregroundColor: Colors.white,
          title: Center(
            child: Text('Duyurular', style: TextStyle(color: Colors.white)),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Container(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.teal,
                indicatorColor: Colors.teal, 
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'Duyurular'), // İlk sekme
                  Tab(text: 'Bildirimler'), // İkinci sekme
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Icon(Icons.photo_library_outlined, size: 100,color: Colors.grey,),
                    Text('Henüz belediyenin yayınladığı bir duyuru yok.' , style: TextStyle(fontSize: 20, color: Colors.grey),)
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Icon(Icons.notification_important, size: 100,color: Colors.grey,),
                    Text('Henüz bir bildirim yok' , style: TextStyle(fontSize: 20, color: Colors.grey),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
