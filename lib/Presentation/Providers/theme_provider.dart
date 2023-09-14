import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/Config/Theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);

//Un objeto de tipo AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void changeTheme(AppTheme theme) {
    state = theme;
  }

  void toogleDarkTheme(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
