import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Future Builder',
        ),
      ),
      body: corpo(),
    );
  }

  corpo() {
    return Container(
      child: FutureBuilder(
        future: getFutureDados(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple,
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.purple,
                    strokeWidth: 10,
                  ),
                  SizedBox(height: 50),
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.purple,
                    minHeight: 10,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<String> getFutureDados() async =>
      await Future.delayed(Duration(seconds: 10), () => 'Dados recebidos!');
}
