import 'package:flutter/material.dart';
import 'package:untitledproject/constants/task_type.dart';
import 'package:untitledproject/model/task.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key,required this.task});
  final Task task;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note ? Image.asset("lib/assets/images/Category.png")
            :widget.task.type == TaskType.contest ? Image.asset("lib/assets/images/Category (2).png")
            :Image.asset("lib/assets/images/Category (1).png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,style:
                   TextStyle(
                      decoration: widget.task.isCompleted ? TextDecoration.lineThrough:TextDecoration.none,
                      fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(widget.task.description,style: TextStyle(
                    decoration: widget.task.isCompleted ? TextDecoration.lineThrough:TextDecoration.none,
                  ),),
                ],
              ),
            ),

            Checkbox(value: isChecked, onChanged: (val) => {
              setState(() {
                widget.task.isCompleted = !widget.task.isCompleted;
                isChecked=val!; // ! sadece val degiskeni varsa bu satırı isleme sok demek
              })
            })
          ],
        ),
      ),
    );
  }
}
