import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toasty_box/custom_toast.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_manager.dart';


class ToastService {
  static final ToastViewManager<int> _expandedIndex = ToastViewManager<int>(-1);
  static final List<OverlayEntry?> _overlayEntries = [];
  static final List<double> _overlayPositions = [];
  static final List<int> _overlayIndexList = [];
  static final List<AnimationController?> _animationControllers = [];
  static OverlayState? _overlayState;

  static int? _showToastNumber;

  static void showToastNumber(int val) {
    assert(val > 0,
    "Show toast number can't be negative or zero. Default show toast number is 5.");
    if (val > 0) {
      _showToastNumber = val;
    }
  }

  static void _reverseAnimation(int index) {
    if (_overlayIndexList.contains(index)) {
      _animationControllers[index]?.reverse().then((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        _removeOverlayEntry(index);
      });
    }
  }

  static void _removeOverlayEntry(int index) {
    _overlayEntries[index]?.remove();
    _animationControllers[index]?.dispose();
    _overlayIndexList.remove(index);
  }

  static void _forwardAnimation(int index) {
    _overlayState?.insert(_overlayEntries[index]!);
    _animationControllers[index]?.forward();
  }

  static double _calculatePosition(int index) {
    return _overlayPositions[index];
  }

  static void _addOverlayPosition(int index) {
    _overlayPositions.add(30);
    _overlayIndexList.add(index);
  }

  static bool _isToastInFront(int index) =>
      index > _overlayPositions.length - 5;

  static void _updateOverlayPositions({bool isReverse = false, int pos = 0}) {
    if (isReverse) {
      _reverseUpdatePositions(pos: pos);
    } else {
      _forwardUpdatePositions();
    }
  }

  static void _rebuildPositions() {
    for (int i = 0; i < _overlayPositions.length; i++) {
      _overlayEntries[i]?.markNeedsBuild();
    }
  }

  static void _reverseUpdatePositions({int pos = 0}) {
    for (int i = pos - 1; i >= 0; i--) {
      _overlayPositions[i] = _overlayPositions[i] - 10;
      _overlayEntries[i]?.markNeedsBuild();
    }
  }

  static void _forwardUpdatePositions() {
    for (int i = 0; i < _overlayPositions.length; i++) {
      _overlayPositions[i] = _overlayPositions[i] + 10;
      _overlayEntries[i]?.markNeedsBuild();
    }
  }

  static double _calculateOpacity(int index) {
    int noOfShowToast = _showToastNumber ?? 5;
    if (_overlayIndexList.length <= noOfShowToast) return 1;
    final isFirstFiveToast = _overlayIndexList
        .sublist(_overlayIndexList.length - noOfShowToast)
        .contains(index);
    return isFirstFiveToast ? 1 : 0;
  }

  static void _toggleExpand(int index) {
    if (_expandedIndex.value == index) {
      _expandedIndex.value = -1;
    } else {
      _expandedIndex.value = index;
    }
    _rebuildPositions();
  }

  static Duration _toastDuration(ToastLength length) {
    switch (length) {
      case ToastLength.short:
        return const Duration(milliseconds: 2000);
      case ToastLength.medium:
        return const Duration(milliseconds: 3500);
      case ToastLength.long:
        return const Duration(milliseconds: 5000);
      case ToastLength.ages:
        return const Duration(minutes: 2);
      default:
        return const Duration(hours: 24);
    }
  }

