import 'package:flutter/material.dart';
import 'package:nlw_5/challenge/challenge_page.dart';
import 'package:nlw_5/core/app_colors.dart';
import 'package:nlw_5/home/home_state.dart';
import 'package:nlw_5/home/widgets/levelbutton/levelbutton_widget.dart';

import 'home_controller.dart';
import 'widgets/appbar/appbar_widget.dart';
import 'widgets/quizcard/quizcard_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.SUCCESS) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              "${e.questionsAwnsered}/${e.questions.length}",
                          percentage: e.questionsAwnsered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => ChallengePage(
                                  questions: e.questions,
                                  title: e.title,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      ),
    );
  }
}
