import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.transparent,
        )
      ]),
      width: 300,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading...',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          Image.network(
              'https://media.giphy.com/media/12MgUpnxEq3ypy/giphy.gif',
              width: 350,
              height: 250,
              fit: BoxFit.cover)
        ],
      ),
    );
  }
}
