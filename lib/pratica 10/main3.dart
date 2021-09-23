import 'package:flutter/material.dart';

main() => runApp(IMC());

class IMC extends StatefulWidget {
  @override
  _IMCState createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  String _texto = "Insert that values and click 'calculate'";

  @override
  Widget build(BuildContext context) {
    TextEditingController lengthController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController widthController = TextEditingController();

    calculateIMC() {
      double lenght = double.parse(lengthController.text);
      double height = double.parse(heightController.text);
      double width = double.parse(widthController.text);
      double volume = lenght * height * width;

      setState(() {
        _texto = "Volume = ${volume.toStringAsFixed(2)}\n";
      });

      print(_texto);
    }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Volume calculator!")),
            body: Container(
                child: Column(children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: lengthController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => lengthController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Insert the lenght',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => heightController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Insert the height',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: widthController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => widthController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Insert the width',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: calculateIMC,
                  child: Text('calculate volume!',
                      style: TextStyle(
                        fontSize: 20,
                      ))),
              Text(
                _texto,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )
            ]))));
  }
}
