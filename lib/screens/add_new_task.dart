import 'package:flutter/material.dart';
class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight/10,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(image: AssetImage(
                      "lib/assets/images/header.jpg"),
                      fit: BoxFit.cover),
              ),
              child: Row(
                 children: [
                   IconButton(onPressed: (){},
                       icon: const Icon(Icons.close,size: 35,color: Colors.indigo,))
                 ],
              ),
            )
          ],
        )
      ),
    );
  }
}