  static Future<void> _showToast(
      BuildContext context, {
        String? message,
        TextStyle? messageStyle,
        Widget? leading,
        Widget? child,
        bool isClosable = false,
        double expandedHeight = 100,
        Color? backgroundColor,
        Color? shadowColor,
        Curve? slideCurve,
        Curve positionCurve = Curves.elasticOut,
        ToastLength length = ToastLength.short,
        DismissDirection dismissDirection = DismissDirection.up,
      }) async {
    assert(expandedHeight >= 0.0,
    "Expanded height should not be a negative number!");
    if (context.mounted) {
      _overlayState = Overlay.of(context);
      final controller = AnimationController(
        vsync: _overlayState!,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 1000),
      );
      _animationControllers.add(controller);
      int controllerIndex = _animationControllers.indexOf(controller);
      _addOverlayPosition(controllerIndex);
      final overlayEntry = OverlayEntry(
        builder: (context) => AnimatedPositioned(
          top: _calculatePosition(controllerIndex) +
              (_expandedIndex.value == controllerIndex ? expandedHeight : 0.0),
          left: 10,
          right: 10,
          duration: const Duration(milliseconds: 500),
          curve: positionCurve,
          child: Dismissible(
            key: Key(UniqueKey().toString()),
            direction: dismissDirection,
            onDismissed: (_) {
              _removeOverlayEntry(_animationControllers.indexOf(controller));
              _updateOverlayPositions(
                isReverse: true,
                pos: _animationControllers.indexOf(controller),
              );
            },
            child: AnimatedPadding(
              padding: EdgeInsets.symmetric(
                horizontal: (_expandedIndex.value == controllerIndex
                    ? 10
                    : max(_calculatePosition(controllerIndex) - 35, 0.0)),
              ),
              duration: const Duration(milliseconds: 500),
              curve: positionCurve,
              child: AnimatedOpacity(
                opacity: _calculateOpacity(controllerIndex),
                duration: const Duration(milliseconds: 500),
                child: CustomToast(
                  message: message,
                  messageStyle: messageStyle,
                  backgroundColor: backgroundColor,
                  shadowColor: shadowColor,
                  curve: slideCurve,
                  isClosable: isClosable,
                  isInFront: _isToastInFront(
                      _animationControllers.indexOf(controller)),
                  controller: controller,
                  onTap: () => _toggleExpand(controllerIndex),
                  onClose: () {
                    _removeOverlayEntry(
                        _animationControllers.indexOf(controller));
                    _updateOverlayPositions(
                      isReverse: true,
                      pos: _animationControllers.indexOf(controller),
                    );
                  },
                  leading: leading,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
      _overlayEntries.add(overlayEntry);
      _updateOverlayPositions();
      _forwardAnimation(_animationControllers.indexOf(controller));
      await Future.delayed(_toastDuration(length));
      _reverseAnimation(_animationControllers.indexOf(controller));
    }
  }

  static Future<void> showToast(
      BuildContext context, {
        String? message,
        TextStyle? messageStyle,
        Widget? leading,
        bool isClosable = false,
        double expandedHeight = 100,
        Color? backgroundColor,
        Color? shadowColor,
        Curve? slideCurve,
        Curve positionCurve = Curves.elasticOut,
        ToastLength length = ToastLength.short,
        DismissDirection dismissDirection = DismissDirection.down,
      }) async {
    _showToast(
      context,
      message: message,
      messageStyle: messageStyle,
      isClosable: isClosable,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      positionCurve: positionCurve,
      length: length,
      dismissDirection: dismissDirection,
      leading: leading,
    );
  }

  static Future<void> showWidgetToast(
      BuildContext context, {
        Widget? child,
        bool isClosable = false,
        double expandedHeight = 100,
        Color? backgroundColor,
        Color? shadowColor,
        Curve? slideCurve,
        Curve positionCurve = Curves.elasticOut,
        ToastLength length = ToastLength.short,
        DismissDirection dismissDirection = DismissDirection.down,
      }) async {
    _showToast(
      context,
      isClosable: isClosable,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      positionCurve: positionCurve,
      length: length,
      dismissDirection: dismissDirection,
      child: child,
    );
  }

  static Future<void> showSuccessToast(
      BuildContext context, {
        String? message,
        Widget? child,
        Widget? leading,
        bool isClosable = false,
        double expandedHeight = 100,
        Color? backgroundColor,
        Color? shadowColor,
        Curve? slideCurve,
        Curve positionCurve = Curves.elasticOut,
        ToastLength length = ToastLength.short,
        DismissDirection dismissDirection = DismissDirection.down,
      }) async {
    _showToast(
      context,
      message: message,
      messageStyle: const TextStyle(
        color: Colors.white,
      ),
      isClosable: isClosable,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor ?? Colors.green,
      shadowColor: shadowColor ?? Colors.green.shade500,
      positionCurve: positionCurve,
      length: length,
      dismissDirection: dismissDirection,
      leading: leading ??
          const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
      child: child,
    );
  }

  static Future<void> showErrorToast(
      BuildContext context, {
        String? message,
        Widget? child,
        bool isClosable = false,
        double expandedHeight = 100,
        Color? backgroundColor,
        Color? shadowColor,
        Curve? slideCurve,
        Curve positionCurve = Curves.elasticOut,
        ToastLength length = ToastLength.short,
        DismissDirection dismissDirection = DismissDirection.down,
      }) async {
    _showToast(
      context,
      message: message,
      messageStyle: const TextStyle(
        color: Colors.white,
      ),
      isClosable: isClosable,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor ?? Colors.red,
      shadowColor: shadowColor ?? Colors.red.shade500,
      positionCurve: positionCurve,
      length: length,
      dismissDirection: dismissDirection,
      leading: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      child: child,
    );
  }

  static Future<void> showWarningToast(
      BuildContext context, {
        String? message,
        Widget? child,
        bool isClosable = false,
        double expandedHeight = 100,
        Color? backgroundColor,
        Color? shadowColor,
        Curve? slideCurve,
        Curve positionCurve = Curves.elasticOut,
        ToastLength length = ToastLength.short,
        DismissDirection dismissDirection = DismissDirection.down,
      }) async {
    _showToast(
      context,
      message: message,
      messageStyle: const TextStyle(
        color: Colors.white,
      ),
      isClosable: isClosable,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor ?? Colors.orange,
      shadowColor: shadowColor ?? Colors.orange.shade500,
      positionCurve: positionCurve,
      length: length,
      dismissDirection: dismissDirection,
      leading: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
