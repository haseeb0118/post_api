import 'dart:async';
import 'package:flutter/material.dart';
import 'package:post_api_project/model/model_class.dart';
import 'package:http/http.dart' as http;

class ScreenPage01 extends StatefulWidget {
  
  @override
  _ScreenPage01State createState() => _ScreenPage01State();

}
Future<ModelPost> submitData(String name,String job) async {
  var response = await http.post(Uri.https('reqres.in', 'api/users'),
      body: {"name" : name, "job":job});
  var data = response.body;
  print(data);

  if(response.statusCode == 201){
    String responseString = response.body;
    modelPostFromJson(response.body);
  }
  else return null!;
  throw Container();
}

class _ScreenPage01State extends State<ScreenPage01> {
  late ModelPost _modelPost;
  TextEditingController _NameTextEditingField = TextEditingController();
  TextEditingController _JobTextEditingField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post-Api-Task'),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              TextField(
                controller: _NameTextEditingField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Name',
                  labelText: 'Name please',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _JobTextEditingField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Job',
                  labelText: 'Job please',
                ),
              ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: () async {

                  final String name = _NameTextEditingField.text;
                  _NameTextEditingField.clear();
                  final String job = _JobTextEditingField.text;
                  _JobTextEditingField.clear();



                  ModelPost data = await submitData(name,job);

                  // setState(() {
                  //   _modelPost = data;
                  // });

                },
                child: Container(
                  height: 40.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.redAccent),
                  child: Center(
                    child: Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ),
              ),
              SizedBox(height: 40.0),

              // post_user == null ? Container() :
              //     Text('User ${post_user.name},${post_user.id} is created at time '
              //         '${post_user.createdAt.toIso8601String()}'),
            ],
          ),
        ),
      ),
    );
  }

}








