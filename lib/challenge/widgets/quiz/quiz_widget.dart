import 'package:flutter/material.dart';
import 'package:nlw_5/challenge/widgets/awnser/awnser_widget.dart';
import 'package:nlw_5/core/core.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AwnserWidget(
            title: "Possibilita a criação de componentes nativos",
            isRight: true,
            isSelected: true,
          ),
          AwnserWidget(
            title: "Possibilita a criação de componentes nativos",
          ),
          AwnserWidget(
            title: "Possibilita a criação de componentes nativos",
          ),
          AwnserWidget(
            title: "Possibilita a criação de componentes nativos",
          ),
        ],
      ),
    );
  }
}
