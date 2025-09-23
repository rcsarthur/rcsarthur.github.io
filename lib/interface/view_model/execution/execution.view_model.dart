import 'package:curriculum_dart/service/notification.service.dart';

typedef FutureAction<T> = Future<T> Function();

mixin ExecutionViewModel {
  NotificationService get notificationService;

  Future<T?> executeWithNotification<T>(FutureAction<T> action, {String? successMessage, String? errorMessage}) async {
    try {
      final T result = await action();
      if (successMessage != null) {
        await Future.delayed(const Duration(milliseconds: 50));
        notificationService.showNotification(message: successMessage);
      }
      return result;
    } catch (e) {
      final message = errorMessage ?? 'Ocorreu um erro ao executar a ação.';
      notificationService.showNotification(message: message);
      return null;
    }
  }
}
