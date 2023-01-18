// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class Login extends StatefulWidget {
  final BuildContext context;
  const Login({super.key, required this.context});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(widget.context).size.width * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              border: GradientOutlineInputBorder(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purple, Colors.red]),
                width: 2,
                borderRadius: BorderRadius.circular(50)
              ),
              focusedBorder: GradientOutlineInputBorder(
                  gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple, Colors.red]),
                  width: 2,
                  borderRadius: BorderRadius.circular(50)),
              label: Text(
                "Digite seu nome de usuário",
                style: TextStyle(
                  fontSize: 13
                ),
              )
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.045,
        ),
        TextField(
          obscureText: true,
          obscuringCharacter: '●',
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
              contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: GradientOutlineInputBorder(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purple, Colors.red]),
                width: 2,
                borderRadius: BorderRadius.circular(50)
              ),
              focusedBorder: GradientOutlineInputBorder(
                  gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple, Colors.red]),
                  width: 2,
                  borderRadius: BorderRadius.circular(50)),
              label: Text(
                "Digite sua senha",
                style: TextStyle(
                  fontSize: 13
                ),
              )
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 40),
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.indigo, Colors.purple, Colors.red]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          ),
        )
      ]),
    );
  }
}
