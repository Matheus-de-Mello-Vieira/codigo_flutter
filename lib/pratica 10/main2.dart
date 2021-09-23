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
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    calculateIMC() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = weight / height / height;

      setState(() {
        _texto = "IMC = ${imc.toStringAsFixed(2)}\n";

        if (imc < 16) {
          _texto += "Severe thinness";
        } else if (imc < 17) {
          _texto += "Moderate thinness";
        } else if (imc < 18.5) {
          _texto += "Light thinness";
        } else if (imc < 25) {
          _texto += "Healthy";
        } else if (imc < 30) {
          _texto += "Overweight";
        } else if (imc < 35) {
          _texto += "Grade I obesity";
        } else if (imc < 40) {
          _texto += "Grade II obesity (Severe)";
        } else {
          _texto += "Grade III obesity (Morbid)";
        }
      });

      print(_texto);
    }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("IMC calculator!")),
            body: Container(
                child: Column(children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => weightController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Insert the weight',
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
              ElevatedButton(
                  onPressed: calculateIMC,
                  child: Text('calculate IMC!',
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
