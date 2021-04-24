import 'package:flutter/material.dart';

import 'package:nlw_5/core/app_colors.dart';
import 'package:nlw_5/core/app_text_styles.dart';
import 'package:nlw_5/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatefulWidget {
  final double percentage;
  const ScoreCardWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);
  @override
  _ScoreCardWidgetState createState() => _ScoreCardWidgetState();
}

class _ScoreCardWidgetState extends State<ScoreCardWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: ChartWidget(
                    percentage: widget.percentage,
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vamos começar",
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        "Complete os desafios e\n avance em conhecimento",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
