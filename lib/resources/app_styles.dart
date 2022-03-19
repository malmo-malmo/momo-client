part of 'resources.dart';

abstract class AppStyles {
  static const bold28 = TextStyle(
    fontSize: 28,
    fontWeight: AppDimens.bold,
    color: AppColors.gray6,
    letterSpacing: -0.28,
  );

  static const bold24 = TextStyle(
    fontSize: 24,
    fontWeight: AppDimens.bold,
    color: AppColors.gray0,
    letterSpacing: -0.24,
  );

  static const bold20 = TextStyle(
    fontSize: 20,
    fontWeight: AppDimens.bold,
    color: AppColors.gray6,
    letterSpacing: -0.2,
  );

  static const bold16 = TextStyle(
    fontSize: 16,
    fontWeight: AppDimens.bold,
    color: AppColors.gray6,
    letterSpacing: -0.16,
  );

  static const bold14 = TextStyle(
    fontSize: 14,
    fontWeight: AppDimens.bold,
    color: AppColors.gray6,
    letterSpacing: -0.14,
  );

  static const regular16 = TextStyle(
    fontSize: 16,
    fontWeight: AppDimens.regular,
    color: AppColors.gray6,
    letterSpacing: -0.16,
  );

  static const regular15 = TextStyle(
    fontSize: 15,
    fontWeight: AppDimens.regular,
    color: AppColors.gray6,
    letterSpacing: -0.15,
  );

  static const regular14 = TextStyle(
    fontSize: 14,
    fontWeight: AppDimens.regular,
    color: AppColors.gray6,
    letterSpacing: -0.14,
  );

  static const regular12 = TextStyle(
    fontSize: 12,
    fontWeight: AppDimens.regular,
    color: AppColors.gray0,
    letterSpacing: -0.12,
  );

  static const regular11 = TextStyle(
    fontSize: 11,
    fontWeight: AppDimens.regular,
    color: AppColors.gray5,
    letterSpacing: -0.11,
  );

  static const regular10 = TextStyle(
    fontSize: 10,
    fontWeight: AppDimens.regular,
    color: AppColors.gray0,
    letterSpacing: -0.1,
  );

  static BoxDecoration containerDecoration({
    double radius = 16,
    Color? color,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color ?? AppColors.gray1,
      boxShadow: boxShadow,
    );
  }
}
