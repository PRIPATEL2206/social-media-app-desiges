import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_2/app_card.dart';
import 'package:social_media_app_2/masage_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = [
      "assets/images/p1.jpg",
      "assets/images/p2.jpg",
      "assets/images/p3.jpg",
      "assets/images/p4.jpg",
      "assets/images/p5.jpeg",
      "assets/images/p6.jpg",
    ];

    final name = [
      "likes",
      "Tony",
      "Jemes",
      "Jorden",
      "Tony",
      "Jorde",
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 237, 237),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: [
          const SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/p1.jpg"),
              ),
              const Text(
                "Find Flames",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 241, 120, 120)),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.display_settings,
                    size: 30,
                  ))
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < imagePath.length; i++)
                  AppCard(imagePath: imagePath[i], name: name[i]),
              ],
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  // color: Colors.white,
                  width: double.infinity,
                  child: Column(children: [
                    const SizedBox(
                      height: 34,
                    ),
                    MassageBox(
                        name: "Jorden",
                        massege: "hii!",
                        imagePath: imagePath[1],
                        isVerified: true,
                        time: "10:30",
                        numberOfMaseges: 1),
                    MassageBox(
                        name: "Tim",
                        massege: "hii!",
                        imagePath: imagePath[2],
                        isVerified: true,
                        time: "10:30",
                        numberOfMaseges: 2),
                    MassageBox(
                        name: "Jamese",
                        massege: "typing...",
                        imagePath: imagePath[4],
                        isVerified: true,
                        time: "10:30",
                        numberOfMaseges: 2),
                  ]),
                ),
              )
            ],
          ))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 51, 44, 44),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.south_america_sharp,
                  color: Color.fromARGB(255, 51, 44, 44),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: Color.fromARGB(255, 51, 44, 44),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_2,
                  color: Color.fromARGB(255, 51, 44, 44),
                ),
                label: ""),
          ]),
    );
  }
}
