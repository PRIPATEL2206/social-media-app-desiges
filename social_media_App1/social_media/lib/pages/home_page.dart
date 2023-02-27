import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/app_text.dart';
import 'package:social_media/pages/photo_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: -90,
            left: -90,
            child: Transform.rotate(
              angle: pi / 4,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  color: Color.fromARGB(255, 233, 243, 252),
                ),
                width: 250,
                height: 250,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/first.jpg"),
                      radius: 30,
                    ),
                    Row(
                      children: [
                        const Text("150",
                            style: TextStyle(color: Colors.yellow)),
                        const Icon(
                          size: 30,
                          Icons.diamond_outlined,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            const SizedBox(
                              height: 45,
                              width: 35,
                              child: Icon(
                                CupertinoIcons.bell_fill,
                                color: Colors.redAccent,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                width: 11,
                                height: 11,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent),
                                child: const Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppText(
                  text: "Welcome",
                  color: Colors.grey,
                  fontSize: 17,
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppText(
                  text: "Shikha Gaur!",
                  color: Colors.blue,
                  fontSize: 25,
                  fontFamily: "Roboto",
                ),
                const SizedBox(
                  height: 15,
                ),

                // photos
                const Expanded(flex: 7, child: PhotoSlider()),
              ],
            ),
          ),
          Positioned(
            height: 100,
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              width: 380,
              color: const Color.fromARGB(255, 241, 238, 238),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(CupertinoIcons.person_2_fill),
                      const Icon(CupertinoIcons.device_phone_landscape),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          AppText(
                            text: "Swipe",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      const Icon(CupertinoIcons.person_3_fill),
                      const Icon(CupertinoIcons.chat_bubble_text_fill),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 160,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 10,
                  )
                ],
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.swipe_up,
                size: 40,
                color: Colors.white,
              ),
            ),
          )
        ],
      )),
    );
  }
}
