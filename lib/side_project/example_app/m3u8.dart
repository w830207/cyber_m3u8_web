import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class M3U8 extends StatefulWidget {
  const M3U8({Key? key}) : super(key: key);

  @override
  State<M3U8> createState() => _M3U8State();
}

class _M3U8State extends State<M3U8> {
  TextEditingController tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272,
      height: 576,
      decoration: const BoxDecoration(
        gradient: ColorTheme.gc2,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Agne',
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 2000),
                    animatedTexts: [
                      TypewriterAnimatedText('Enter a m3u8 link'),
                      TypewriterAnimatedText(
                          'And press the "PLAY" button'),
                      TypewriterAnimatedText(
                          'Then you can watch stream video.'),
                      TypewriterAnimatedText(
                          'You can also treat this app as a "tv".'),
                    ],
                    onTap: () {
                      tfController.text = "tv";
                    },
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.c01.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: tfController,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        hintText: "enter m3u8 link..."),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 9.0,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText('PLAY'),
                        FlickerAnimatedText('play'),
                        FlickerAnimatedText('播放'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
