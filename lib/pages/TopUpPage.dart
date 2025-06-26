import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_bahrul_ulum/pages/ProfilePage.dart';
import 'package:pesantren_bahrul_ulum/pages/historiTransaksiPage.dart';
import 'package:pesantren_bahrul_ulum/pages/mainPage.dart';
import '../constants/constants.dart';
import 'package:intl/intl.dart';

class Topuppage extends StatefulWidget {
  const Topuppage({super.key});

  @override
  TopuppageState createState() => TopuppageState();
}

class TopuppageState extends State<Topuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Top Up Page", style: TextStyle(color: Colors.black)),
        elevation: 0,
        actions: [],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.black,
              ),
              // Put icon of your preference.
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Mainpage()),
                  (Route<dynamic> route) => false,
                );
                // your method (function),
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(Constants.secondColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset("${Constants.imageDir}placeholder.png"),
                SizedBox(height: 10),
                Text("Nomor Virtual Account"),
                SizedBox(
                  child: Text(
                    "111111111",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Container(
                  width: 60,

                  decoration: BoxDecoration(
                      color: Color(Constants.mainColor),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text("Salin", style: TextStyle(
                      color: Colors.white
                  ),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
