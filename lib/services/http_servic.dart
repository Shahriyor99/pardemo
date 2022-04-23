
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';
import 'package:pardemo/model/emp_create.dart';
import 'package:pardemo/model/emp_delete.dart';
import 'package:pardemo/model/emp_list_model.dart';
import 'package:pardemo/model/emp_one_model.dart';
import 'package:pardemo/model/emp_update.dart';
import 'package:pardemo/model/model_create.dart';
import 'package:pardemo/model/user_model.dart';

class Network{
  static String BASE="dummy.restapiexample.com";
  static Map<String, String> headers={'Content-Type':'application/json; charset=UTF-8'};

  /* http Apis */

  static String API_LIST = "/api/v1/employees";
  static String API_ONE = "/api/v1/employee/"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  /* http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async{
    var uri=Uri.http(BASE, api, params);
    var response=await get(uri, headers: headers);
    if(response.statusCode==200){
      return response.body;
    }else{
      return null;
    }
  }

  static Future<String?> POST(String api, Map<String, String> params) async{
    var uri=Uri.http(BASE, api);
    var response=await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode==200 || response.statusCode==201){
      return response.body;
    }else{
      return null;
    }
  }

  static Future<String?> UPDATE(String api, Map<String, String> params) async{
    var uri=Uri.http(BASE, api);
    var response=await put(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }else{
      return null;
    }
  }

  static Future<String?> DEL(String api, Map<String, String> params) async{
    var uri=Uri.http(BASE, api, params);
    var response=await delete(uri, headers: headers);
    if(response.statusCode==200){
      return response.body;
    }else{
      return null;
    }
  }

  /* http Params */

  static Map<String, String> paramsEmpty(){
    Map<String, String> params={};
    return params;
  }

  static Map<String, String> paramsCreate(User user){
    Map<String, String> params={};
    params.addAll({
      'name' : user.name,
      'salary': user.salary.toString(),
      'age' : user.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User user){
    Map<String, String> params={};
    params.addAll({
      'name' : user.name,
      'salary': user.salary.toString(),
      'age' : user.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsDelete(){
    Map<String, String> params={};
    return params;
  }

  /* http Parsing */

  static EmpList parseEmpList(String response){
    dynamic json = jsonDecode(response);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String response){
    dynamic json = jsonDecode(response);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static Create parseEmpCreate(String response){
    dynamic json = jsonDecode(response);
    var data = Create.fromJson(json);
    return data;
  }

  static EmpUpdate parseEmpUpdate(String response){
    dynamic json = jsonDecode(response);
    var data = EmpUpdate.fromJson(json);
    return data;
  }

  static EmpDelete parseEmpDelete(String response){
    dynamic json = jsonDecode(response);
    var data = EmpDelete.fromJson(json);
    return data;
  }
}