import 'package:atiktoplama/Firebase/Login.dart';
import 'package:atiktoplama/Firebase/kisiKayit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class numaraOnay extends StatefulWidget {
  const numaraOnay({Key? key}) : super(key: key);

  @override
  State<numaraOnay> createState() => _numaraOnayState();
}

class _numaraOnayState extends State<numaraOnay> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController onayController = TextEditingController();

  bool isButtonEnabled() {
    return onayController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Gazi.png',
                  height: 90,
                  width: 90,
                ),
              ),
              const Text(
                'Telefonunuza Gelen Doğrulama Kodunu Girin',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 128,
                  left: 128,
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: onayController,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.teal, width: 2),
                ),
                child: InkWell(
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                        verificationId: loginPage.verify,
                        smsCode: onayController.text.trim(),
                      );
                      await auth.signInWithCredential(credential);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const kisiKayit()),
                      );
                    } catch (e) {
                      print('hata aldın');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 5,
                          color: Colors.white),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: const Center(
                      child: Text(
                        'Onayla',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
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
