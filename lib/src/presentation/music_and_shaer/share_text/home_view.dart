import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareText extends StatefulWidget {
  const ShareText({super.key});

  @override
  State<ShareText> createState() => _ShareTextState();
}

class _ShareTextState extends State<ShareText> {
  void shareText() async {
    var result = await Share.share('check out my website ');
    log('Share result: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FloatingActionButton(
              onPressed: () {
                shareText();
              },
              child: const Text('Shear App'),
            ),
          ),
        ],
      ),
    );
  }
}
