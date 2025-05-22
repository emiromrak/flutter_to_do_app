import 'package:flutter/material.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key,required this.title});
  final String title;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.notes,size: 40,),
            Text(widget.title,style:
            const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Checkbox(value: isChecked, onChanged: (val) => {
              setState(() {
                isChecked=val!; // ! sadece val degiskeni varsa bu satırı isleme sok demek
              })
            })
          ],
        ),
      ),
    );
  }
}
