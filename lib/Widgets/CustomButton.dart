// ignore_for_file: non_constant_identifier_names, file_names

import '../configs/common_Exports.dart';

Widget CustomButton(
  String title,
  Function() onPressed, {
  double btnWidth = 200.0,
  double btnHeight = 45.0,
  double fontSize = 16.0,
  Color? fontColor,
  double btnRadius = 10.0,
  Color? btnColor,
  IconData? btnIcon,
  double? iconSize,
  Color? iconColor,
  Color borderColor = Colors.transparent,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(btnRadius),
      color: btnColor ?? AppColors.PRIMARY_BLUE,
      border: Border.all(color: borderColor),
    ),
    width: btnWidth,
    height: btnHeight,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.TRANSPARENT,
        backgroundColor: AppColors.TRANSPARENT,
        textStyle: TextStyle(fontWeight: Styles.MEDIUM),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: title == '' ? false : true,
            child: Text(
              title,
              style: TextStyle(
                color: fontColor ?? AppColors.WHITE,
                fontSize: fontSize,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Visibility(
              visible: btnIcon != null,
              child: Icon(
                btnIcon,
                color: iconColor,
                size: iconSize,
              ))
        ],
      ),
    ),
  );
}

//Custom Button Styles
LinearGradient btnGradient = LinearGradient(colors: [
  AppColors.PRIMARY_BLUE,
  AppColors.PRIMARY_BLUE.withOpacity(0.7),
  AppColors.PRIMARY_BLUE.withOpacity(0.3),
]);
