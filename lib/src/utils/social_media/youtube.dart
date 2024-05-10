// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> youtube() async {
  const youtubeLink = 'https://youtube.com/@SebepRu?si=xs8mc7CKOVbbTGxe';
  if (Platform.isIOS) {
    if (await canLaunch(youtubeLink)) {
      await launch(youtubeLink, forceSafariVC: false);
    } else {
      if (await canLaunch(youtubeLink)) {
        await launch(youtubeLink);
      } else {
        log('Could not launch $youtubeLink');
      }
    }
  } else {
    const url = youtubeLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      log('Could not launch $youtubeLink');
    }
  }
}
