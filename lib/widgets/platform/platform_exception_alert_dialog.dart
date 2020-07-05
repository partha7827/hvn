import 'package:flutter/services.dart';
import 'package:highvibe/widgets/platform/platform_alert_dialog.dart';
import 'package:meta/meta.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  static final Map<String, String> _errors = {
    'ERROR_USER_NOT_FOUND': 'User has been deleted.',
    'ERROR_USER_DISABLED': 'User has been disabled.',
  };

  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
            title: title,
            content: _message(exception),
            defaultActionText: 'OK');

  static String _message(PlatformException exception) {
    if (exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Error 7') {
        return 'Missing or insufficient permissions';
      }
    }
    return _errors[exception.code] ?? exception.message;
  }
}
