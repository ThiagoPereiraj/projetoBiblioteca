import 'livro.dart';
import 'dart:core';

class Cliente {
  String nome;
  Livro emprestimo;
  DateTime dataEmprestimo;
  DateTime dataEntrega;
  String status;
  Cliente(this.nome, this.emprestimo, this.dataEmprestimo, this.dataEntrega,
      this.status);
}
