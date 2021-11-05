import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Aplicativo()));

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário')),
      body: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  FormularioState createState() => FormularioState();
}

class FormularioState extends State<Formulario> {
/* Chave global que identifica o formulário e permite a validação.
* OBS: devemos usar GlobalKey<FormState>,
* não devemos usar GlobalKey<FormularioState>.
*/
  final chaveFormulario = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController menssagemController = TextEditingController();
  late List<FocusNode> focos;
  int contador = 0;
//Método de iniciação:
  @override
  void initState() {
    super.initState();
    focos = List<FocusNode>.generate(5, (_) => FocusNode());
  }

//Método de finalização:
  @override
  void dispose() {
    for (FocusNode foco in this.focos) {
      foco.dispose();
    }
    this.emailController.dispose();
    this.senhaController.dispose();
    this.menssagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Form(
        key: this.chaveFormulario,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampoTexto(
              nome: 'e-mail',
              textoController: this.emailController,
              foco: this.focos[0],
              autoFoco: true,
              validador: (valor) =>
                  valor == null || valor.isEmpty || !valor.contains('@'),
            ),
            CampoTexto(
              nome: 'senha',
              textoController: this.senhaController,
              foco: this.focos[1],
              autoFoco: false,
              validador: (valor) => valor == null || valor.isEmpty,
            ),
            Menssagem(
              nome: 'menssagem',
              textoController: this.menssagemController,
              foco: this.focos[2],
              autoFoco: false,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Próximo'),
                  focusNode: this.focos[3],
                  onPressed: () {
                    this.contador = (++this.contador % this.focos.length);
                    this.focos[contador].requestFocus();
                  },
                ),
                TextButton(
                  child: Text('Enviar'),
                  focusNode: this.focos[4],
                  onPressed: () {
                    if (this.chaveFormulario.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enviando os dados...'),
                          duration: Duration(milliseconds: 987),
                        ),
                      );
                      this.emailController.clear();
                      this.focos[1].requestFocus();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CampoTexto extends StatelessWidget {
  final String nome;
  final TextEditingController textoController;
  final FocusNode foco;
  final bool autoFoco;
  final bool Function(String?) validador;

  CampoTexto({
    required this.nome,
    required this.textoController,
    required this.foco,
    required this.autoFoco,
    required this.validador,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 5,
      ),
      child: TextFormField(
        controller: this.textoController,
        autofocus: this.autoFoco,
        focusNode: this.foco,
        validator: (valor) {
          if (validador(valor)) {
            return '${this.nome} não informado.';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => this.textoController.clear(),
            icon: Icon(Icons.clear),
          ),
          border: OutlineInputBorder(),
          labelText: this.nome,
        ),
      ),
    );
  }
}

class Menssagem extends StatelessWidget {
  final String nome;
  final TextEditingController textoController;
  final FocusNode foco;
  final bool autoFoco;

  Menssagem({
    required this.nome,
    required this.textoController,
    required this.foco,
    required this.autoFoco,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: TextFormField(
        minLines: 7,
        maxLines: 7,
        keyboardType: TextInputType.multiline,
        focusNode: this.foco,
        controller: this.textoController,
        validator: (valor) {
          if (valor == null || valor.isEmpty) {
            return 'informe: mensagem.';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'mensagem',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
