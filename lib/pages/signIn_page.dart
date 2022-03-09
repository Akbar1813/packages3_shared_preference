import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packages3_shared_preference/models/user_model.dart';
import 'package:packages3_shared_preference/pages/signUp_page.dart';
import 'package:packages3_shared_preference/services/pref_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static final String id = 'signIn_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void _doLogIn(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {
      print(user?.email)
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 50),
            child: Column(
              children: [
                // image
                Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/images/login.png'),
                ),

                // Welcome Back
                Text("Welcome Back!",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 5,),
                Text('Log in to your existant account of Q Allure',style: TextStyle(
                  color: Colors.grey,
                ),),
                SizedBox(height: 40,),

                // Email field
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
                      icon: Icon(CupertinoIcons.person,color: Colors.grey,size: 16,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                // password field
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("Forgot Password?",style: TextStyle(color: Colors.grey.shade700),),
                      onPressed: (){},
                    )
                  ],
                ),
                SizedBox(height: 10,),
                // logIn button
                Container(
                  padding: EdgeInsets.only(right: 15,left: 15),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    child: Text("LOG IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: _doLogIn,
                  ),
                ),
                SizedBox(height: 30,),
                Text("Or connect using",style: TextStyle(color: Colors.grey),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.facebook_outlined,color: Colors.white,),
                        label: Text("Facebook",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.g_mobiledata,color: Colors.white,),
                        label: Text("Google",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account?",style: TextStyle(color: Colors.grey.shade900),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, SignUpPage.id);
                        },
                        child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),)
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
