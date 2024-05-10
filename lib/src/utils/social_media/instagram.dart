import 'package:url_launcher/url_launcher_string.dart';

Future<void> instagram() async {
  const nativeUrl = 'instagram://user?username=sebepschool';
  const webUrl =
      'https://www.instagram.com/sebepschool?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==';

  try {
    await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
  } catch (e) {
    await launchUrlString(webUrl);
  }
}
