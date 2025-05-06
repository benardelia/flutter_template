import '../utils/interceptor/network_interceptor.dart';

abstract class BaseService {
  Future<T> execute<T>(Future<T> Function() request) async {
    return await NetworkInterceptor().intercept(request);
  }
}