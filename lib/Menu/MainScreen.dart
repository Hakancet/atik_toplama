import 'package:atiktoplama/Atik/NereyeAtarim.dart';
import 'package:atiktoplama/Dukkan.dart';
import 'package:atiktoplama/ToplananAtiklar.dart';
import 'package:atiktoplama/qrCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Atık Nakit',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const QrCode()));
              },
              icon: const Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
                size: 40,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      'assets/images/arkaplan.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.topRight,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text("Bu bölgede henüz randevu verme işlemi \n başlamadı" , style: TextStyle(color: Colors.teal)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NereyeAtarim()),
                                );
                              },
                              child: const Text("ATIĞIMI NEREYE ATABİLİRİM?" , style: TextStyle(color: Colors.teal),),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("İPTAL" , style: TextStyle(color: Colors.teal),),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    child: Image.asset(
                      'assets/images/co.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ToplananAtiklar()));
                        },
                        child: Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.teal.shade700,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Topladığım Atıklar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '0 Kg',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dukkan()));
                        },
                        child: Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.teal.shade700,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.storefront_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Dükkan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '0,0 AtıkPuan',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
