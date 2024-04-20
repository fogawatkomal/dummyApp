import 'package:application/authentication/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var isLoading = false.obs;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> getData(BuildContext context) async {
    try {
      isLoading(true);
      print(
          '==-=--=-=-=-=====fjfsdhgjkshgjkdfhsjkghdsfjkhgjkdsfhgkjef======================================');
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        // Update user display name
        await user.updateDisplayName(nameController.text);

        // await user.updatePhoneNumber(numberController.text.toString());
      }
      await FirebaseFirestore.instance.collection('users').add({
        'name': nameController.text,
        'email': emailController.text,
        'number': numberController.text,

        // Add more fields as needed
      });
      Get.to(LoginScreen());
      nameController.clear();
      passwordController.clear();
      numberController.clear();
      emailController.clear();
      // Navigate to the next screen after successful registration
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
    } catch (e) {
      Get.rawSnackbar(
          backgroundColor: Colors.black,
          icon: const Icon(
            Icons.cancel,
            color: Color(0XFFFC4442),
          ),
          borderRadius: 5,
          message: "$e",
          margin: const EdgeInsets.only(
              bottom: 20, left: 20, right: 20)); // Handle errors
      print('Error saving user data: $e');
    } finally {
      isLoading(false);
    }
  }
}
