import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(0, 2))
              ],
            ),
            child: ListTile(
              title: Text('Join chat room'),
              hoverColor: Colors.grey,
              onTap: () => Navigator.pushNamed(context, '/chat'),
            ),
          )
        ],
      ),
    );
  }
}
