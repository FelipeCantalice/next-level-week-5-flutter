import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nlw_5/challenge/widgets/question_indicator_widget/question_indicator_widget.dart';
import 'package:nlw_5/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw_5/result/result_page.dart';
import 'package:nlw_5/shared/models/question_model.dart';

import 'challenge_controller.dart';
import 'widgets/next_button/next_button_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void onSelected(bool value) {
    if (value == true) controller.quantidadeAcertos++;

    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (ctx, val, _) => QuestionIndicatorWidget(
                    currentPage: val,
                    length: widget.questions.length,
                  ),
                ),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          for (var q in widget.questions) ...{
            QuizWidget(
              question: q,
              onSelected: onSelected,
            )
          }
        ],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (ctx, val, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (val < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                if (val == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Finalizar",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ResultPage(
                              title: widget.title,
                              size: widget.questions.length,
                              acertos: controller.quantidadeAcertos,
                            ),
                          ),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
