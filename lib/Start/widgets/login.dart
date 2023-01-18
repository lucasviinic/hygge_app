// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 65),
                child: SvgPicture.asset('assets/svg/logo_hygge.svg', height: 70),
              ),
              TextField(
                decoration: InputDecoration(
                  border: GradientOutlineInputBorder(
                    gradient: LinearGradient(colors: [Colors.indigo, Colors.purple, Colors.red]),
                    width: 2,
                  ),
                  focusedBorder: GradientOutlineInputBorder(
                  gradient: LinearGradient(colors: [Colors.indigo, Colors.purple, Colors.red]),
                    width: 2
                  ),
                label: Text("Example")),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
              ),
            ]
          ),
        ],
      ),
    );
  }
}
