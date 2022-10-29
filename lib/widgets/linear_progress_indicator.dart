import 'package:flutter/material.dart';

class MyLinearIndicator extends StatelessWidget {
  final Color bgcolor;
  final Color color;
  final double value;
  final String unit;

  const MyLinearIndicator({
    Key? key,
    required this.bgcolor,
    required this.color,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 80,
        height: 20,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: LinearProgressIndicator(
            color: color,
            backgroundColor: bgcolor,
            value: value,
          ),
        ),
      ),
      SizedBox(
          width: 80,
          height: 18,
          child: Center(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    unit,
                    style: const TextStyle(fontSize: 10),
                  ))))
    ]);
  }
}
