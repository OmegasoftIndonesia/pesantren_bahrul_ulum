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

class profile extends StatefulWidget {
  profile({Key? key, this.title}) : super(key: key);
  final String? title;

  _profileState createState() => _profileState();
}

class _profileState extends State {
  PreferencesUtil util = PreferencesUtil();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  // TextEditingController kota = TextEditingController();
  // TextEditingController phone = TextEditingController();
  final picker = ImagePicker();
  String _imageProfilePath = '';
  XFile? _imageProfile;
  String? newName;
  String? trfName;
  bool buttonIsPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // email.text = util.getString(PreferencesUtil.email)!;
    // phone.text = util.getString(PreferencesUtil.phone)!;
    //kota.text = util.getString(PreferencesUtil.)
  }

  Future<void> getImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imageProfile = XFile(pickedFile.path);
        _imageProfilePath = pickedFile.path.split('/').last;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> getImageGallery() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    );

    setState(() {
      if (pickedFile != null) {
        _imageProfile = XFile(pickedFile.files.single.path!);
        _imageProfilePath = pickedFile.files.single.path!.split('/').last;
        print(_imageProfilePath);
      } else {
        print('No image selected.');
      }
    });
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
              "Profil",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 15, bottom: 10),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                              fit: BoxFit.contain,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                              errorWidget: (context, e, o) {
                                return Icon(Icons.error);
                              },
                            ),
                            Positioned(
                              bottom: 1,
                              right: 1,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext TfContext) {
                                        return StatefulBuilder(builder:
                                            (stfContext, StateSetter stfState) {
                                          return AlertDialog(
                                            title: Text("Upload Foto Profil",
                                                style: TextStyle(
                                                  color: Color(
                                                      Constants.mainColor),
                                                  fontSize: 20,
                                                )),
                                            content: Container(
                                              height: 80,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        child: Text(
                                                          (_imageProfilePath ==
                                                              "")
                                                              ? "Tidak ada gambar"
                                                              : _imageProfilePath,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                Constants
                                                                    .mainColor),
                                                            borderRadius:
                                                            BorderRadius
                                                                .all(Radius
                                                                .circular(
                                                                10))),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              showDialog<
                                                                  ImageSource>(
                                                                context:
                                                                context,
                                                                builder:
                                                                    (context) =>
                                                                    AlertDialog(
                                                                      backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                      surfaceTintColor:
                                                                      Colors
                                                                          .white,
                                                                      content: Text(
                                                                        "Pilih gambar dari",
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          child:
                                                                          Text(
                                                                            "Kamera",
                                                                            style: TextStyle(
                                                                                color:
                                                                                Colors.black),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context)
                                                                                .pop();
                                                                            getImageCamera()
                                                                                .then((onValue) {
                                                                              stfState(
                                                                                      () {});
                                                                            });
                                                                          },
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                          TextButton(
                                                                            child:
                                                                            Text(
                                                                              "Galeri",
                                                                              style:
                                                                              TextStyle(color: Colors.black),
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.of(context)
                                                                                  .pop();
                                                                              await getImageGallery()
                                                                                  .then((onValue) {
                                                                                stfState(() {});
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                              );
                                                            },
                                                            child: Text(
                                                              "Pilih",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.7,
                                                decoration: BoxDecoration(
                                                    color: Color(
                                                        Constants.mainColor),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            10))),
                                                child: TextButton(
                                                  onPressed: () async {
                                                    if (_imageProfilePath !=
                                                        "" &&
                                                        _imageProfile != null) {
                                                      print(
                                                          "old Path: ${_imageProfile!.path}");
                                                      print(
                                                          "old name: ${_imageProfilePath}");
                                                      trfName =
                                                      "fotoprofil_${util.getString(PreferencesUtil.kodePelanggan)!.replaceAll("/", "")}_${DateFormat("ddMMyyyyhhmmss").format(DateTime.now())}.jpg";
                                                      newName =
                                                          p.basenameWithoutExtension(
                                                              _imageProfile!
                                                                  .path) +
                                                              ".jpg";
                                                      final image =
                                                      img.decodeImage(File(
                                                          _imageProfile!
                                                              .path)
                                                          .readAsBytesSync())!;
                                                      Directory appDocDir =
                                                      await getApplicationDocumentsDirectory();
                                                      String appDocPath =
                                                          appDocDir.path;
                                                      new File(appDocPath +
                                                          newName!)
                                                          .writeAsBytesSync(
                                                          img.encodeJpg(
                                                              image));

                                                      print(
                                                          "new name: ${newName}");
                                                      print(
                                                          "new path: ${appDocPath}");

                                                    } else {
                                                      showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                        false,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                              backgroundColor:
                                                              Colors.white,
                                                              surfaceTintColor:
                                                              Colors.white,
                                                              content: Text(
                                                                "Bukti upload tidak boleh kosong",
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                  child: Text(
                                                                    "Tutup",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  onPressed: () {
                                                                    Navigator.of(
                                                                        TfContext)
                                                                        .pop();
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                      );
                                                    }
                                                  },
                                                  child: const Text("Upload",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16)),
                                                  // color: Color(0xFF00612d),
                                                  // textColor: Colors.white,
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      });
                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(Icons.add_a_photo,
                                        color: Colors.black),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50,
                                        ),
                                      ),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(2, 4),
                                          color: Colors.black.withOpacity(
                                            0.3,
                                          ),
                                          blurRadius: 3,
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: 70,
                      child: Text(
                       "Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ), //Nama Perusahaan
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor Induk Santri",
                            ),
                            TextField(
                              controller: phone,
                              readOnly: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "No HP",
                            ),
                            TextField(
                              controller: phone,
                              readOnly: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                            ),
                            TextField(
                              controller: email,
                              readOnly: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kota",
                            ),
                            TextField(
                              controller: email,
                              readOnly: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Lahir",
                            ),
                            TextField(
                              controller: email,
                              readOnly: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(Constants.mainColor),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext LogoutContext) {
                                    return ButtonBarTheme(
                                        data: ButtonBarThemeData(
                                            alignment:
                                            MainAxisAlignment.center),
                                        child: AlertDialog(
                                          title: Text(
                                            "Sign Out",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          content:
                                          Text("Anda yakin ingin keluar?"),
                                          actions: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(
                                                            LogoutContext)
                                                            .pop();
                                                        //SPdeleteCustData(context);
                                                      },
                                                      child: Text("Ya")),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(
                                                            LogoutContext)
                                                            .pop();
                                                      },
                                                      child: Text("Tidak"))
                                                ])
                                          ],
                                        ));
                                  },
                                  barrierDismissible: false);
                            },
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
