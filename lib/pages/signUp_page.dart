import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packages3_shared_preference/models/account_model.dart';
import 'package:packages3_shared_preference/pages/signIn_page.dart';
import 'package:packages3_shared_preference/services/pref_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static final String id = 'signUp_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmController = TextEditingController();
  void _doSignUp(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String name = nameController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String confirmPassword = confirmController.text.toString().trim();
    Account account = Account.from(
        name: name,
        email: email,
        phone: phone,
        password: password,
      confirmPassword: confirmPassword
    );
    Prefs.storeAccount(account);
    Prefs.loadAccount().then((account) => {
    print("Name: ${account?.name}"),
    print("Email: ${account?.email}"),
    print("Phone: ${account?.phone}"),
    print("Password: ${account?.password}"),
    print("Confirm password: ${account?.confirmPassword}")
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(right: 20,left: 20,top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(CupertinoIcons.arrow_left),
                  ],
                ),
                SizedBox(height: 50,),
                Text("Let's Get Started!",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Create an Account to Q Allure to get all features',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 40,),

                // Name
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.person,color: Colors.grey,size: 16,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // Email
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.mail,color: Colors.grey,size: 16,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // Phone
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.device_phone_portrait,color: Colors.grey,size: 16,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // Password
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.lock,color: Colors.grey,size: 16,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // Confirm password
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: confirmController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                      border: InputBorder.none,
                      icon: Icon(CupertinoIcons.lock,color: Colors.grey,size: 16,),
                    ),
                  ),
                ),
                SizedBox(height: 40,),

                // Login Button
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                    onPressed: _doSignUp,
                  ),
                ),

                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?",style: TextStyle(color: Colors.grey.shade900),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, SignInPage.id);
                        },
                        child: Text('Login here',style: TextStyle(fontWeight: FontWeight.bold),)
                    )
                  ],
                )
              ],
            )
        ),
      )
    );
  }
}
