import 'package:flutter/material.dart';

class UndefinedRouteScreen extends StatelessWidget {
  final String routeName;

  const UndefinedRouteScreen({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text('No route defined for $routeName'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go Back'), 
          ),
        ],
      ),
    );
  }
}
