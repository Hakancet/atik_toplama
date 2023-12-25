import 'package:flutter/material.dart';

class TemizlikGecmisiGetir extends StatefulWidget {
  const TemizlikGecmisiGetir({super.key});

  @override
  State<TemizlikGecmisiGetir> createState() => _TemizlikGecmisiGetirState();
}

class _TemizlikGecmisiGetirState extends State<TemizlikGecmisiGetir> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: Text(
            'Temizlik Geçmişi',
            style: TextStyle(color: Colors.white),
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
                  Tab(text: 'Liste'),
                  Tab(text: 'Harita'),
                  Tab(text: 'Çöp Temizliği',)
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: const [
            Center(),
            Center(),
            Center(),
          ],
        ),
      ),
    );
  }
}
