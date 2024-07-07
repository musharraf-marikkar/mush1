// ignore_for_file: non_constant_identifier_names, unnecessary_overrides

import 'package:get/get.dart';
import 'package:pentacode/Views/AgreeToContinue/AgreeToContinue.dart';
import 'package:pentacode/Views/Dashboard/DashboardScreen.dart';
import 'package:pentacode/Views/Home/HomeScreen.dart';

import '../API/API_SystemInit.dart';
import '../API/API_UserInit.dart';
import '../configs/CommonFunctions.dart';
import '../configs/Constants.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () async{
      if (await GetSharedPref(Constants.KEY_ACCESSTOKEN) != '') {
        Get.to(() => const HomeScreen());
      } else {
        Get.to(() => const AgreeToContinue());
      }
    });
    // await GetTokenAndVerify();
  }

  @override
  void onReady() {
    super.onReady();
  }

  GetTokenAndVerify() async {
    try {
      //Get Token
      await API_GetToken("Dilshan", "123", (success, data, message) async {
        if (success) {
          await SetSharedPref(
              1, Constants.KEY_ACCESSTOKEN, data['accessToken']);
          await SetSharedPref(
              1, Constants.KEY_REFRESHTOKEN, data['RefreshToken']);

          //Get Settings
          API_GetSettings((success, data, message) async {
            if (success) {
              print('Get Settings Success');
              print(data['Data']);

              await SetSharedPref(1, Constants.KEY_DEFAULT_PROPERTY_ID,
                  data['Data']['DefaultPropertyId'].toString());

              await SetSharedPref(1, Constants.KEY_DEFAULT_OUTLET,
                  data['Data']['DefaultOutlet']);

              //This WStation ID should include in Resturant POS DB WStation Table
              await SetSharedPref(1, Constants.KEY_DEFAULT_WSTATION,
                  data['Data']['DefaultWstation']);
              {
                if (await GetSharedPref(Constants.KEY_MEMBERLOGINUUID) != '') {
                  API_LoginVerify(true, '', '', (success, data, message) {
                    if (success) {
                      //Save Member Details Object
                      Constants.objMember = data;

                      if (Constants.objMember.isNotEmpty) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Get.to(
                            () => const AgreeToContinue(),
                          );
                        });
                      } else {
                        // ShowDialog('Member details getting failed',
                        //     title: 'Member Not Found');
                      }
                    }

                    // else {
                    //   Future.delayed(const Duration(seconds: 2), () {
                    //     Get.to(() => LoginScreen());
                    //   });
                    // }
                  });
                }
                // else {
                //   Future.delayed(const Duration(seconds: 2), () {
                //     Get.to(() => LoginScreen());
                //   });
                // }
              }
            } else {
              print("Failed to Get Settings.");
              //ShowDialog(message);
            }
          });
        } else {
          print("Failed to obtain token.");
          // ShowDialog(message);
        }
      });
    } catch (e) {
      print(
          '======== EXCEPTION =====> \n [SplashController] - GetTokenAndVerify() $e ');
    }
  }
}
