import 'package:cyber_m3u8_web/example_app/card.dart';
import 'package:cyber_m3u8_web/model/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_theme.dart';

class LangAi extends StatefulWidget {
  const LangAi({Key? key}) : super(key: key);

  @override
  State<LangAi> createState() => _LangAiState();
}

class _LangAiState extends State<LangAi> {
  late AppinioSwiperController swiperController;

  @override
  void initState() {
    super.initState();
    swiperController = AppinioSwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 272,
      height: 576,
      child: Scaffold(
        backgroundColor: ColorTheme.bg,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   centerTitle: true,
        //   title: const Text(
        //     "配對",
        //     style: TextStyle(color: ColorTheme.black),
        //   ),
        //   leading: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: kToolbarHeight / 8),
        //     child: GestureDetector(
        //       child: const Icon(
        //         Icons.arrow_back_ios,
        //         color: ColorTheme.black,
        //       ),
        //       onTap: () {},
        //     ),
        //   ),
        //   actions: [
        //     SvgPicture.asset("images/match_filter.svg",width: 12,),
        //     const SizedBox(width: 8),
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            buildItem(
              label: " 配對",
              icon: SvgPicture.asset(
                "images/home_card.svg",
                color: ColorTheme.grayLight,
              ),
              acIcon: SvgPicture.asset(
                "images/home_card.svg",
                color: ColorTheme.pink,
              ),
            ),
            buildItem(
              label: " 收藏",
              icon: const Icon(
                Icons.favorite_border,
                color: ColorTheme.grayLight,
              ),
              acIcon: const Icon(
                Icons.favorite_border,
                color: ColorTheme.pink,
              ),
            ),
          ],
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Colors.white,
          currentIndex: 0,
        ),
        body: SizedBox(
          width: 272,
          height: 576,
          child: Stack(
            alignment: Alignment.center,
            children: [
              fakeCard(
                top: 140,
                left: 66,
                height: 344 * 0.76,
                width: 215 * 0.76,
                angle: 0.38,
              ),
              fakeCard(
                top: 96,
                left: 52,
                height: 344 * 0.8,
                width: 215 * 0.8,
                angle: 0.24,
              ),
              Text(
                "很抱歉 ！\n已沒有單身狗、單身貓了\n去下載APP吧！",
                textAlign: TextAlign.center,
                style: FontTheme.w04.copyWith(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 344,
                width: 215,
                child: Transform.rotate(
                  angle: -0.05,
                  child: AppinioSwiper(
                    controller: swiperController,
                    padding: const EdgeInsets.all(10),
                    upOrDown: 1,
                    cards: [
                      card(
                        animalModel: AnimalModel(
                          id: 1,
                          sex: "F",
                          kind: "貓",
                          address: "雲林縣流浪動物收容所",
                          imageUrl: "images/cat1.png",
                        ),
                        pressNo: () {
                          swiperController.pressToLeft();
                        },
                        pressLike: () {
                          swiperController.pressToRight();
                        },
                      ),
                      card(
                        animalModel: AnimalModel(
                          id: 2,
                          sex: "F",
                          kind: "狗",
                          address: "雲林縣流浪動物收容所",
                          imageUrl: "images/dog1.png",
                        ),
                        pressNo: () {
                          swiperController.pressToLeft();
                        },
                        pressLike: () {
                          swiperController.pressToRight();
                        },
                      ),
                      card(
                        animalModel: AnimalModel(
                          id: 3,
                          sex: "M",
                          kind: "貓",
                          address: "新北市新店區安泰路235號",
                          imageUrl: "images/cat2.png",
                        ),
                        pressNo: () {
                          swiperController.pressToLeft();
                        },
                        pressLike: () {
                          swiperController.pressToRight();
                        },
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

Positioned fakeCard({
  required double top,
  required double left,
  required double height,
  required double width,
  required double angle,
}) {
  return Positioned(
    top: top,
    left: left,
    child: Transform.rotate(
      angle: angle,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(17)),
          boxShadow: [
            BoxShadow(
              color: Color(0x20000000),
              offset: Offset(5, 10),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
      ),
    ),
  );
}

buildItem({
  required String label,
  required Widget icon,
  required Widget acIcon,
}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
    activeIcon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        acIcon,
        Text(
          label,
          style: const TextStyle(
            color: ColorTheme.pink,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
