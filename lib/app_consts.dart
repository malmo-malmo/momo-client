import 'package:momo_flutter/resources/resources.dart';

abstract class AppConsts {
  static const maxPhotoCount = 10000;
  static const maxSelectCount = 7;
  static const pageSize = 20;

  static const defalutProfile = 'https://github.com/malmo-malmo/momo-client/blob/develop/default_profile.png?raw=true';

  static const categoryIconOn = [
    AppIcons.categoryHealthOn,
    AppIcons.categoryFoodOn,
    AppIcons.categorySelfOn,
    AppIcons.categoryLifeOn,
    AppIcons.categoryHobbyOn,
    AppIcons.categoryStockOn,
    AppIcons.categoryHealingOn,
    AppIcons.categoryJobOn,
  ];

  static const categoryIconOff = [
    AppIcons.categoryHealthOff,
    AppIcons.categoryFoodOff,
    AppIcons.categorySelfOff,
    AppIcons.categoryLifeOff,
    AppIcons.categoryHobbyOff,
    AppIcons.categoryStockOff,
    AppIcons.categoryHealingOff,
    AppIcons.categoryJobOff,
  ];
}
