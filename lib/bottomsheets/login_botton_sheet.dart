import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBottomSheet extends StatefulWidget {
  final VoidCallback onNext;

  const LoginBottomSheet({super.key, required this.onNext});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  bool isChecked = false;
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sign in to Continue',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16.sp),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
        ),
        Divider(
          color: Color(0xFFCCCCCC),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter Your Phone Number',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12.sp),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 5.w),
                child: Text(
                  '+91',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF757474), fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 50.w),
              contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              hintText: 'Mobile Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Expanded(
                child: RichText(
                    text: TextSpan(text: 'Accept ', style: Theme.of(context).textTheme.displayMedium, children: [
              TextSpan(
                  text: 'Terms and Conditions',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Color(0xFF3E468F), decoration: TextDecoration.underline))
            ]))),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ElevatedButton(
            onPressed:widget.onNext,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next',
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20.r,
                )
              ],
            ))
      ],
    );
  }
}
