// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pardemo/model/emp_list_model.dart';
import 'package:pardemo/model/emp_model.dart';
import 'package:pardemo/model/model_create.dart';
import 'package:pardemo/model/user_model.dart';
import 'package:pardemo/pages/detail_page.dart';
import 'package:pardemo/services/http_servic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id="HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Employee> _items;
  static int? id;

  //#Create
  void _apiEmpCreate(User user){
    Network.POST(Network.API_CREATE, Network.paramsCreate(user)).then((response) => {
      print(response),
      showResponse(response!),
    });
  }

  //#Update
  void _apiEmpUpdate(User user){
    Network.UPDATE(Network.API_CREATE+user.id.toString(), Network.paramsUpdate(user)).then((response) => {
      print(response),
      showResponse(response!),
    });
  }

  //#Delete
  void _apiEmpDelete(User user){
    Network.DEL(Network.API_CREATE+user.id.toString(), Network.paramsDelete()).then((response) => {
      print(response),
      showResponse(response!),
    });
  }

  void _apiEmpList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      showResponse(response!),
    });
  }

  showResponse(String response){
    EmpList empList=Network.parseEmpList(response);
    setState(() {
      _items=empList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
    // _apiEmpOne(1);
  }

  Future _openDetailPage() async{
    Map getId  = await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return DetailPage(employee_id: id);
        }
    ));
    if(getId.containsKey(id)){
      setState(() {
        id = getId[id];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Employee List"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i){
          return _itemOfList(_items[i]);
        },
        itemCount: _items.length,
      ),
    );
  }

  Widget _itemOfList(Employee emp){
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name+" ("+emp.employee_age.toString()+")",style: const TextStyle(color: Colors.blue, fontSize: 25),),
            const SizedBox(height: 10,),
            Text(emp.employee_salary.toString()+'\$', style: const TextStyle(color: Colors.black, fontSize: 20),),
          ],
        ),
      ),
      onTap: (){
        _openDetailPage();
      },
    );
  }
}
