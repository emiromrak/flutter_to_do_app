import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitledproject/constants/color.dart';
import 'package:untitledproject/constants/task_type.dart';
import 'package:untitledproject/model/task.dart';
class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight/10,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    image: DecorationImage(image: AssetImage(
                        "lib/assets/images/buttonheader.png"),
                        fit: BoxFit.cover),
                ),
                child: Row(
                   children: [
                     IconButton(onPressed: (){
                       Navigator.of(context).pop();
                     },
                         icon: const Icon(Icons.close,size: 30,color: Colors.white54,)),
                     const Expanded(child: Padding(
                       padding: EdgeInsets.only(right: 30.0),
                       child: Text("Add New Task",
                         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                         ,fontSize: 24),
                         textAlign: TextAlign.center,),
                     ))
                   ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: const Text("Task Title",style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                child:
                TextField(
                  controller: titleController,
                  decoration:
                const InputDecoration(filled: true,fillColor: Colors.white),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [const Text("Category"),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 400),
                          content: Text("Category selected."),
                        ),
                      );
                      setState(() {
                        taskType = TaskType.note;
                      });
                    },
                    child: Image.asset("lib/assets/images/Category.png"),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Category selected."),
                          duration: Duration(milliseconds: 400),),
                      );
                      setState(() {
                        taskType = TaskType.calender;
                      });
                    },
                    child: Image.asset("lib/assets/images/Category (1).png"),
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Category selected."),
                          duration: Duration(milliseconds: 400),),
                      );
                      setState(() {
                        taskType = TaskType.contest;
                      });
                    },
                    child: Image.asset("lib/assets/images/Category (2).png"),
                  ),
                ],
              ),

               Padding(
                padding:  const EdgeInsets.only(top: 15.0),
                child:  Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Date"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: dateController,
                              decoration: const InputDecoration(
                                filled: true,fillColor: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                     Expanded(
                      child: Column(
                        children: [
                          const Text("Time"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                                controller: timeController,
                                decoration: const InputDecoration(filled: true,fillColor: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: const Text("Description"),
              ),

             SizedBox(
            height: 220, // Sabit yükseklik veriyoruz
            child:  TextField(
              controller: descriptionController,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
              ),
            ),
          ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                    onPressed: (){
                      Task newTask = Task(type: taskType,
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false);
                      widget.addNewTask(newTask);
                      Navigator.pop(context);
                    }, child: const Text("Save")),
              ),

            ],
          ),
        )
      ),
    );
  }
}
