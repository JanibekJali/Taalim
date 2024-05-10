import 'package:url_launcher/url_launcher.dart';

Future<void> whatsapp() async {
  const contact = '+996507158857';
  const text = 'Hello';
  final iosUrl = 'https://wa.me/$contact?text=${Uri.parse(text)}';
  const webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=hi';

  try {
    if (await canLaunchUrl(Uri.parse(iosUrl))) {
      await launchUrl(Uri.parse(iosUrl));
    }
  } catch (e) {
    await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
  }
}
