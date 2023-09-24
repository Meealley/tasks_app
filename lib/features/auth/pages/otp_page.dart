import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/common/widgets/reusable_texts.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(hght: AppConst.kHeight * 0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset(
                'assets/images/otp.png',
                width: AppConst.kWidth * 0.5,
              ),
            ),
            const HeightSpacer(hght: 10),
            ReusableText(
                text: "Enter the Code we sent to your phone",
                style: appstyle(18, AppConst.kLight, FontWeight.w500)),
            const HeightSpacer(hght: 26),
            Pinput(
              length: 4,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 4) {}
              },
              onSubmitted: (value) {},
            ),
          ],
        ),
      )),
    );
  }
}
