import 'package:flutter/material.dart';

class CustomDrawerTag extends StatelessWidget {
  const CustomDrawerTag({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 80,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 30,
                width: 30,
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
