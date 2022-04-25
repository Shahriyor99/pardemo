// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pardemo/model/emp_model.dart';
import '../model/emp_one_model.dart';
import '../services/http_servic.dart';

class DetailPage extends StatefulWidget {
  static const String id="DetailPage";
  final int? employee_id;
  // ignore: use_key_in_widget_constructors
  const DetailPage({this.employee_id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Employee? data;
  int? empId;

  void _apiEmpOne(int id){
    Network.GET(Network.API_ONE+id.toString(), Network.paramsEmpty()).then((response) => {
      // ignore: avoid_print
      showResponse(response!),
      // ignore: avoid_print
      print(response),
    });
  }

  showResponse(String response){
    EmpOne empOne = Network.parseEmpOne(response);
    setState(() {
      data=empOne.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne(widget.employee_id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Employee Data-"+data!.id.toString(), style: const TextStyle(color: Colors.blue, fontSize: 30),),
            const SizedBox(height: 25,),
            Text("Name:  "+data!.employee_name, style: const TextStyle(color: Colors.black, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Age:  "+data!.employee_age.toString(), style: const TextStyle(color: Colors.black, fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Salary:  "+data!.employee_salary.toString()+'\$', style: const TextStyle(color: Colors.black, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
