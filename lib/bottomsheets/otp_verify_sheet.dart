import 'package:flutter/material.dart';

class OtpVerifyScreen extends StatefulWidget {
  final VoidCallback onNext;

  const OtpVerifyScreen({super.key, required this.onNext});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Enter OTP'),
        TextField(
          decoration: InputDecoration(labelText: 'OTP'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: widget.onNext,
          child: Text('Validate OTP'),
        ),
      ],
    );
  }
}
