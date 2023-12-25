import 'package:atiktoplama/Atik/NereyeAtarim.dart';
import 'package:atiktoplama/Duyurular.dart';
import 'package:atiktoplama/EnCokAtik.dart';
import 'package:atiktoplama/Firebase/Login.dart';
import 'package:atiktoplama/Firebase/Profilim.dart';
import 'package:atiktoplama/Bildirim/GeriBildirim.dart';
import 'package:atiktoplama/Hakkimizda.dart';
import 'package:atiktoplama/KarbonAyak.dart';
import 'package:atiktoplama/TemizlikGecmisi.dart';
import 'package:atiktoplama/ToplananAtiklar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Column(
              children: [
                const Text(
                  'Kullanıcı Adı',
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  'Gaziantep Büyükşehir Belediyesi',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Profil()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.person, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Profilim' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ToplananAtiklar()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Topladığım Atıklar' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Duyurular()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Duyurular' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NereyeAtarim()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.map, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Atığımı Nereye \n Atabilirim?' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnCokAtik()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.trending_up, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('En Çok Atık Verenler' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TemizlikGecmis()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.notifications_active, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Temizlik Geçmişi' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const KarbonAyak()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.edit, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Karbon Ayak İzi \n Hesaplama' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const GeriBildirim()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.forum, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Geri Bildirim' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Hakkimizda()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.info, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Hakkımızda' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    FirebaseAuth.instance.signOut().then((value) => {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const loginPage()), (Route<dynamic> route) => false)
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.logout, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Çıkış Yap' ,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/logotaban.png'),
                const Text('Sürüm: Deneme' , style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
