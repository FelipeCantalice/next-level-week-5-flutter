import 'package:flutter/material.dart';

import 'package:nlw_5/core/core.dart';

class ChartWidget extends StatefulWidget {
  final double percentage;
  const ChartWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.percentage,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (ctx, _) => Stack(
            children: [
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${(_animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          ),
        ));
  }
}
