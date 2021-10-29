import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      drawer: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            Container(
              height: 230,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text("Ana"),
                accountEmail: Text("ana@ana.com.br"),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("A",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.red,
                        ))),
              ),
            ),
            Container(
              height: 130,
              child: ListTile(
                leading: Icon(Icons.video_collection),
                title: Text("Rota 02"),
                subtitle: Text("Siga para a Rota 02."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RotaGenerica.caminhoDaRota,
                    arguments: ArgumentosDaRota("Segunda rota", Colors.black),
                  );
                },
              ),
            ),
            Container(
              height: 130,
              child: ListTile(
                leading: Icon(Icons.analytics),
                title: Text("Rota 03"),
                subtitle: Text("Siga para a Rota 03"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RotaGenerica.caminhoDaRota,
                    arguments: ArgumentosDaRota(
                        "Terceira rota", Colors.purple.shade900),
                  );
                },
              ),
            ),
            Container(
              height: 130,
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Rota 01"),
                subtitle: Text("Voltar para a Rota 01"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print('Voltar para a Rota 01.');
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';
  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.texto),
      ),
      body: Container(
        decoration: BoxDecoration(color: argumentos.color),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                argumentos.texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Voltar para Primeira Rota"))
            ],
          ),
        ),
      ),
    );
  }
}

class ArgumentosDaRota {
  String texto;
  Color color;

  ArgumentosDaRota(this.texto, this.color);
}
