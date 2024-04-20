import 'package:application/authentication/login.dart';
import 'package:application/controller/registrationController.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var registerController = Get.put(RegistrationController());

  var valuefirst = false;
  bool isVisiblePassword = false;
  bool isVisibleRePassword = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/icon.png"),
                                fit: BoxFit.contain,
                              ),
                            )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        //  height: 52,
                        child: TextFormField(
                          controller: registerController.nameController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color(0XFFC4C4C4),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      color: Color(0XFFC4C4C4))),
                              hintStyle:
                                  const TextStyle(color: Color(0XFFC4C4C4)),
                              hintText: "Full Name",
                              fillColor: const Color(0XFFC4C4C4)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        //  height: 52,
                        child: TextFormField(
                          controller: registerController.emailController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0XFFC4C4C4),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      color: Color(0XFFC4C4C4))),
                              hintStyle:
                                  const TextStyle(color: Color(0XFFC4C4C4)),
                              hintText: "Your Email",
                              fillColor: const Color(0XFFC4C4C4)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            final emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        //  height: 52,
                        child: TextFormField(
                          controller: registerController.numberController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0XFFC4C4C4),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      color: Color(0XFFC4C4C4))),
                              hintStyle:
                                  const TextStyle(color: Color(0XFFC4C4C4)),
                              hintText: "Number",
                              fillColor: const Color(0XFFC4C4C4)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        //  height: 52,
                        child: TextFormField(
                          controller: registerController.passwordController,
                          obscureText: !isVisiblePassword,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0XFFC4C4C4),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisiblePassword = !isVisiblePassword;
                                  });
                                },
                                icon: Icon(
                                  (!isVisiblePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Color(0XFFC4C4C4))),
                              hintStyle:
                                  const TextStyle(color: Color(0XFFC4C4C4)),
                              hintText: "Password",
                              fillColor: const Color(0XFFC4C4C4)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        //  height: 52,
                        child: TextFormField(
                          // controller: registerController.rePasswordController,
                          obscureText: !isVisibleRePassword,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0XFFC4C4C4),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleRePassword = !isVisibleRePassword;
                                  });
                                },
                                icon: Icon(
                                  (!isVisibleRePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Color(0XFFC4C4C4))),
                              hintStyle:
                                  const TextStyle(color: Color(0XFFC4C4C4)),
                              hintText: "Password Again",
                              fillColor: const Color(0XFFC4C4C4)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password Again';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.063,
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                registerController.getData(
                                  context,
                                );
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 82, 153, 211),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 82, 153, 211))),
                            ),
                            child: Obx(
                              () => registerController.isLoading.value
                                  ? SizedBox(
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                                      height: 22.0,
                                      width: 22.0,
                                    )
                                  : const Text('Sign Up',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)),
                            )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have account?',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0XFFC4C4C4),
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text('Login',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 82, 153, 211),
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      )
                    ])),
          )),
        ));
  }
}
