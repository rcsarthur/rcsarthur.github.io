import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_dart/domain/enums/contact_type.enum.dart';
import 'package:curriculum_dart/service/launch.service.dart';
import 'package:curriculum_flutter/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterLaunchService implements LaunchService {
  static FlutterLaunchService? _instancia;

  FlutterLaunchService._();

  static FlutterLaunchService get instance {
    _instancia ??= FlutterLaunchService._();
    return _instancia!;
  }

  @override
  Future<void> openContact(ContactInfo contactInfo) async {
    final uri = _parseUriContact(contactInfo);
    await launchUrl(uri);
  }

  @override
  Future<bool> canLaunchContact(ContactInfo contactInfo) async {
    final uri = _parseUriContact(contactInfo);
    return await canLaunchUrl(uri);
  }

  Uri _parseUriContact(ContactInfo contactInfo) {
    Uri uri;
    switch (contactInfo.type) {
      case ContactType.email:
        uri = _buildEmailUrl(contactInfo.value, S.current.emailSubject, contactInfo.preDefinedMessage!);
        break;
      case ContactType.whatsapp:
        uri = _buildWhatsappUrl(contactInfo.value, contactInfo.preDefinedMessage!);
        break;
      default:
        uri = _buildUrl(contactInfo.url);
    }
    return uri;
  }

  Uri _buildUrl(String url) {
    return Uri.parse(url);
  }

  Uri _buildEmailUrl(String email, String subject, String body) {
    return Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );
  }

  Uri _buildWhatsappUrl(String contato, String subject) {
    return Uri(
      scheme: 'https',
      path: 'wa.me/$contato',
      query: _encodeQueryParameters(<String, String>{
        'text': subject,
      }),
    );
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Future<bool> canLaunchRawUrl(String url) async {
    final uri = _buildUrl(url);
    return await canLaunchUrl(uri);
  }

  @override
  Future<void> openRawUrl(String url) async {
    final uri = _buildUrl(url);
    await launchUrl(uri);
  }
}
