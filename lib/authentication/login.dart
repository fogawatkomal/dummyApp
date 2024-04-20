import 'package:application/authentication/registration.dart';
import 'package:application/controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var loginController = Get.put(LoginController());
  bool isVisiblePassword = false;

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
                        // color: Colors.amber,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/icon.png"),
                            fit: BoxFit.contain,
                          ),
                        )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(
                    //  height: 52,
                    child: TextFormField(
                      controller: loginController.emailController,
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.only(left: 2, right: 2),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey.withOpacity(0.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  const BorderSide(color: Color(0XFFC4C4C4))),
                          // filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.7)),
                          hintText: "Your Email",
                          fillColor: Colors.white70),
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    //  height: 52,
                    child: TextFormField(
                      controller: loginController.passwordController,
                      obscureText: !isVisiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey.withOpacity(0.7),
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
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  const BorderSide(color: Color(0XFFC4C4C4))),
                          // filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.7)),
                          hintText: "Password",
                          fillColor: Colors.white70),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forget Password?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.063,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginController.getData(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 82, 153, 211),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 82, 153, 211),
                              )),
                        ),
                        child: Obx(() => loginController.isLoading.value
                            ? const SizedBox(
                                height: 22.0,
                                width: 22.0,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text('Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?',
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
                                        const RegistrationScreen()));
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 82, 153, 211),
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
