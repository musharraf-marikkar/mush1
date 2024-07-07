// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppColors.dart';

class Styles {
  final BuildContext context;
  Styles(this.context);

//Font sizes
  static var FONT_SIZE_08 = 8.0;
  static var FONT_SIZE_10 = 10.0;
  static var FONT_SIZE_12 = 12.0;
  static var FONT_SIZE_13 = 13.0;
  static var FONT_SIZE_14 = 14.0;
  static var FONT_SIZE_16 = 16.0;
  static var FONT_SIZE_18 = 18.0;
  static var FONT_SIZE_20 = 20.0;
  static var FONT_SIZE_22 = 22.0;
  static var FONT_SIZE_24 = 24.0;
  static var FONT_SIZE_26 = 26.0;
  static var FONT_SIZE_28 = 28.0;
  static var FONT_SIZE_30 = 30.0;

  //Font weights
  static FontWeight THIN = FontWeight.w200;
  static FontWeight LIGHT = FontWeight.w300;
  static FontWeight REGULAR = FontWeight.w400;
  static FontWeight MEDIUM = FontWeight.w500;
  static FontWeight SEMI_BOLD = FontWeight.w600;
  static FontWeight BOLD = FontWeight.w700;
  static FontWeight EXTRA_BOLD = FontWeight.w800;
  static FontWeight BLACK = FontWeight.w900;

  //========= Expanded Boxes==========
  static Expanded ExpandedSizedBox = const Expanded(child: SizedBox());

  // ==========size box verticle ==============
  static SizedBox sizebox05 = const SizedBox(
    height: 05,
  );
  static SizedBox sizebox10 = const SizedBox(
    height: 10,
  );
  static SizedBox sizebox20 = const SizedBox(
    height: 20,
  );
  static SizedBox sizebox30 = const SizedBox(
    height: 30,
  );
  static SizedBox sizebox40 = const SizedBox(
    height: 40,
  );
  static SizedBox sizebox100 = const SizedBox(
    height: 100,
  );

  // ==========size box Horizontol ==============
  static SizedBox sizebox05W = const SizedBox(
    width: 05,
  );
  static SizedBox sizebox10W = const SizedBox(
    width: 10,
  );
  static SizedBox sizebox20W = const SizedBox(
    width: 20,
  );
  static SizedBox sizebox30W = const SizedBox(
    width: 30,
  );
  static SizedBox sizebox40W = const SizedBox(
    width: 40,
  );

  //===================== Devider =====================
  static Divider devider = Divider(
    height: 10,
    thickness: 1,
    color: AppColors.PRIMARY_GREY_LARK,
  );
  static VerticalDivider DeviderVerticle = const VerticalDivider(
    thickness: 10,
    color: Colors.black,
    width: 10,
  );

  //===========progress bar=====================

  static CircularProgressIndicator circularProgressAndroid =
      CircularProgressIndicator(
    color: AppColors.PRIMARY_BLUE,
  );

  static CupertinoActivityIndicator circularProgressIOS =
      CupertinoActivityIndicator(
    color: AppColors.PRIMARY_BLUE,
    radius: 20,
  );
  //============ box shadow ===================

  BoxShadow get boxShadow => BoxShadow(
        color:
            Theme.of(context).colorScheme.shadow, //AppColors.PRIMARY_GREY_LARK,
        spreadRadius: 0.5,
        blurRadius: 8,
        offset: const Offset(1, 1), // changes position of shadow
      );

  //================= Screen Gradient========
  static LinearGradient ScreenGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.PRIMARY_BLUE.withOpacity(0.4),
        AppColors.PRIMARY_BLUE.withOpacity(0.0),
      ]);

  //Text Styles

  static TextStyle TextStyle_Header = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: Styles.SEMI_BOLD,
      color: AppColors.PRIMARY_BLUE,
      fontSize: FONT_SIZE_24);

  TextStyle get TextStyle_Topics => TextStyle(
      fontFamily: 'Poppins',
      fontWeight: Styles.MEDIUM,
      fontSize: FONT_SIZE_18,
      color: Theme.of(context).colorScheme.secondary
      );

  static TextStyle TextStyle_Title = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: Styles.REGULAR,
      fontStyle: FontStyle.italic);

  static TextStyle TextStyle_SubTitle = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: Styles.REGULAR,
      fontStyle: FontStyle.italic);

  static TextStyle TextStyle_Description = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: Styles.REGULAR,
      color: Get.isDarkMode? AppColors.WHITE : AppColors.PRIMARY_BLACK); //AppColors.PRIMARY_BLACK);

  static TextStyle TextStyle_MiniDescription = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: Styles.REGULAR,
      fontStyle: FontStyle.italic);

  //

//==============border Radius =========
  static BorderRadius borderRadius05 = BorderRadius.circular(5.0);
  static BorderRadius borderRadius10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadius20 = BorderRadius.circular(20.0);
  static BorderRadius borderRadius30 = BorderRadius.circular(30.0);

  //==================box decoration
  static BoxDecoration boxDecorationGlass = BoxDecoration(
      color: AppColors.WHITE.withOpacity(0.7),
      border: Border.all(color: AppColors.WHITE, width: 1),
      borderRadius: BorderRadius.circular(20));

  static BoxDecoration boxDecorationSimple = BoxDecoration(
      color: AppColors.GREY.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10));
}
