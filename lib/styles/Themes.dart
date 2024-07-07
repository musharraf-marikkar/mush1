// // ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, prefer_const_declarations

// import 'package:destinitymembershipapp/configs/common_Exports.dart';

// //Done by Randima 2024/03/15
// class Themes {
//   static final lightTheme = ThemeData(
//     // brightness: Brightness.light,
//     appBarTheme: AppBarTheme(
//       color: AppColors.PRIMARY_BLUE,
//       iconTheme: IconThemeData(color: AppColors.PRIMARY_BLACK)
//     ),
//     scaffoldBackgroundColor: AppColors.WHITE,
//     cardColor: AppColors.PRIMARY_GREY_LARK, //Item confirmation
//     toggleButtonsTheme: ToggleButtonsThemeData(
//         disabledColor: AppColors.WHITE, color: AppColors.WHITE),//generate button in statement,pickup-dine in button(all the white color)
//     colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: AppColors.PRIMARY_BLUE, // selections default
//       onPrimary: AppColors.BLACK,
//       secondary: AppColors.PRIMARY_BLACK, // text styles, text style summary views, drop down values
//       onSecondary: AppColors.PRIMARY_BLACK,
//       tertiary: AppColors.PRIMARY_BLACK, // titles(black)
//       onTertiary: AppColors.BLACK, //user details input text, amount
//       error: AppColors.PRIMARY_RED,
//       onError: AppColors.PRIMARY_DARK_RED,
//       background: AppColors.WHITE,
//       onBackground: AppColors.WHITE,
//       surface: AppColors.WHITE,
//       onSurface: AppColors.PRIMARY_BACKGROUND_BLACK,
//       shadow: AppColors.PRIMARY_GREY_LARK,
//       primaryContainer: AppColors.WHITE, //order card color,menuscreen
//       onSurfaceVariant: AppColors.PRIMARY_WHITE,
      
//     ),
//    popupMenuTheme: PopupMenuThemeData(color: AppColors.WHITE),

//     timePickerTheme: TimePickerThemeData(
//       dayPeriodTextColor: AppColors.PRIMARY_BLACK,
//       dayPeriodColor: AppColors.PRIMARY_BLUE,
//     ),

//     datePickerTheme: DatePickerThemeData(
//       dividerColor: AppColors.TRANSPARENT,
//       yearForegroundColor: MaterialStateProperty.all(AppColors.BLACK),

//       headerBackgroundColor:
//           AppColors.PRIMARY_BACKGROUND_BLACK.withOpacity(0.5),
//     ),
   
   

//     //bottomSheetTheme:
    
//   );

//   static final darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     appBarTheme: AppBarTheme(
//       color: AppColors.BLACK,
//       iconTheme: IconThemeData(color: AppColors.WHITE)
//     ),
//     scaffoldBackgroundColor: AppColors.PRIMARY_BACKGROUND_BLACK,
//     cardColor: AppColors.PRIMARY_BLACK,
//     toggleButtonsTheme: ToggleButtonsThemeData(
//         disabledColor: AppColors.PRIMARY_BACKGROUND_BLACK,
//         color: AppColors.WHITE),
//     colorScheme: ColorScheme(
//         brightness: Brightness.dark,
//         primary: AppColors.PRIMARY_BLUE,
//         onPrimary: AppColors.WHITE,
//         secondary: AppColors.PRIMARY_GREY_LARK,
//         onSecondary: AppColors.WHITE,
//         tertiary: AppColors.WHITE, 
//         onTertiary: AppColors.PRIMARY_GREY_LARK,//amount
//         error: AppColors.PRIMARY_RED,
//         onError: AppColors.PRIMARY_DARK_RED,
//         background: AppColors.PRIMARY_BACKGROUND_BLACK,
//         onBackground: AppColors.WHITE,
//         surface: AppColors.PRIMARY_BLACK, // tab bar bottom border
//         onSurface: AppColors.PRIMARY_GREY_LARK, //calender date
//         shadow: AppColors.TRANSPARENT, //box shadows
//         primaryContainer: AppColors.PRIMARY_BLACK,
//         onSurfaceVariant: AppColors.PRIMARY_BACKGROUND_BLACK
//         ),
//        popupMenuTheme: PopupMenuThemeData(color: AppColors.PRIMARY_BACKGROUND_BLACK),


//     timePickerTheme: TimePickerThemeData(
//       dayPeriodTextColor: AppColors.WHITE,
//       dayPeriodColor: AppColors.PRIMARY_BLUE,
//     ),
//     datePickerTheme: DatePickerThemeData(
//       headerBackgroundColor: AppColors.PRIMARY_GREY_LARK.withOpacity(0.5),
//       dividerColor: AppColors.TRANSPARENT,
      
//     ),
//   );
// }














// // class Android_Theme_Light {
// //   Android_Theme_Light(type);

// //   static final HeadlineColor = AppColors.PRIMARY_RED;

// //   //solid colors
// //   static var WHITE = AppColors.WHITE;
// //   static final BLACK = AppColors.BLACK;
// //   static final GREY = AppColors.GREY;
// //   static final TRANSPARENT = AppColors.TRANSPARENT;

