import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/animal_model.dart';
import '../../../theme/app_theme.dart';

Container card({
  required AnimalModel animalModel,
  required Function pressNo,
  required Function pressLike,
}) {
  return Container(
    padding: const EdgeInsets.all(6),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(17)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(-6, 9),
          blurRadius: 11,
        )
      ],
    ),
    child: Container(
      decoration: const BoxDecoration(
        color: ColorTheme.bg,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              image: DecorationImage(
                image: AssetImage(animalModel.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Transform.rotate(
              angle: 0.05,
              child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "images/match_undo.svg",
                  width: 28,
                  height: 28,
                ),
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Transform.rotate(
              angle: 0.05,
              child: SvgPicture.asset(
                'images/match_question.svg',
                width: 28,
                height: 28,
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Transform.rotate(
              angle: 0.05,
              child: Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  no(pressNo),
                  shortId(animalModel, Colors.white),
                  like(pressLike),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget no(Function f) {
  return GestureDetector(
    onTap: () {
      f();
    },
    child: Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: const Icon(
        Icons.close,
        size: 13,
        color: ColorTheme.black,
      ),
    ),
  );
}

Widget like(Function f) {
  return GestureDetector(
    onTap: () {
      f();
    },
    child: Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: const Icon(
        Icons.favorite_sharp,
        size: 13,
        color: ColorTheme.pink,
      ),
    ),
  );
}

Column shortId(AnimalModel animalModel, Color theColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            "${animalModel.id} ",
            style: FontTheme.w04.copyWith(fontSize: 18, color: theColor),
          ),
          if (animalModel.sex == "F")
            SvgPicture.asset(
              'images/match_female.svg',
            ),
          if (animalModel.sex == "M")
            SvgPicture.asset(
              'images/match_male.svg',
            ),
          if (animalModel.sex == "N")
            animalModel.kind == "狗"
                ? SvgPicture.asset(
                    'images/chose_bone.svg',
                    // color: theColor,
                  )
                : SvgPicture.asset(
                    'images/chose_fish.svg',
                    // color: theColor,
                  ),
        ],
      ),
      Text(
        shortenAddress(animalModel.address ?? ""),
        style:
            FontTheme.w04.copyWith(fontSize: 14, height: 1.7, color: theColor),
      ),
    ],
  );
}

shortenAddress(String address) {
  // 取巧拿前八個字
  address = address.substring(0, 8);
  String str = "";
  if (address.contains("區")) {
    str = "${address.split("區").first}區";
  } else if (address.contains("鎮")) {
    str = "${address.split("鎮").first}鎮";
  } else if (address.contains("鄉")) {
    str = "${address.split("鄉").first}鄉";
  } else if (address.contains("市")) {
    str = "${address.split("市").first}市";
  } else {
    str = address;
  }
  return str;
}
