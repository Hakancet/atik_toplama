import 'package:flutter/material.dart';

class EnCokAtik extends StatefulWidget {
  const EnCokAtik({Key? key}) : super(key: key);

  @override
  State<EnCokAtik> createState() => _EnCokAtikState();
}

class _EnCokAtikState extends State<EnCokAtik> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  Tab(text: 'Son 7 Gün'), // İlk sekme
                  Tab(text: 'Son 30 Gün'),
                  Tab(text: 'Tüm Zamanlar',)// İkinci sekme
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
            ),
            Center(
            ),
            Center(
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
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
