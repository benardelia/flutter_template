
import 'package:flutter/material.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:vilcom_digital_restaurant/services/toast_service/toast_service.dart';

enum ToastMessageType { info, success, warning, error }

void showMessage(BuildContext context, String message, ToastMessageType type,
    ToastLength? length) {
  if (type == ToastMessageType.error) {
    ToastService.showErrorToast(
      // ignore: use_build_context_synchronously
      context,
      length: length ?? ToastLength.medium,
      message: message,
    );
  }
  if (type == ToastMessageType.success) {
    ToastService.showSuccessToast(
      // ignore: use_build_context_synchronously
      context,
      length: length ?? ToastLength.medium,
      message: message,
    );
  }
  if (type == ToastMessageType.warning) {
    ToastService.showWarningToast(
      // ignore: use_build_context_synchronously
      context,
      length: length ?? ToastLength.medium,
      message: message,
    );
  }
  if (type == ToastMessageType.info) {
    ToastService.showToast(
      // ignore: use_build_context_synchronously
      context,
      length: length ?? ToastLength.medium,
      message: message,
    );
  }
}
