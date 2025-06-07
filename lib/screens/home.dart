import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitledproject/constants/color.dart';
import 'package:untitledproject/constants/header.dart';
import 'package:untitledproject/constants/task_type.dart';
import 'package:untitledproject/model/task.dart';
import 'package:untitledproject/screens/add_new_task.dart';
import 'package:untitledproject/todoitem.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addNewTask(Task newTask){
    setState(() {
      todo.add(newTask);
    });

  }
List<Task> todo = [
  Task(
      type: TaskType.note,
      title:"Study Lessons",
      description: "Study COMP1",
      isCompleted: false),
    Task(
        type: TaskType.contest,
        title:"Run 5K",
        description: "Run COMP1",
        isCompleted: false),
    Task(
        type: TaskType.calender,
        title:"Go to Party",
        description: "Party COMP1",
        isCompleted: false)
  ];
  List<Task> completed = [
    Task(
        type: TaskType.calender,
        title:"Game Meetup",
        description: "Meetup",
        isCompleted: true),
    Task(
        type: TaskType.contest,
        title:"Take Out Trash",
        description: "trash",
        isCompleted: true),
  ];
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
                              return  Todoitem(task: todo[index]);
                            })
                    )
                ),
              ),

              const Padding(
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
                          return Todoitem(task: todo[index],);
                        }),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=> AddNewTaskScreen(
                   addNewTask: (newTask)=>addNewTask(newTask),
                 )),
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
