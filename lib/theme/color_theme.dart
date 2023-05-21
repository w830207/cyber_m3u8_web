part of 'app_theme.dart';

abstract class ColorTheme {

  /* M3U8 */
  static const Color c01 = Color(0xFFFF00FF);
  static const Gradient gc2 = RadialGradient(
    center: Alignment.topLeft,
    radius: 1.5,
    colors: [
      Color(0xFFC03083),
      Color(0xFF401D6D),
    ],
  );

  /* 浪愛 */
  static const Color pink = Color(0xFFFDAAA2);
  static const Color black = Color(0xFF262626);
  static const Color gray = Color(0xFF878787);
  static const Color grayLight = Color(0xFFDEDEDE);
  static const Color blue = Color(0xFF70D4D4);
  static const Color bg = Color(0xFFF8F8F8);
}
