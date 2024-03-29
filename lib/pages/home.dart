import 'package:cyber_m3u8_web/widgets/navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFCDCFCF),
          body: Center(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Row(
                  children: [
                    const Text("I am"),
                    SizedBox(
                      height: 80,
                      child: Image.asset('images/head0.webp'),
                    ),
                    const Text(", and this is my website."),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Navigation(),
      ],
    );
  }
}
