import 'package:curriculum_dart/service/notification.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FlutterNotificationService implements NotificationService {
  static FlutterNotificationService? _instancia;

  FlutterNotificationService._();

  static FlutterNotificationService get instance {
    _instancia ??= FlutterNotificationService._();
    return _instancia!;
  }

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void showNotification({required String message}) {
    final messengerState = messengerKey.currentState;
    if (messengerState == null) {
      debugPrint('ScaffoldMessengerState não está pronto para exibir notificações.');
      return;
    }
    messengerState.removeCurrentSnackBar();

    final snackbar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: kIsWeb ? null : const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      duration: const Duration(seconds: 5),
      width: kIsWeb ? 380 : null,
    );
    messengerState.showSnackBar(snackbar);
  }
}
