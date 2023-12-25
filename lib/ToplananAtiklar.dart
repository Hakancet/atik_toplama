import 'package:flutter/material.dart';

class ToplananAtiklar extends StatefulWidget {
  const ToplananAtiklar({Key? key}) : super(key: key);

  @override
  State<ToplananAtiklar> createState() => _ToplananAtiklarState();
}

class _ToplananAtiklarState extends State<ToplananAtiklar> {
  DateTime? selectedDate;
  DateTime? selecteddData;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            title: const Center(
              child: Text('Topladığım Atıklar',
                  style: TextStyle(color: Colors.white)),
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
                    Tab(text: 'Atık Randevularım'),
                    Tab(text: 'Atık Makbuzu Oluştur'),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              const Center(
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Icon(
                          Icons.event_note,
                          size: 100,
                          color: Colors.grey,
                        ),
                        Text(
                          'Daha önce toplanmış bir randevunuz \n bulunmamaktadır.',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Başlangıç Tarihi Seç',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      selectedDate != null
                          ? Text(
                              'Seçilen Tarih: ${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}')
                          : const Text(''),
                      InkWell(
                        onTap: () => _selecttDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Bitiş Tarihi Seç',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      selecteddData != null
                          ? Text(
                              'Seçilen Tarih: ${selecteddData!.day}.${selecteddData!.month}.${selecteddData!.year}')
                          : const Text(''),
                      const Text(
                          'Seçtiğiniz terih aralığında topladığınız atıklar için bir makbuz \n oluşturabilirsiniz.'),
                      Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.teal),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 5,
                                  color: Colors.teal),
                              color: Colors.teal,
                            ),
                            child: const Center(
                              child: Text(
                                'Makbuz Oluştur',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
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


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selecttDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selecteddData) {
      setState(() {
        selecteddData = picked;
      });
    }
  }
}
