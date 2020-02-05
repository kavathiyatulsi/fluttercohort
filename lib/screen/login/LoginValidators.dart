import 'dart:async';
import 'package:cohort_app/theme/string.dart';

class Validators {
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isNotEmpty) {
      sink.add(email);
    } else {
      sink.addError(errorFullName);
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError(errorEmailFormat);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(email);
    } else {
      sink.addError(errorPasswordLength);
    }
  });
}
