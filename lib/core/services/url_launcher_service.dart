import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherService {
  Future<bool> openUrl(String urlString);
  Future<bool> openEmail(String emailAddress, {String? subject, String? body});
  Future<bool> openWhatsApp(String phoneNumber, {String? message});
}

class UrlLauncherServiceImpl implements UrlLauncherService {
  @override
  Future<bool> openUrl(String urlString) async {
    try {
      final uri = Uri.parse(urlString.trim());
      // Try external browser application first
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (launched) return true;
      return await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (_) {
      try {
        final uri = Uri.parse(urlString.trim());
        return await launchUrl(uri);
      } catch (err) {
        return false;
      }
    }
  }

  @override
  Future<bool> openEmail(String emailAddress, {String? subject, String? body}) async {
    try {
      final queryParameters = <String, String>{};
      if (subject != null && subject.isNotEmpty) queryParameters['subject'] = subject;
      if (body != null && body.isNotEmpty) queryParameters['body'] = body;

      final uri = Uri(
        scheme: 'mailto',
        path: emailAddress.trim(),
        queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
      );

      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (launched) return true;
      return await launchUrl(uri);
    } catch (_) {
      try {
        final uri = Uri.parse('mailto:$emailAddress');
        return await launchUrl(uri);
      } catch (err) {
        return false;
      }
    }
  }

  @override
  Future<bool> openWhatsApp(String phoneNumber, {String? message}) async {
    try {
      final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
      final url = message != null && message.isNotEmpty
          ? 'https://wa.me/$cleanPhone?text=${Uri.encodeComponent(message)}'
          : 'https://wa.me/$cleanPhone';

      final uri = Uri.parse(url);
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (launched) return true;
      return await launchUrl(uri);
    } catch (_) {
      try {
        final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
        final uri = Uri.parse('https://api.whatsapp.com/send?phone=$cleanPhone');
        return await launchUrl(uri);
      } catch (err) {
        return false;
      }
    }
  }
}
