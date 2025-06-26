import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_bahrul_ulum/pages/mainPage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../constants/constants.dart';

class otp extends StatefulWidget {
  otp({Key? key, this.noHP, this.tipe, this.purpose, this.newPass})
    : super(key: key);
  final String? noHP;
  final String? tipe;
  final String? purpose;
  final String? newPass;

  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {
  String otpVal = "";
  Timer? _timer;
  int Start = 0;
  bool isVisible = false;

  @override
  void initState() {
    timerStart();
    super.initState();
  }

  void timerStart() {
    Start = 60;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (Start == 0) {
        if (this.mounted) {
          setState(() {
            isVisible = true;
            timer.cancel();
          });
        }
      } else {
        if (this.mounted) {
          setState(() {
            Start--;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("${Constants.imageDir}placeholder.png"),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Input OTP Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 15),
                child: Text(
                  'Input 6 digit OTP Code that you receive on your WhatsApp',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 10),
                width: 300,
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(color: Color(Constants.mainColor)),
                  appContext: context,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    inactiveFillColor: Colors.transparent,
                    selectedFillColor: Colors.transparent,
                    selectedColor: Color(Constants.mainColor),
                    activeColor: Color(Constants.mainColor),
                    inactiveColor: Colors.black12,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  onChanged: (value) {
                    otpVal = value;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: RichText(
                        text: TextSpan(
                          text: "Resend",
                          style: TextStyle(
                            color: Color(Constants.mainColor),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              timerStart();
                            },
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isVisible,
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: RichText(
                        text: TextSpan(
                          text: "$Start",
                          style: TextStyle(
                            color: Color(Constants.mainColor),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.only(top: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(Constants.mainColor),
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (otpVal.length == 6) {
                        //setState(() {});
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Mainpage()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext depositContext) {
                            return ButtonBarTheme(
                              data: ButtonBarThemeData(
                                alignment: MainAxisAlignment.center,
                              ),
                              child: AlertDialog(
                                title: Text(
                                  "KODE TIDAK LENGKAP!",
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text("Kode OTP tidak lengkap"),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(depositContext).pop();
                                        },
                                        child: Text("Tutup"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          barrierDismissible: false,
                        );
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ), //Button Masuk
            ],
          ),
        ),
      ),
    );
  }
}
