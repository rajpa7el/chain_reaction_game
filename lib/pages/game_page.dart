import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Game Page"),
      // ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 300.0,
              width: 300.0,
              color: Colors.blue[900],
              //         decoration: BoxDecoration(
              //             color: Colors.amber[200],
              //             borderRadius: BorderRadius.circular(50)),
              //         padding: EdgeInsets.all(50),
              child: Center(
                child: ElevatedButton(
                  child: const Text("gamepage logic"),
                  onPressed: () {
                    //navigate to game page
                    Navigator.pushNamed(context, '/homepage');
                  },
                ),
              )),
        ],
      )),
    );
  }
}
