// ignore_for_file: prefer_const_constructors, unused_element, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:hygge_app/Start/Login/login.dart';
import 'package:hygge_app/Start/Register/register.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;

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

  void _goToPageImmediately(int page) {
    buttonCarouselController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  //go to page with animation
  void _goToPage(int page) {
    buttonCarouselController.animateToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            InkWell(
              onTap: () => _goToPage(1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple, Colors.red]
                    ),
                    width: 2
                  ),
                ),
                child: Center(
                  child: GradientText(
                  'Sign In',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            InkWell(
              onTap: () => _goToPage(2),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purple, Colors.red]
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
      currentPage == 1 ? Login(context: context) : SizedBox.shrink(),
      currentPage == 2 ? Register(context: context) : SizedBox.shrink(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(children: [
                    InkWell(
                      onTap: () => _goToPage(0),
                      child: SvgPicture.asset('assets/svg/logo_hygge.svg', height: 70)
                    ),
                    Container(
                      child: CarouselSlider(
                        items: pages,
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.45,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                  child: GradientText(
                    '© 2023 Hygge',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
