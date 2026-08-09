import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  double? width;
  Widget child;
   HomeCard({super.key,this.width,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width:width ??100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:Color(0xff456bc9),
      ),
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: child,
          ),
          Text(
            "Pizza",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
