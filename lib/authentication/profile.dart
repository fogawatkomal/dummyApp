import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({super.key});

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen>
    with WidgetsBindingObserver {
  late User _user;

  @override
  void initState() {
    super.initState();
    // Get the current user from Firebase Authentication
    _user = FirebaseAuth.instance.currentUser!;
  }

  final ImagePicker _picker = ImagePicker();
  XFile? cameraFile;

  selectFromCamera() async {
    cameraFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    // imageupdatecontroller.sendData(context, cameraFile?.path);

    setState(() {});
  }

  selectFromGellary() async {
    cameraFile = await _picker.pickImage(source: ImageSource.gallery);
    // imageupdatecontroller.sendData(context, cameraFile?.path);
    setState(() {});
  }

  Future<void> _showModalBottomSheet() async {
    (showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.camera,
                  color: Color(0XFF64a3c4),
                ),
                title: const Text('Camera'),
                onTap: () {
                  selectFromCamera();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo, color: Color(0XFF64a3c4)),
                title: const Text('Gellary'),
                onTap: () {
                  selectFromGellary();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }));
  }

  String? gender;
  var gendertype = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          //  automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 82, 153, 211),
          centerTitle: true,
          title: const Text(
            'Edit Profile',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.16,
                    child: Stack(
                      children: [
                        cameraFile?.path != null
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.155,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image:
                                            FileImage(File(cameraFile!.path)))))
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.155,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://picsum.photos/400/300?random=1'),
                                        fit: BoxFit.cover))),
                        //   ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      blurRadius: 1)
                                ]),
                            child: InkWell(
                              onTap: () {
                                _showModalBottomSheet();
                              },
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Color(0XFF64a3c4),
                                size: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 14, color: Color(0XFFC4C4C4)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 2.0,
                          spreadRadius: 2,
                          offset: const Offset(
                            0,
                            0,
                          ),
                        )
                      ],
                    ),
                    child: TextFormField(
                        initialValue: _user.displayName,
                        //  controller: userdetailcontroller.nameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Your Name',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 14, color: Color(0XFFC4C4C4)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 2.0,
                          spreadRadius: 2,
                          offset: const Offset(
                            0,
                            0,
                          ),
                        )
                      ],
                    ),
                    child: TextFormField(
                        initialValue: _user.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'example@gmail.com',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mobile No.",
                      style: TextStyle(fontSize: 14, color: Color(0XFFC4C4C4)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 2.0,
                          spreadRadius: 2,
                          offset: const Offset(
                            0,
                            0,
                          ),
                        )
                      ],
                    ),
                    child: TextFormField(
                        //  controller: userdetailcontroller.phoneController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: '96XXXXXXXX',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.056,
                        width: MediaQuery.of(context).size.width * 0.41,
                        child: TextButton(
                          onPressed: () {
                            // print(
                            //     userdetailcontroller.nameController.text);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: BorderSide(
                                      color: Colors.grey.withOpacity(0.7)))),
                          child: Text("Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.056,
                          width: MediaQuery.of(context).size.width * 0.41,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 82, 153, 211),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                )),
                            child: Text("Save",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.018,
                                    color: Colors.white)),
                          ))
                      //),
                    ],
                  )
                ])),
          )),
          //   )
        ));
  }
}
