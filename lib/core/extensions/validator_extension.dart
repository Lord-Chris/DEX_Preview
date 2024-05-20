import 'package:flutter/material.dart';

extension ValidatorExtension on BuildContext {
  String? validateEmail(String? email) {
    if (email!.isEmpty) return 'Email is required';

    bool isEmailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email.trim());

    return (isEmailValid) ? null : 'Please enter a valid email';
  }

  String? validateOptionalEmail(String? email) {
    if (email!.isEmpty) return null;

    bool isEmailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email.trim());

    return (isEmailValid) ? null : 'Please enter a valid email';
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) return 'Password is required';

    bool isPasswordValid = password.length >= 8;

    return (isPasswordValid) ? null : 'Please enter a valid password';
  }

  String? validateConfirmPasswordField(String? input, String? password) {
    if (input != password) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  String? validateNotEmptyField(String? input, [String? label]) {
    if (input!.isEmpty) {
      return label == null ? 'This field cannot be empty' : 'Enter a $label';
    } else {
      return null;
    }
  }

  String? validateOTP(String? otpCode) {
    if (otpCode!.isEmpty) return 'OTP code is required';

    bool isOTPValid = otpCode.length == 6 || otpCode.length == 4;

    return (isOTPValid) ? null : 'Please enter a valid OTP code';
  }

  String? validatePIN(String? pinCode) {
    if (pinCode!.isEmpty) return 'PIN code is required';

    bool isNumeric(String? s) {
      if (s == null) {
        return false;
      }
      return int.tryParse(s) != null;
    }

    bool isOTPValid = pinCode.length == 4 && isNumeric(pinCode);

    return (isOTPValid) ? null : 'Please enter a valid PIN code';
  }
}
