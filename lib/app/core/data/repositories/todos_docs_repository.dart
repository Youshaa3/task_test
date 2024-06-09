import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/add_new_todo_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/delete_todo_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_all_todos_by_user_id_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_all_todos_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_random_todo_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_single_todo_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/limit_and_skip_todos_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/update_todo_model.dart';
import 'package:task_manager_app/app/core/data/models/common_response.dart';
import 'package:task_manager_app/app/core/data/network/end_points/todos_docs_endpoints.dart';
import 'package:task_manager_app/app/core/data/network/network_config.dart';
import 'package:task_manager_app/app/core/enums/request_type.dart';
import 'package:task_manager_app/app/core/utils/network_utils.dart';

class TodosDocsRepository {
  Future<(String?, GetAllTodosModel?)> getAll() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: TodosDocsEndpoints.getAll,
          headers: NetworkConfig.getHeaders(
            type: RequestType.get,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              GetAllTodosModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, GetSingleTodoModel?)> getSingle({required int id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: TodosDocsEndpoints.getSingle + id.toString(),
          headers: NetworkConfig.getHeaders(
            type: RequestType.get,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              GetSingleTodoModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, GetRandomTodoModel?)> getRandom(int? length) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: length != null
              ? TodosDocsEndpoints.getRandom + length.toString()
              : TodosDocsEndpoints.getRandom,
          headers: NetworkConfig.getHeaders(
            type: RequestType.get,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              GetRandomTodoModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, LimitAndSkipTodosModel?)> getLimitAndSkip(
      {required int limit, required int skip}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: TodosDocsEndpoints.limitAndSkip,
          params: {"limit": limit.toString(), "skip": skip.toString()},
          headers: NetworkConfig.getHeaders(
            type: RequestType.get,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              LimitAndSkipTodosModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, GetAllTodosByUserIdModel?)> getAllByUserId(
      {required int userId}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: TodosDocsEndpoints.getAllByUserId + userId.toString(),
          headers: NetworkConfig.getHeaders(
            type: RequestType.get,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              GetAllTodosByUserIdModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, AddNewTodoModel?)> addNew(
      {required int userId,
      required String todo,
      required bool completed}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.post,
          url: TodosDocsEndpoints.addNew,
          body: {"todo": todo, "completed": completed, "userId": userId},
          headers: NetworkConfig.getHeaders(
            type: RequestType.post,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              AddNewTodoModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, UpdateTodoModel?)> update(
      {required int id, required bool completed}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.put,
          url: TodosDocsEndpoints.update + id.toString(),
          body: {"completed": completed},
          headers: NetworkConfig.getHeaders(
            type: RequestType.put,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              UpdateTodoModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, DeleteTodoModel?)> delete({required int id}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.delete,
          url: TodosDocsEndpoints.delete + id.toString(),
          headers: NetworkConfig.getHeaders(
            type: RequestType.delete,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              DeleteTodoModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet connection', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
}
