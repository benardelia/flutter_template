import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CLoadingIndicator extends StatelessWidget {
  final String loadingMessage;
  const CLoadingIndicator({super.key, required this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitChasingDots(color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 10),
              Text(
                loadingMessage,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
