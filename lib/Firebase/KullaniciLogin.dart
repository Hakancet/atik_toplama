import 'package:atiktoplama/Menu/Homepage.dart';
import 'package:flutter/material.dart';

class KullaniciLogin extends StatefulWidget {
  const KullaniciLogin({Key? key}) : super(key: key);

  @override
  State<KullaniciLogin> createState() => _KullaniciLoginState();
}

class _KullaniciLoginState extends State<KullaniciLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isAccepted = false;
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bir kullanıcı adı girin.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bir şifre girin.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset('assets/images/Gazi.png', width: 150, height: 150,)),
              SizedBox(height: 10,),
              Text(
                'Atık Nakite Hoşgeldiniz',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Sadece yetkili personeller kullanıcı adı ile Giriş yapabilir',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Kullanıcı Adı',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      border: InputBorder.none,
                    ),
                    validator: _validateUsername,
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    controller: passwordController,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Şifre',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      border: InputBorder.none,
                    ),
                    validator: _validatePassword,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAccepted = !isAccepted;
                      });
                    },
                    child: Text(
                      'KVKK Sözleşmesini okudum ve kabul ediyorum',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Checkbox(
                    value: isAccepted,
                    onChanged: (newValue) {
                      setState(() {
                        isAccepted = newValue ?? false;
                      });
                    },
                    checkColor: Colors.teal,
                    activeColor: Colors.white,
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.teal, width: 2),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric( horizontal: 25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Center(
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
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
