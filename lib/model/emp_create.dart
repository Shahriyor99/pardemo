import 'package:pardemo/model/model_create.dart';

class Create{
  String status;
  String message;
  EmpCreate data;


  Create.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = EmpCreate.fromJson(json['data']);

  Map<String, dynamic> toJson() =>{
    'status' : status,
    'message' : message,
    'data' : data.toJson(),
  };
}