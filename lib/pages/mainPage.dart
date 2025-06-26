import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_bahrul_ulum/pages/ProfilePage.dart';
import 'package:pesantren_bahrul_ulum/pages/TopUpPage.dart';
import 'package:pesantren_bahrul_ulum/pages/historiTransaksiPage.dart';
import '../constants/constants.dart';
import 'package:intl/intl.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  MainpageState createState() => MainpageState();
}

class MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => profile()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "${Constants.imageDir}placeholder.png",
              ),
            ),
          ),
        ),
        title: Text(
          "Nama",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                  color: Color(Constants.secondColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Total Saldo"),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp ',
                            ).format(35000000),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Topuppage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(Constants.mainColor),
                            ),
                            child: Center(child: Text("Top Up", style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(Constants.mainColor),
                          ),
                          child: Center(child: Text("Bayar")),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Historitransaksipage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(Constants.mainColor),
                            ),
                            child: Center(
                              child: Text(
                                "Riwayat",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Berita", style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: CarouselSlider(
                  items: [
                    Image.asset("${Constants.imageDir}placeholder.png"),
                    Image.asset("${Constants.imageDir}placeholder.png"),
                    Image.asset("${Constants.imageDir}placeholder.png"),
                  ],
                  options: CarouselOptions(autoPlay: true),
                ),
              ),
              SizedBox(height: 10),
              Text("Promo", style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: CarouselSlider(
                  items: [
                    Image.asset("${Constants.imageDir}placeholder.png"),
                    Image.asset("${Constants.imageDir}placeholder.png"),
                    Image.asset("${Constants.imageDir}placeholder.png"),
                  ],
                  options: CarouselOptions(autoPlay: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
