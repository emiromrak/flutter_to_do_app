import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitledproject/constants/color.dart';
import 'package:untitledproject/constants/header.dart';
import 'package:untitledproject/main.dart';
import 'package:untitledproject/screens/add_new_task.dart';
import 'package:untitledproject/todoitem.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  List<String> todo = ["Study Lessons","Run 5K","Go to Party"];
  List<String> completed = ["Game Meetup","Take Out Trash"];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Header(title: "TO DO LIST"),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: SingleChildScrollView(
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: todo.length,
                            itemBuilder: (context, index) {
                              return  Todoitem(title: todo[index]);
                            })
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: const Text("Completed",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: completed.length,
                        itemBuilder: (context,index){
                          return Todoitem(title: completed[index]);
                        }),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=>const AddNewTaskScreen()),
                );
              }, child: const Text("Add a New Task",style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
