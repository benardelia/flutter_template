import 'package:flutter/material.dart';

import '../../custom_widgets/custom_loading_indicator.dart';



class NetworkLoader {
  static final NetworkLoader _instance = NetworkLoader._internal();
  OverlayEntry? _overlayEntry;

  factory NetworkLoader() => _instance;

  NetworkLoader._internal();

  void show(BuildContext context) {
    if (_overlayEntry != null) return;
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(color: Colors.black54, dismissible: false),
          ModalBarrier(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(127),
            dismissible: false,
          ),
          Center(
            child: CLoadingIndicator(loadingMessage: ''),
          ),
        ],
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
