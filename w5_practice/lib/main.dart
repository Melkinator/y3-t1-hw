import 'package:flutter/material.dart';

void main() {
  // EX1
  // runApp(
  //   const MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: Text("Hello World", style: TextStyle(color: Colors.orange, fontSize: 50)),
  //       ),
  //     ),
  //   ),
  // );

  // ex2
  // runApp(
  //   MaterialApp(
  //     home: Container(
  //       padding: EdgeInsets.all(40),
  //       margin: EdgeInsets.all(50),
  //       color: Colors.blue[300],
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           color: Colors.blue[600]
  //         ),
  //         child: Center(
  //           child: Text("studnets", style: TextStyle(fontSize: 20, color: Colors.white)),
  //         ),
  //       ),
  //     ),
  //   ),
  // );

  // ex3
  // runApp(
  //   MaterialApp(
  //     home: Container(
  //       color: Colors.grey,
  //       padding: EdgeInsets.all(40),
  //       child: Column(
  //         children: [
  //           Container(
  //             margin: EdgeInsets.only(bottom: 20),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.blue[100],
  //             ),
  //             child: Center(
  //               child: Text("OOP", style: TextStyle(fontSize: 20, color: Colors.white)),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(bottom: 20),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.blue[300]
  //             ),
  //             child: Center(
  //               child: Text("Dart", style: TextStyle(fontSize: 20, color: Colors.white)),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(bottom: 20),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.blue[600]
  //             ),
  //             child: Center(
  //               child: Text("Flutter", style: TextStyle(fontSize: 20, color: Colors.white)),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );

  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.white
          ),

          Container(
            height: 400,
            color: Colors.blue,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue[500]
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Container(
                          color: Colors.blue[200]
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.green
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Container(
                          color: Colors.pink
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.orange
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.orange
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Expanded(child: Container(color: Colors.pink)),
        ],
      ),
    ),
  ));
}
