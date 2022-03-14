import 'package:momo_flutter/resources/resources.dart';

String categoryNameToIcon(String categoryName) {
  switch (categoryName) {
    case '취미':
      return AppIcons.categoryHobbyOn;
    case '건강':
      return AppIcons.categoryHealthOn;
    case '취업':
      return AppIcons.categoryJobOn;
    case '밥약':
      return AppIcons.categoryFoodOn;
    case '주식':
      return AppIcons.categoryStockOn;
    case '자기관리':
      return AppIcons.categorySelfOn;
    case '힐링':
      return AppIcons.categoryHealingOn;
    case '생활':
      return AppIcons.categoryLifeOn;
    default:
      return throw Error();
  }
}
