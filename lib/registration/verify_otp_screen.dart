import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController pincontroller = TextEditingController();
  int _secondsRemaining = 30;
  late Timer _timer;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isResendEnabled = false;
    _secondsRemaining = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendEnabled = true;
        });
        _timer.cancel();
      }
    });
  }

  String _formatTime() {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}"; // Ensures 2-digit seconds format
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.close, size: 35.r),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 236.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10.h),
                    SizedBox(height: 61.h, width: 116.w, child: Image.asset('assets/Logo.png')),
                    SizedBox(
                      height: 103.h,
                      child: Column(
                        children: [
                          Text(
                            'Verify Mobile No.',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            width: 343.w,
                            child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                    text: 'Please enter the 4 digital verification code sent to your mobile  number ',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    children: [
                                      TextSpan(
                                          text: '+91 - 7675998938 ',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                                      TextSpan(text: 'via '),
                                      TextSpan(text: 'SMS', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70.h,
          ),
          Pinput(
            controller: pincontroller,
            defaultPinTheme: PinTheme(
                textStyle: Theme.of(context).textTheme.displayMedium,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                        color: Color(
                      0xFFCCCCCC,
                    ))),
                height: 44.h,
                width: 42.w),
          ),
          SizedBox(
            height: 60.h,
          ),
          Visibility(
            visible: !_isResendEnabled,
            replacement: TextButton(
                onPressed: () {
                  setState(() {
                    _isResendEnabled = !_isResendEnabled;
                    _startTimer();
                  });
                },
                child: Text(
                  'Resend',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Didn’t receive OTP?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Resend OTP ',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(decoration: TextDecoration.underline),
                        ),
                        Text('in ', style: Theme.of(context).textTheme.displayMedium),
                        Text(_formatTime(), style: Theme.of(context).textTheme.displayMedium),
                        Text(" sec", style: Theme.of(context).textTheme.displayMedium)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/customername');
              },
              child: Text('Verify OTP'))
        ],
      ),
    );
  }
}
