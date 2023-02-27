import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String imagePath;
  final String name;
  const AppCard({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      margin: const EdgeInsets.only(right: 10),
      // height: 50,
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imagePath)),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
          Positioned(
              bottom: 0,
              left: 21,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Text(name),
              )),
        ],
      ),
    );
  }
}
