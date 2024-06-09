import 'package:task_manager_app/app/core/data/network/network_config.dart';

class TodosDocsEndpoints {
  static String getAll = NetworkConfig.getFulApiUrl('todos');
  static String getSingle = NetworkConfig.getFulApiUrl('todos/');
  static String getRandom = NetworkConfig.getFulApiUrl('todos/random/');
  static String limitAndSkip = NetworkConfig.getFulApiUrl('todos');
  static String getAllByUserId = NetworkConfig.getFulApiUrl('todos/user/');
  static String addNew = NetworkConfig.getFulApiUrl('todos/add');
  static String update = NetworkConfig.getFulApiUrl('todos/');
  static String delete = NetworkConfig.getFulApiUrl('todos/');
}
