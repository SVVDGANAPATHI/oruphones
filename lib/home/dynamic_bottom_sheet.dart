import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oruphones/bottomsheets/login_botton_sheet.dart';
import 'package:oruphones/bottomsheets/name_bottom_sheet.dart';
import 'package:oruphones/bottomsheets/otp_verify_sheet.dart';

class DynamicBottomSheet extends StatefulWidget {
  const DynamicBottomSheet({super.key});

  @override
  State<DynamicBottomSheet> createState() => _DynamicBottomSheetState();
}

class _DynamicBottomSheetState extends State<DynamicBottomSheet> {
  final PageController _pageController = PageController(initialPage: 0);

  void _goToNextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 370.h,
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // Disable swipe
              children: [
                LoginBottomSheet(onNext: _goToNextPage),
                OtpVerifyScreen(onNext: _goToNextPage),
                NameBottomSheet(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}