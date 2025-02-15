import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oruphones/bloc/auth/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, size: 35.r),
            ),
          )
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpSent) {
            Fluttertoast.showToast(
              msg: 'OTP Sent Succesfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            Navigator.pushNamed(context, '/verifyotp',arguments: _phoneController.text.toString());
          }
          else if(state is AuthError)
          {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 236.h,
                      width: 136.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 10.h),
                          SizedBox(height: 61.h, width: 116.w, child: Image.asset('assets/Logo.png')),
                          SizedBox(
                            height: 66.h,
                            width: 136.w,
                            child: Column(
                              children: [
                                Text(
                                  'Welcome',
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Sign in to Continue',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h), // Added some spacing
                SizedBox(
                  height: 80.h,
                  width: 358.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Your Phone Number',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(height: 5.h),
                      TextFormField(
                        controller: _phoneController,
                        onChanged: (value) {
                          if (value.length == 10) {
                            FocusScope.of(context).unfocus();
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 5.w),
                            child: Text(
                              '+91',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Color(0xFF757474), fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
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
                if (state is AuthLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/verifyotp');
                        final countryCode = int.tryParse('91');
                        final mobileNumber = int.tryParse(_phoneController.text);
                        if (countryCode == null || mobileNumber == null) {
                          // Show an error if parsing fails
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Invalid input')),
                          );
                          return;
                        }
                        context.read<AuthBloc>().add(LoginRequested(countryCode: countryCode, phoneNumber: mobileNumber));
                      },
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
            ),
          );
        },
      ),
    );
  }
}
