import 'package:application/authentication/bottombar.dart';
import 'package:application/authentication/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> getData(BuildContext context) async {
    try {
      isLoading(true);
      print(
          '==-=--=-=-=-=====fjfsdhgjkshgjkdfhsjkghdsfjkhgjkdsfhgkjef======================================');
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('==-=--=-=-=-===========================================');
      Get.offAll(Bottombar());
      emailController.clear();
      passwordController.clear();
      late User _user;

      _user = FirebaseAuth.instance.currentUser!;

      //  print(value);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('tokenNotification', _user.uid);
      print(prefs.getString('tokenNotification'));
      // Navigate to home feed on successful login
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(
          '==-=--=-=-=-=====fjfsdhgjkshgjkdfhsjkghdsfjkhgjkdsfhgkjef============hggfhjdsbghjjgjsdg==========================');
      Get.rawSnackbar(
          backgroundColor: Colors.black,
          icon: const Icon(
            Icons.cancel,
            color: Color(0XFFFC4442),
          ),
          borderRadius: 5,
          message: "$e",
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      if (e.code == 'user-not-found') {
        Get.rawSnackbar(
            backgroundColor: Colors.black,
            icon: const Icon(
              Icons.cancel,
              color: Color(0XFFFC4442),
            ),
            borderRadius: 5,
            message: "${e.code}",
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

        Get.rawSnackbar(
            backgroundColor: Colors.black,
            icon: const Icon(
              Icons.cancel,
              color: Color(0XFFFC4442),
            ),
            borderRadius: 5,
            message: "${e.code}",
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20));
      }
    } finally {
      isLoading(false);
    }
  }
}
