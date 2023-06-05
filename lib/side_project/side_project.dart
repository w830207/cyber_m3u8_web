import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/app_model.dart';
import '../widgets/navigation.dart';
import 'example_app/animated_list_item.dart';
import 'example_app/lang_ai.dart';
import 'example_app/m3u8.dart';

class SideProjectPage extends StatefulWidget {
  const SideProjectPage({Key? key}) : super(key: key);

  @override
  State<SideProjectPage> createState() => _SideProjectPageState();
}

class _SideProjectPageState extends State<SideProjectPage> {
  late AppModel loadedModel;

  // late AppModel model0;
  // late AppModel model1;
  final List<AppModel> modelList = [];

  @override
  void initState() {
    modelList.add(AppModel(
      name: 'Cyber M3u8',
      image: 'images/m3u8.webp',
      backgroundColor: const Color(0xFFCDCFCF),
      appleLink: 'https://apps.apple.com/app/id6444260314',
      googleLink:
          'https://play.google.com/store/apps/details?id=com.cbw.cyber_m3u8_mobile',
      content: "CyberPunk style M3u8 player.\n賽博M3u8播放器",
      app: const M3U8(),
    ));
    modelList.add(AppModel(
      name: '浪愛',
      image: 'images/lang.webp',
      head: 'images/head1.webp',
      appleLink: 'https://apps.apple.com/app/id6443711746',
      content: "流浪動物認養\n以交友配對模式，呈現台灣動物收容所待領養貓狗。",
      app: const LangAi(),
    ));
    modelList.add(AppModel(
      name: 'animated_list_item',
      head: 'images/head2.webp',
      pubDevLink: 'https://pub.dev/packages/animated_list_item',
      content:
          "Flutter Package\nprovides Animation of items in ListView, GridView, SliverList, etc.",
      app: const AnimatedListItemExample(),
    ));

    loadedModel = modelList.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            color: loadedModel.backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Image.asset(loadedModel.head),
                ),
                SizedBox(
                  height: 760,
                  child: Swiper(
                    onIndexChanged: (index) {
                      loadedModel = modelList[index];
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      return swiperItem(
                        appleLink: loadedModel.appleLink,
                        googleLink: loadedModel.googleLink,
                        pubDevLink: loadedModel.pubDevLink,
                        name: loadedModel.name,
                        content: loadedModel.content,
                        app: loadedModel.app,
                      );
                    },
                    pagination: const SwiperPagination(),
                    control: const SwiperControl(),
                    itemCount: modelList.length,
                  ),
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

Widget swiperItem({
  required String appleLink,
  required String googleLink,
  required String pubDevLink,
  required String name,
  required String content,
  required Widget app,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(58),
                  child: app,
                ),
                IgnorePointer(
                  child: Image.asset(
                    "images/phone.webp",
                    width: 290,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 16,
            children: [
              if (appleLink.isNotEmpty)
                storeBtn('images/btn_appstore.webp', appleLink),
              if (googleLink.isNotEmpty)
                storeBtn('images/btn_googleplay.webp', googleLink),
              if (pubDevLink.isNotEmpty)
                storeBtn('images/btn_pubdev.webp', pubDevLink),
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
