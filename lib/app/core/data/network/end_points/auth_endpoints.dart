import 'package:task_manager_app/app/core/data/network/network_config.dart';

class AuthEndpoints {
  static String login = NetworkConfig.getFulApiUrl('auth/login');
  static String getCurrentUser = NetworkConfig.getFulApiUrl('auth/me');
  static String refreshSession = NetworkConfig.getFulApiUrl('auth/refresh');
}
