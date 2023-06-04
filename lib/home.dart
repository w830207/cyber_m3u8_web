import 'package:cyber_m3u8_web/side_project/side_project.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDCFCF),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Row(
              children: [
                Text("I am"),
                SizedBox(
                  height: 80,
                  child: Image.asset('images/head0.webp'),
                ),
                Text(", and this is my website."),
              ],
            ),
            Wrap(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SideProjectPage();
                      }),
                    );
                  },
                  child: const Text("About me"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SideProjectPage();
                      }),
                    );
                  },
                  child: const Text("Side projects"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
