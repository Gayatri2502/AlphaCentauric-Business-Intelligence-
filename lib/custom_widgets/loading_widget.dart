import 'package:flutter/material.dart';

class LoadAndNavigateWidget {
  static void showLoadingAndNavigate(
      BuildContext context, Widget destinationScreen) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertBox();
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the loading dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => destinationScreen),
      );
    });
  }
}

class AlertBox extends StatelessWidget {
  const AlertBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo.shade200),
          ),
          const SizedBox(height: 16),
          const Text('Loading...'),
        ],
      ),
    );
  }
}
