// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({super.key});

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('/login'),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [Colors.indigo, Colors.purple, Colors.red]),
                  width: 2
                ),
              ),
              child: Center(
                child: GradientText(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
          ),
          InkWell(
            onTap: () => print("Vai para tela de cadastro tradicional"),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.purple, Colors.red]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
