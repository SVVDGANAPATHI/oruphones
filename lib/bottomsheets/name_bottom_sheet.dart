import 'package:flutter/material.dart';

class NameBottomSheet extends StatefulWidget {
  const NameBottomSheet({super.key});

  @override
  State<NameBottomSheet> createState() => _NameBottomSheetState();
}

class _NameBottomSheetState extends State<NameBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 50),
        SizedBox(height: 20),
        Text('Login Successful!'),
      ],
    );
  }
}
