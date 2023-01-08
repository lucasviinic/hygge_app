// ignore_for_file: prefer_const_constructors, unused_element, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:video_player/video_player.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/video04.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  margin: EdgeInsets.only(top: 220),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 65),
                        child: SvgPicture.asset('assets/svg/logo_hygge.svg', height: 70),
                      ),
                      InkWell(
                        onTap: () => print("Vai para tela de login"),
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
                    ]
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/google_logo.png', height: 40),
                      SizedBox(width: 25),
                      Image.asset('assets/img/facebook_logo.png', height: 40),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 25,
                  ),
                  // '© 2023 Hygge'
                  child: GradientText(
                    '© 2023 Hygge',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
