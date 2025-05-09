import 'package:flutter/material.dart';

import '../helpers/connectivity.dart';
import 'loader.dart';

class NetworkInterceptor {
  static final NetworkInterceptor _instance = NetworkInterceptor._internal();
  late BuildContext _context;
  int _activeRequests = 0;

  factory NetworkInterceptor() => _instance;

  NetworkInterceptor._internal();

  void init(BuildContext context) {
    _context = context;
  }

  Future<T> intercept<T>(Future<T> Function() networkCall) async {
    _startLoading();
    try {
      return await networkCall();
    } catch (e) {
      _showError("Network error: $e");
      rethrow;
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    if (_activeRequests == 0) {
      NetworkLoader().show(_context);
    }
    _activeRequests++;
  }

  void _stopLoading() {
    _activeRequests--;
    if (_activeRequests == 0) {
      NetworkLoader().hide();
    }
  }

  Future<void> _showError(String message) async {
    var connectivity = await InternetConnection.hasInternetConnection();
    if (!connectivity) {
      ScaffoldMessenger.of(
        _context,
      ).showSnackBar(SnackBar(content: Text("Network Error!")));
    }
    // Log.i(message);
    // ScaffoldMessenger.of(_context).showSnackBar(
    //   SnackBar(content: Text(message)),
    // );
  }
}
