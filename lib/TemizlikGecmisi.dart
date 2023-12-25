import 'package:atiktoplama/TemizlikGecmisGetir.dart';
import 'package:flutter/material.dart';

class TemizlikGecmis extends StatefulWidget {
  const TemizlikGecmis({Key? key}) : super(key: key);

  @override
  State<TemizlikGecmis> createState() => _TemizlikGecmisState();
}

class _TemizlikGecmisState extends State<TemizlikGecmis> {
  String? mahallelist = mahalle.first;
  String? sokaklist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            'Temizlik Geçmişi',
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
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
                        mahallelist = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
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
                        sokaklist = value;
                      });
                    },
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(color: Colors.teal),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TemizlikGecmisiGetir()));
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
                        'Geçmişi Getir',
                        style: TextStyle(fontSize: 15, color: Colors.white,),
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