import 'package:card_swiper/card_swiper.dart';
import 'package:cyber_m3u8_web/app_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppModel loadedModel;
  late AppModel model0;
  late AppModel model1;

  @override
  void initState() {
    model0 = AppModel(
      name: 'Cyber M3u8',
      image: 'images/m3u8.webp',
      backgroundColor: const Color(0xFFCDCFCF),
      appleLink: 'https://apps.apple.com/app/id6444260314',
      googleLink:
          'https://play.google.com/store/apps/details?id=com.cbw.cyber_m3u8_mobile',
      content: "CyberPunk style M3u8 player.\n賽博M3u8播放器",
    );
    model1 = AppModel(
      name: '浪愛',
      image: 'images/lang.png',
      head: 'images/head1.png',
      appleLink: 'https://apps.apple.com/app/id6443711746',
      googleLink: '',
      content: "流浪動物認養\n以交友配對模式，呈現台灣動物收容所待領養貓狗。",
    );

    loadedModel = model0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loadedModel.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Image.asset(loadedModel.head),
          ),
          Expanded(
            child: Swiper(
              onIndexChanged: (index) {
                switch (index) {
                  case 0:
                    loadedModel = model0;
                    break;
                  case 1:
                    loadedModel = model1;
                    break;
                }
                setState(() {});
              },
              itemBuilder: (context, index) {
                return swiperItem(
                  image: loadedModel.image,
                  appleLink: loadedModel.appleLink,
                  googleLink: loadedModel.googleLink,
                  name: loadedModel.name,
                  content: loadedModel.content,
                );
              },
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}

Widget swiperItem({
  required String image,
  required String appleLink,
  required String googleLink,
  required String name,
  required String content,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset(
              image,
              width: 200,
              height: 200,
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 16,
            children: [
              storeBtn('images/btn_appstore.png', appleLink),
              storeBtn('images/btn_googleplay.png', googleLink),
            ],
          )
        ],
      ),
      SelectableText(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w800),
        textScaleFactor: 2,
      ),
      SelectableText(
        content,
        textAlign: TextAlign.center,
        textScaleFactor: 2,
        autofocus: true,
        showCursor: true,
        cursorColor: Colors.black,
      ),
    ],
  );
}

Widget storeBtn(String image, String link) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        _launchUrl(link);
      },
      child: Image.asset(image),
    ),
  );
}

Future<void> _launchUrl(String link) async {
  Uri url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
