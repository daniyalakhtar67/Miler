import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:running_app/ui/login.dart';
import 'package:running_app/ui/login.dart';
import 'package:running_app/ui/signup.dart';
import 'package:running_app/widgets/colors.dart';
import 'package:running_app/widgets/utils.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }



  Widget _blob(Color color, double size) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(color: AppColors.backgroundDark),
            ),
            Positioned(top: -50, left: -50, child: _blob(AppColors.new1, 200)),
            Positioned(top: 100, right: -60, child: _blob(AppColors.new2, 220)),
            Positioned(bottom: -60, left: 60, child: _blob(AppColors.new3, 200)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.purpleAccent,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white),
                          controller: email,
                          decoration: InputDecoration(

                            prefixIcon: Icon(Icons.alternate_email, color: Colors.white),
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: pass,
                          obscureText: true,
                          obscuringCharacter: '*',
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                loading =  true;
                              });
                              _auth.createUserWithEmailAndPassword(email: email.text.toString(),
                                  password: pass.text.toString()).then((value){
                                Utils().tomsg('Account Created');
                                Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Login()));
                              }).onError((error, stackTrace){
                                Utils().tomsg(error.toString());
                              }).whenComplete((){
                                setState(() {
                                  loading = false;
                                });
                              });

                            }
                          },
                          child: loading
                              ? CircularProgressIndicator(strokeWidth: 3)
                              : Text('SIGN UP'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     'Already have an account',
                     style: TextStyle(color: Colors.white, fontSize: 18),
                   ),
                   TextButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Login()),
                       );
                     },
                     child: Text(
                       'LOGIN',
                       style: TextStyle(
                         color: Colors.pink,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),

                 ],
               )
              ],
            ),
          ],
        ),
      ),
    );
  }
}