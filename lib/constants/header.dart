import 'package:flutter/material.dart';
class Header extends StatefulWidget {
  const Header({super.key,required this.title});
  final String title;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
          width: deviceWidth,
          height: deviceHeight/5,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              image: DecorationImage(image: AssetImage(
                  "lib/assets/images/header.jpg"),
                  fit: BoxFit.cover)
          ),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("28 Nisan 2025",
                  style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("TO DO LIST",
                  style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ],
          ),

        );

  }
}