// //   //AppColors
// //   static final PRIMARY_BLUE = AppColors.PRIMARY_BLUE;
// //   static final PRIMARY_BLACK = AppColors.PRIMARY_BLACK;
// //   static final PRIMARY_GREY = AppColors.PRIMARY_GREY;
// //   static final PRIMARY_GREY_LARK = AppColors.PRIMARY_GREY_LARK;
// //   static final PRIMARY_GREEN = AppColors.PRIMARY_GREEN;
// //   static final PRIMARY_YELLOW = AppColors.PRIMARY_YELLOW;
// //   static final PRIMARY_RED = AppColors.PRIMARY_RED;
// //   static final PRIMARY_DARK_YELLOW = AppColors.PRIMARY_DARK_YELLOW;
// //   static final PRIMARY_DARK_RED = AppColors.PRIMARY_DARK_RED;

// //   //Font sizes
// //   static final FONT_SIZE_08 = 8.0;
// //   static final FONT_SIZE_10 = 10.0;
// //   static final FONT_SIZE_12 = 12.0;
// //   static final FONT_SIZE_14 = 14.0;
// //   static final FONT_SIZE_16 = 16.0;
// //   static final FONT_SIZE_18 = 18.0;
// //   static final FONT_SIZE_20 = 20.0;
// //   static final FONT_SIZE_22 = 22.0;
// //   static final FONT_SIZE_24 = 24.0;
// //   static final FONT_SIZE_26 = 26.0;
// //   static final FONT_SIZE_28 = 28.0;
// //   static final FONT_SIZE_30 = 30.0;

// //   //svg icons
// //   static final ICON_CLOCK = Images.ICON_CLOCK_ANDROID_LIGHT;
// //   static final ICON_DRINKS = Images.ICON_DRINKS_ANDROID_LIGHT;
// //   static final ICON_MEAT = Images.ICON_MEAT_ANDROID_LIGHT;
// //   static final ICON_PASSWORD = Images.ICON_PASSWORD_ANDROID_LIGHT;
// //   static final ICON_POOL = Images.ICON_POOL_ANDROID_LIGHT;
// //   static final ICON_USERNAME = Images.ICON_USERNAME_ANDROID_LIGHT;

// //   //ItemCategory
// //   static final ICON_SOUP = Images.ICON_SOUP_ANDROID_LIGHT;
// //   static final ICON_VEGETABLE = Images.ICON_VEGETABLE_ANDROID_LIGHT;
// //   static final ICON_NOODLES = Images.ICON_NOODLES_ANDROID_LIGHT;
// //   static final ICON_DESSERT = Images.ICON_DESSERT_ANDROID_LIGHT;
// //   static final ICON_LIQUOR = Images.ICON_LIQUOR_ANDROID_LIGHT;

// //   //MenuCategory
// //   static final ICON_INVOICE_DETAILS = Images.ICON_INVOICE_DETAILS_ANDROID_LIGHT;
// //   static final ICON_STATEMENTS = Images.ICON_STATEMENTS_ANDROID_LIGHT;
// //   static final ICON_PICKUP_ORDER = Images.ICON_PICKUP_ORDER_ANDROID_LIGHT;
// //   static final ICON_SPORT_RESERVATIONS =
// //       Images.ICON_SPORT_RESERVATIONS_ANDROID_LIGHT;
// //   static final ICON_EVENT_RESERVATIONS =
// //       Images.ICON_EVENT_RESERVATIONS_ANDROID_LIGHT;
// //   static final ICON_DINEIN_ORDER = Images.ICON_DINEIN_ORDER_ANDROID_LIGHT;
// //   static final ICON_SUBSCRIPTION = Images.ICON_SUBSCRIPTION_ANDROID_LIGHT;
// //   static final ICON_MY_ORDERS = Images.ICON_MY_ORDERS_ANDROID_LIGHT;

// //   //Lottie
// //   static final LOTTIE_LOTTIE_SEARCH = Images.LOTTIE_SEARCH_ANDROID_LIGHT;
// //   static final LOTTIE_LOTTIE_DONE = Images.LOTTIE_DONE_ANDROID_LIGHT;

// //   // ==========size box verticle ==============
// //   static final sizebox05 = Styles.sizebox05;
// //   static final sizebox10 = Styles.sizebox10;
// //   static final sizebox20 = Styles.sizebox20;
// //   static final sizebox30 = Styles.sizebox30;
// //   static final sizebox40 = Styles.sizebox40;
// //   static final sizebox100 = Styles.sizebox100;

// //   // ==========size box Horizontol ==============
// //   static final sizebox05W = Styles.sizebox05W;
// //   static final sizebox10W = Styles.sizebox10W;
// //   static final sizebox20W = Styles.sizebox20W;
// //   static final sizebox30W = Styles.sizebox30W;
// //   static final sizebox40W = Styles.sizebox40W;

// //   //==============border Radius =========
// //   static final borderRadius05 = Styles.borderRadius05;
// //   static final borderRadius10 = Styles.borderRadius10;
// //   static final borderRadius20 = Styles.borderRadius20;
// //   static final borderRadius30 = Styles.borderRadius30;
// // }

// // class Android_Theme_Dark {
// //   static final HeadlineColor = AppColors.PRIMARY_GREEN;
// // }

// // class Ios_Theme_Light {}

// // class Ios_Theme_Dark {}