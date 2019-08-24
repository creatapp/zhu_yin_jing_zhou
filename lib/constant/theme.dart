import 'package:flutter/material.dart';

enum ThemeCategory {
  light,
  dark
}

/// 主题
///
class MyTheme {
  static MyTheme myTheme = MyTheme();
  static MyTheme getInstance () => myTheme;

  // 主题种类，在enum和BaseTheme子类体现
  ThemeCategory _themeCategory = ThemeCategory.light;
  // 实际被APP采用的主题
  BaseTheme theme = LightTheme();

  // BaseTheme子类都应该在这里被持有，为了不
  BaseTheme _lightTheme = LightTheme();
  BaseTheme _darkTheme = DarkTheme();

  toggleTheme(ThemeCategory themeCategory) {
    _themeCategory = themeCategory;
    switch (_themeCategory) {
      case ThemeCategory.light:
        changeColor(_lightTheme);
        break;
      case ThemeCategory.dark:
        changeColor(_darkTheme);
        break;
      default:
    }
  }

  void changeColor(BaseTheme newTheme) {
    theme.primaryColor = newTheme.primaryColor;
  }
}

/// 所有主题都应该继承这个类，并且所有子类的属性都要定义
///
class BaseTheme {
  Color primaryColor;
}

class LightTheme extends BaseTheme{
  Color primaryColor = Colors.white;
}

class DarkTheme extends BaseTheme{
  Color primaryColor = Colors.black;
}