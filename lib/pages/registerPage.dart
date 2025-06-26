import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_bahrul_ulum/constants/constants.dart';
import 'package:pesantren_bahrul_ulum/pages/OtpPage.dart';
import 'package:pesantren_bahrul_ulum/pages/loginPage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  RegisterpageState createState() => RegisterpageState();
}

class RegisterpageState extends State<Registerpage> {
  TextEditingController NIS = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController BirthDate = TextEditingController();
  TextEditingController City = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Let's Get Started!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Create an account to get all features"),
                  ],
                ),
              ),

              SizedBox(
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextField(
                        controller: NIS,
                        decoration: InputDecoration(
                          hintText: "Nomor Induk Santri",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            Icons.library_add_check,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextField(
                        controller: Name,
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(Icons.person, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextField(
                        controller: Phone,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(Icons.phone, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextField(
                        controller: Email,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(Icons.email, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextField(
                        controller: BirthDate,
                        decoration: InputDecoration(
                          hintText: "Birth Date",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: TextField(
                        controller: City,
                        decoration: InputDecoration(
                          hintText: "City",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(Icons.location_city, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(Constants.mainColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => otp()),
                          );
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Color(Constants.mainColor),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (_) => false,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
