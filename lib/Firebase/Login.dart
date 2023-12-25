import 'package:atiktoplama/Firebase/KullaniciLogin.dart';
import 'package:atiktoplama/Firebase/numaraOnay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  static String routeName = 'loginPage';
  static String verify = '';

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  var maskFormatter = MaskTextInputFormatter(
    mask: '(###) ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  bool isChecked = false;

  bool isButtonEnabled() {
    return telefonController.text.trim().isNotEmpty && isChecked;
  }


  final TextEditingController telefonController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void _saveData() {
    String telefon = telefonController.text;

    _firestore.collection('phone').add({
      'telefon': telefon,
    }).then((value) {
      print('Kullanıcı bilgileri kaydedildi.');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => numaraOnay()),
      );
    }).catchError((error) {
      print('Hata oluştu: $error');
    });
  }

  void _verifyPhoneNumber(BuildContext context) async {
    String phoneNumber =
        '+90 ${telefonController.text.trim()}';

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        loginPage.verify = verificationId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const numaraOnay(),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/Gazi.png', width: 150, height: 150,)),
              const Text(
                'Gaziantep Atık Nakit Uygulamasına Hoşgeldiniz,\nBaşlamak için telefon numaranızı girin.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: telefonController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '(5XX-XXX-XX-XX)',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'KVKK Sözleşmesini okudum ve kabul ediyorum.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 0,
              ),
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: isButtonEnabled() ? () {
                      _saveData();
                      _verifyPhoneNumber(context);
                    } : null,
                    child: const Text(
                      'KODU GÖNDER',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KullaniciLogin()));
                },
                child: const Text(
                  'Kullanıcı Adı/Şifre İle Giriş Yap',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
