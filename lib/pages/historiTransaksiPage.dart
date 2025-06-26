//Profile
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pesantren_bahrul_ulum/pages/mainPage.dart';
import '../constants/constants.dart';
import '../util/shared_prefs.dart';
import 'package:path/path.dart' as p;
import 'package:image/image.dart' as img;

class Historitransaksipage extends StatefulWidget {
  Historitransaksipage({Key? key, this.title}) : super(key: key);
  final String? title;

  HistoritransaksipageState createState() => HistoritransaksipageState();
}

class HistoritransaksipageState extends State {
  PreferencesUtil util = PreferencesUtil();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Mainpage()),
                (Route<dynamic> route) => false);
        return Future.value(true);
      },
      child: RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Riwayat Transaksi",
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            actions: [
            ],
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
                            (Route<dynamic> route) => false);
                    // your method (function),
                  },
                );
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Image.asset("${Constants.imageDir}placeholder.png", width:70, height: 70,),
                                SizedBox(width: 10,),
                                SizedBox(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Top Up", style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Text("Saturday",style: TextStyle(
                                      fontSize: 12
                                    ),),
                                    Text("June 9, 2025 - 06:00 PM",style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10
                                    ),),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Text("+ 1.000.000",style: TextStyle(
                              color: Color(Constants.mainColor),
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                    ),
                  );
                })
              ),
            ),
          ),
        ),
      ),
    );
  }
}
