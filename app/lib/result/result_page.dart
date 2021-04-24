import 'package:flutter/material.dart';

import 'package:nlw_5/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw_5/core/core.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int size;
  final int acertos;

  late double percentage;
  late String message;
  late String icon;
  ResultPage({
    Key? key,
    required this.title,
    required this.size,
    required this.acertos,
  }) {
    percentage = (acertos / size);

    if (percentage >= 0.7) {
      message = "Parabéns";
      icon = AppImages.trophy;
    } else {
      message = "Tente novamente!";
      icon = AppImages.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon),
            Column(
              children: [
                Text(
                  message,
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\ncom $acertos de $size acertos",
                        style: AppTextStyles.bodyBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
