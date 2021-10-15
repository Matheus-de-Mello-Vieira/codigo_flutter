import 'package:flutter/material.dart';

import 'Carrossel.dart';
import 'Descricao.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Carrossel(),
        routes: {
          Descricao.caminho: (_) => Descricao(),
        },
      ),
    );

