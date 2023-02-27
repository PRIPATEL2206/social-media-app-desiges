import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MassageBox extends StatelessWidget {
  final String name;
  final String massege;
  final String imagePath;
  final bool isVerified;
  final String time;
  final int numberOfMaseges;

  const MassageBox(
      {super.key,
      required this.name,
      required this.massege,
      required this.imagePath,
      required this.isVerified,
      required this.time,
      required this.numberOfMaseges});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  width: 5,
                ),
                isVerified
                    ? const Icon(
                        size: 19,
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.blueAccent,
                      )
                    : Container(),
              ],
            ),
            Text(
              massege,
              style: const TextStyle(fontSize: 19),
            )
          ],
        ),
        Expanded(child: Container()),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time),
            Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(4),
                  color: Color.fromARGB(255, 253, 123, 123),
                ),
                child: Text(
                  "$numberOfMaseges",
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        )
      ]),
    );
  }
}
