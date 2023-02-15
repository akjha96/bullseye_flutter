import 'package:flutter/material.dart';

// styles
import '../../styles/text_styles.dart';

class Prompt extends StatelessWidget {
  const Prompt({super.key, required this.targetValue});

  final int targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'PUT THE BULLSEYE AS CLOSE AS YOU CAN',
          style: LabelTextStyle.bodyMedium(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$targetValue',
          ),
        ),
      ],
    );
  }
}
