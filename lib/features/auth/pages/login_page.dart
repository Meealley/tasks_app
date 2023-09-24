import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/custom_otn_btn.dart';
import 'package:riverpod_todo/common/widgets/custom_text_field.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/common/widgets/reusable_texts.dart';
import 'package:riverpod_todo/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

  Country country = Country(
    level: 1,
    phoneCode: "+234",
    countryCode: "NG",
    e164Sc: 0,
    geographic: true,
    name: "Nigeria",
    example: "Nigeria",
    displayName: "Nigeria",
    displayNameNoCountryCode: "NG",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/images/moblie_login.png",
                  width: 300,
                ),
              ),
              const HeightSpacer(hght: 29),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appstyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(hght: 20),
              Center(
                child: CustomTextField(
                  controller: phone,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(9),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                                backgroundColor: AppConst.kLight,
                                bottomSheetHeight: AppConst.kHeight * 0.6,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(AppConst.kRadius),
                                    topRight:
                                        Radius.circular(AppConst.kRadius))),
                            onSelect: (code) {
                              setState(() {});
                            });
                        print("prefixicon");
                      },
                      child: ReusableText(
                        text: "${country.flagEmoji} ${country.phoneCode}",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "Enter your phone number",
                  hintStyle: appstyle(
                    18,
                    AppConst.kBkDark,
                    FontWeight.w600,
                  ),
                ),
              ),
              const HeightSpacer(hght: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomOutlineBtn(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpPage(),
                        ),
                      );
                    },
                    width: AppConst.kWidth * 0.9,
                    height: AppConst.kHeight * 0.07,
                    color: AppConst.kBkDark,
                    color2: AppConst.kBKLight,
                    text: "Send code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
