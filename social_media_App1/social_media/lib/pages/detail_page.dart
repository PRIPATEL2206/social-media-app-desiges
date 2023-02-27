import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/interest_container.dart';

import '../components/app_text.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;

  const DetailPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      height: 355,
      child: Column(children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 45,
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppText(
              text: "Samara Doe, ",
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            Icon(
              CupertinoIcons.checkmark_seal_fill,
              size: 30,
              color: Colors.blue,
            )
          ],
        ),
        const AppText(
          text: "Live in Spain",
          fontSize: 20,
        ),
        const SizedBox(
          width: double.maxFinite,
          child: AppText(
              fontSize: 15,
              textAlign: TextAlign.center,
              text:
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Adipisci magni voluptate eum quae, exercitationem a quo saepe incidunt alias? Quibusdam illo autem suscipit, quod sed iusto nemo hic, ea labore eos obcaecati assumenda non"),
        ),
        const SizedBox(
          height: 10,
        ),
        const AppText(
          text: "Interests",
          fontSize: 24,
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: const [
            InterestContainer(
                text: "Pets",
                textColor: Colors.white,
                bgcolor: Colors.redAccent),
            InterestContainer(
              text: "Religion",
              textColor: Colors.white,
              bgcolor: Colors.redAccent,
            ),
            InterestContainer(
              text: "Phychology",
              textColor: Colors.white,
              bgcolor: Colors.redAccent,
            ),
            InterestContainer(
              text: "Music",
              textColor: Colors.white,
              bgcolor: Colors.redAccent,
            ),
            InterestContainer(
              text: "Cosplay",
              textColor: Colors.white,
              bgcolor: Colors.redAccent,
            ),
          ],
        )
      ]),
    );
  }
}
