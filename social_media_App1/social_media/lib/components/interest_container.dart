import 'package:flutter/cupertino.dart';

import 'app_text.dart';

class InterestContainer extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgcolor;

  const InterestContainer(
      {super.key, required this.text, this.textColor, this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: bgcolor),
      child: AppText(
        fontSize: 15,
        text: text,
        color: textColor,
      ),
    );
  }
}
