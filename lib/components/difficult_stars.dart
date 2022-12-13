
import 'package:flutter/material.dart';

class DifficultStars extends StatelessWidget {
  const DifficultStars({
    Key? key,
    required this.level,
  }) : super(key: key);

  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 12, color: (level >= 1) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star, size: 12, color: (level >= 2) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star, size: 12, color: (level >= 3) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star, size: 12, color: (level >= 4) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star, size: 12, color: (level >= 5) ? Colors.blue : Colors.blue[100]),
      ],
    );
  }
}