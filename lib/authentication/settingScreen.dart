// ignore_for_file: file_names

import 'package:application/authentication/login.dart';
import 'package:application/authentication/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late User _user;

  @override
  void initState() {
    super.initState();
    // Get the current user from Firebase Authentication
    _user = FirebaseAuth.instance.currentUser!;
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.clear();

        prefs.remove('tokenNotification');

        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Log out",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
      content: const Text(
        'Would you like to continue to log out?',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      titlePadding: const EdgeInsets.only(left: 20, top: 20),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _launchURLprivacy() async {
    launchUrl(Uri.parse(
        'https://www.termsandconditionsgenerator.com/live.php?token=4rPEKgQC23Wgm7KiXUI1VrRNsdLalGaJ'));
  }

  void _launchURLterms() async {
    launchUrl(Uri.parse(
        "https://www.termsandconditionsgenerator.com/live.php?token=zwrD7M91zZWBl5Uor9FxTSWObygmTbeE"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 153, 211),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color.fromARGB(255, 82, 153, 211),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_user.displayName}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        const EditprofileScreen(),
                      );
                    },
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 182, 226, 252),
                              borderRadius: BorderRadius.circular(5)),
                          height: 30,
                          width: 30,
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 23,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text('View Profile',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURLterms();
                    },
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 182, 226, 252),
                              borderRadius: BorderRadius.circular(5)),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.privacy_tip_outlined,
                            size: 23,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text('Privacy & Policy',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURLprivacy();
                    },
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 182, 226, 252),
                              borderRadius: BorderRadius.circular(5)),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.thermostat_auto_outlined,
                            size: 23,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text('Terms and Conditions',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 182, 226, 252),
                              borderRadius: BorderRadius.circular(5)),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: const Icon(
                            size: 23,
                            Icons.logout,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text("Logout",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
