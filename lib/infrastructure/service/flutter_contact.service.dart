import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_dart/domain/entities/contact_type.dart';
import 'package:curriculum_dart/service/contact.service.dart';
import 'package:curriculum_flutter/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterContactService implements ContactService {
  static FlutterContactService? _instancia;

  FlutterContactService._();

  static FlutterContactService get instance {
    _instancia ??= FlutterContactService._();
    return _instancia!;
  }

  @override
  Future<void> openContact(ContactInfo contactInfo) async {
    final uri = _parseUri(contactInfo);
    await launchUrl(uri);
  }

  @override
  Future<bool> canLaunch(ContactInfo contactInfo) async {
    final uri = _parseUri(contactInfo);
    return await canLaunchUrl(uri);
  }

  Uri _parseUri(ContactInfo contactInfo) {
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
}
