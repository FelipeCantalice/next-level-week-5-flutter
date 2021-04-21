import 'package:flutter/material.dart';
import 'package:nlw_5/core/app_gradients.dart';
import 'package:nlw_5/core/app_text_styles.dart';
import 'package:nlw_5/home/widgets/scorecard/scoredart_widget.dart';
import 'package:nlw_5/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({
    required this.user,
  }) : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold,
                              ),
                            ]),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.photoURL),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.1, 1.0),
                  child: ScoreCardWidget(),
                ),
              ],
            ),
          ),
        );
}
