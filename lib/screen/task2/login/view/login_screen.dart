import 'package:exam_1/screen/task2/login/provider/login_proivder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider? loginProviderf;
  LoginProvider? loginProvidert;
  @override
  Widget build(BuildContext context) {
    loginProviderf = Provider.of<LoginProvider>(context,listen: false);
    loginProvidert = Provider.of<LoginProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade100,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: loginProviderf!.txtemail ,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal)),
                          label: Text(
                            "Email",
                            style: TextStyle(color: Colors.teal.withOpacity(0.80)),
                          )),
                      // controller:
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: loginProviderf!.txtpass,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal)),
                          label: Text(
                            "Password",
                            style: TextStyle(color: Colors.teal.withOpacity(0.80)),
                          )),
                      // controller:
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        loginProviderf!.singup(loginProviderf!.txtemail.text,loginProviderf!.txtpass.text);
                        loginProviderf!.txtpass.clear();
                        loginProviderf!.txtemail.clear();
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("Sing Up",style: TextStyle(color: Colors.teal)),
                        decoration: BoxDecoration(color: Colors.teal.shade100,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal)),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          child: Icon(
            Icons.person,
            color: Colors.teal,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: loginProviderf!.txtemail,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal.shade900)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal.shade900)),
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.teal.withOpacity(0.80)),
                    )),
                // controller:
              ),
              SizedBox(height: 10,),
              TextField(
                controller: loginProviderf!.txtpass,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal.shade900)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal.shade900)),
                    label: Text(
                      "Password",
                      style: TextStyle(color: Colors.teal.withOpacity(0.80)),
                    )),
                // controller:
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  loginProviderf!.read();
                  print(loginProviderf!.email);
                  print(loginProviderf!.pass);
                  print(loginProviderf!.txtemail.text);
                  print(loginProviderf!.txtpass.text);
                  if(loginProviderf!.email==loginProviderf!.txtemail&&loginProviderf!.pass==loginProviderf!.txtpass)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong id & pass....")));
                    }
                  else
                    {
                      Navigator.pushReplacementNamed(context, 'task2');
                    }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("Login",style: TextStyle(color: Colors.teal,fontSize: 25)),
                  decoration: BoxDecoration(color: Colors.teal.shade100,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
