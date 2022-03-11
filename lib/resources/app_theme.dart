part of 'resources.dart';

abstract class AppTheme {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      toolbarHeight: 56,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      titleTextStyle: AppStyles.bold16,
    ),
    fontFamily: 'NanumSquareOTF',
    textTheme: const TextTheme(
      subtitle1: AppStyles.regular16,
    ),
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.gray6,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: AppStyles.regular16.copyWith(
        color: AppColors.gray4,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.gray3;
            }
            return AppColors.purple;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.gray5;
            }
            return AppColors.gray0;
          },
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textStyle: MaterialStateProperty.all(AppStyles.bold16),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.purple,
    ),
    shadowColor: AppColors.blur,
  );
}

class AppScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
