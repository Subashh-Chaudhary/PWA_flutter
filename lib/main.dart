import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

void main() {
  runApp(const SmartBoardApp());
}

class SmartBoardApp extends StatelessWidget {
  const SmartBoardApp({super.key});

  final String pwaUrl = 'https://smart.chandannathmun.gov.np/';

  Future<void> _launchTWA(BuildContext context) async {
    try {
      // Use 'launch' function correctly without passing 'option'
      await launch(
        pwaUrl,
        // You can directly pass the options here.
        customTabsOption: CustomTabsOption(
          toolbarColor: Colors.white,
          enableUrlBarHiding: true,
          showPageTitle: false,
          enableInstantApps: true,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open PWA')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => _launchTWA(context),
            child: const Text('Open Smart Board PWA'),
          ),
        ),
      ),
    );
  }
}
