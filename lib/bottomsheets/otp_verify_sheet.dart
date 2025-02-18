import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oruphones/bloc/auth/auth_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerifyScreen extends StatefulWidget {
  final VoidCallback onNext;
  const OtpVerifyScreen({super.key, required this.onNext});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String mobileNumber = '';
  final TextEditingController pincontroller = TextEditingController();
  int _secondsRemaining = 30;
  late Timer _timer;
  bool _isResendEnabled = false;

  @override
  void initState() {
    getMobileNumber();
    _startTimer();
    super.initState();
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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticatedPartially) {
          Fluttertoast.showToast(
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_SHORT,
            msg: 'OTP Authenticated Successfully');
          widget.onNext();
        } else {
           Fluttertoast.showToast(backgroundColor: Colors.green, toastLength: Toast.LENGTH_SHORT, msg: 'OTP Authenticated Successfully');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
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
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      Text(
                        'Verify Otp',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16.sp),
                      ),
                    ],
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: 'Please enter the 4 digital verification code sent to your mobile  number ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: '+91 - $mobileNumber ', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                          TextSpan(text: 'via '),
                          TextSpan(text: 'SMS', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                        ])),
              ),
            ),
            SizedBox(
              height: 10.h,
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
              height: 10.h,
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
                        height: 8.h,
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
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            if (state is AuthLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(VerifyOtp(phonenumber: int.tryParse(mobileNumber)!, otp: int.tryParse(pincontroller.text.toString())!));
                  },
                  child: Text('Verify OTP'))
          ],
        );
      },
    );
  }

  void getMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mobileNumber = prefs.getString('phonenumber')!;
  }
}
