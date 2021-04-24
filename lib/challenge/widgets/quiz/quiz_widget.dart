import 'package:flutter/material.dart';

import 'package:nlw_5/challenge/widgets/awnser/awnser_widget.dart';
import 'package:nlw_5/core/core.dart';
import 'package:nlw_5/shared/models/awnser_model.dart';
import 'package:nlw_5/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  int _isRight = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];
  // validada a resposta certo
  bool _evaluteAwnser(int index) {
    if (_isRight != -1 && widget.question.awnsers[index].isRight == false)
      return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Resposta de acerto ou erro
    Widget _responseStatus() {
      if (_isRight == 1) {
        return Container(
          child: Column(
            children: [
              Text(
                "VOCÊ ACERTOU!",
                style: AppTextStyles.heading15,
              ),
              Image.asset(AppImages.check),
            ],
          ),
        );
      }
      return Container(
        child: Column(
          children: [
            Text(
              "VOCÊ ERROU!",
              style: AppTextStyles.heading15,
            ),
            Image.asset(AppImages.error),
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          SizedBox(height: 34),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++) ...{
            Container(
              child: Opacity(
                opacity: _evaluteAwnser(i) ? 1 : 0.1,
                child: AwnserWidget(
                  awnser: widget.question.awnsers[i],
                  isSelected: indexSelected == i,
                  disabled: indexSelected != -1,
                  onTap: (bool value) {
                    indexSelected = i;
                    setState(() {
                      _isRight = (value) ? 1 : 0;
                    });
                    Future.delayed(Duration(seconds: 3)).then(
                      (_) => widget.onSelected(value),
                    );
                  },
                ),
              ),
            ),
          },
          (_isRight == -1) ? Container() : _responseStatus(),
        ],
      ),
    );
  }
}
