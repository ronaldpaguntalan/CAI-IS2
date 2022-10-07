import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:group3_finalproject/screens/mainhomepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {

  //FOR GENERATING CAPTCHA ~~~~~
  String generateCaptcha(){
    const length = 3;
    const letterLowercase = 'abcdefghijklmnopqrstuvwxyz';
    const letterUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';

    String chars = '';
    chars += '$letterLowercase$letterUppercase';
    chars += '$numbers';

    return List.generate(length, (index){
      final indexRandom = Random.secure().nextInt(chars.length);

      return chars[indexRandom];
    }).join(''); //List.generate
  }

  final controllerCaptcha = TextEditingController();
  final writingCaptcha = TextEditingController();

  @override

  void dispose(){
    controllerCaptcha.dispose();
    writingCaptcha.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x662acaea),
                      Color(0x992acaea),
                      Color(0xcc2acaea),
                      Color(0xff2acaea),
                    ]
                  ),
                ),

                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120,
                  ),
                    child: Column(
                      children: [
                        const Text(
                          'Deployment, Maintenance and Quality System',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height:40),
                        TextField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          controller: controllerCaptcha,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightBlueAccent,
                              hintText: 'Click Generate',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height:30),

                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [const Text(
                        'Enter the Captcha to LogIn',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0,2)
                              ),
                            ],
                          ),
                          height: 60,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: writingCaptcha,
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.keyboard_alt_outlined,
                                color: Color(0xff2acaea),
                              ),
                              hintText: 'Enter Captcha',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                     ),
                        const SizedBox(height:20),
                        SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                          final password = generateCaptcha();
                          controllerCaptcha.text = password;
                          },
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                          ),
                          color: Colors.white,
                          child: const Text(
                          'GENERATE CAPTCHA',
                            style: TextStyle(
                            color: Color(0xff2acaea),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                             ),
                            ),
                           ),
                          ),
                        const SizedBox(height:10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical:5),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5,
                            onPressed: () {
                              final getCaptcha = controllerCaptcha.text;
                              final sulatCaptcha = writingCaptcha.text;

                              if(getCaptcha == sulatCaptcha){
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => MainHomePage(

                                    )));
                              }
                              else{
                                print('MALII ANG CAPTCHA MO');

                              }
                            },
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            color: Colors.white,
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Color(0xff2acaea),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
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
}
