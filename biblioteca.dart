import 'livro.dart';
import 'cliente.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class Biblioteca {
  List<Livro> livros = [];
  List<Cliente> emprestimo = [];
  Biblioteca(this.livros);

  void addListaLivros() {
    livros.add(Livro("1984", "George Orwell"));
    livros.add(Livro("Dom Quixote", "Miguel de Cervantes"));
    livros.add(Livro("O Grande Gatsby", "F. Scott Fitzgerald"));
    livros.add(Livro("Cem Anos de Solidão", "Gabriel García Márquez"));
    livros.add(Livro("Orgulho e Preconceito", "Jane Austen"));
    livros.add(Livro("O Senhor dos Anéis", "J.R.R. Tolkien"));
    livros.add(Livro("Harry Potter e a Pedra Filosofal", "J.K. Rowling"));
  }

  void addLivros() {
    String titulo, autor;
    print("Digite o titulo do livro:");
    titulo = (stdin.readLineSync()!);
    print("Digite o autor do livro");
    autor = (stdin.readLineSync()!);
    livros.add(Livro(titulo, autor));
    print("Livro adicionado com sucesso!\n");
  }

  void removeLivros() {
    int index = 0, aux = 0, op = 0;
    if (livros.length < 1) {
      print("\nNão existem livros Disponiveis\n");
      return;
    }
    livrosDisponiveis();
    do {
      print("\nDigite o numero correspondente do livro que deseja Remover:");
      index = int.parse(stdin.readLineSync()!);
      if (index > livros.length || index < livros.length) {
        print("\nIndice invalido!");
      }
    } while (index > livros.length || index < livros.length);

    for (var livro in livros) {
      if (aux == index - 1) {
        print("\nTem certeza?");
        print(
            'O livro selecionado foi: titulo: ${livro.titulo}, autor: ${livro.autor}');
      }
      aux++;
    }
    print("1. Sim 2. Não");
    op = int.parse(stdin.readLineSync()!);
    if (op == 1) {
      livros.removeAt(index - 1);
      print("\nRemoção Concluída!");
    }
  }

  void emprestarLivro() {
    int index = 1, aux = 0, op = 0;
    if (livros.length < 1) {
      print("\nNão existem livros Disponiveis\n");
      return;
    }
    livrosDisponiveis();
    do {
      print("\nDigite o numero correspondente do livro que deseja Emprestar:");

      index = int.parse(stdin.readLineSync()!);
      if (index > livros.length || index < 1) {
        print("\nIndice invalido!");
      }
    } while (index > livros.length || index < 1);

    for (var livro in livros) {
      if (aux == index - 1) {
        print("\nTem certeza?");
        print(
            'O livro selecionado foi: Título: ${livro.titulo}\nAutor: ${livro.autor}');
      }
      aux++;
    }
    print("1. Sim 2. Não");
    op = int.parse(stdin.readLineSync()!);
    if (op == 1) {
      String name;
      print("\nDigite o nome do cliente:");
      name = (stdin.readLineSync()!);
      emprestimo.add(Cliente(
          name,
          livros.removeAt(index - 1),
          DateTime.now(),
          DateTime.now().add(Duration(minutes: 1)),
          this.status(
              DateTime.now(), DateTime.now().add(Duration(minutes: 1)))));
      print("\nEmpréstimo Concluido!");
    }
  }

  void devolverLivro() {
    int index = 1, aux = 0, op = 0;

    if (emprestimo.length < 1) {
      print("\nNão existem livros emprestados\n");
      return;
    }

    for (var livro in emprestimo) {
      print("${index}.Cliente: ${livro.nome}");
      String format =
          DateFormat('dd/MM/yyyy HH:mm:ss').format(livro.dataEmprestimo);
      print("Data Emprestimo: ${format}");
      print(
          'Título: ${livro.emprestimo.titulo}\nAutor: ${livro.emprestimo.autor}');
      String format2 =
          DateFormat('dd/MM/yyyy HH:mm:ss').format(livro.dataEntrega);
      print("Data Entrega: ${format2}");
      print(
          "Data atual: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())}");
      livro.status = this.status(DateTime.now(), livro.dataEntrega);
      print("Status: ${livro.status}\n\n");
      index++;
    }

    do {
      print(
          "\nDigite o numero correspondente do Cliente que deseja realizar a devolução\n");
      index = int.parse(stdin.readLineSync()!);
      if (index > emprestimo.length || index < emprestimo.length) {
        print("\nIndice invalido!");
      }
    } while (index > emprestimo.length || index < emprestimo.length);
    Livro temp = Livro('', '');
    for (var livro in emprestimo) {
      if (aux == index - 1) {
        print("\nTem certeza?");
        print(
            'O livro selecionado foi: \nTitulo: ${livro.emprestimo.titulo}\nAutor: ${livro.emprestimo.autor}');
        temp = Livro(livro.emprestimo.titulo, livro.emprestimo.autor);
      }
      aux++;
    }
    print("1. Sim 2. Não");
    op = int.parse(stdin.readLineSync()!);
    if (op == 1) {
      livros.add(temp);
      emprestimo.removeAt(index - 1);
      print("Devolução Concluida!");
    }
  }

  void livrosDisponiveis() {
    int index = 1;
    print("\n");
    print("Livros Dispiniveis:\n");
    for (var livro in livros) {
      print('${index}. Titulo: ${livro.titulo}\nAutor: ${livro.autor}');
      print("\n");

      index++;
    }
    if (livros.length < 1) {
      print("\nNão existem livros disponiveis");
    }
    print("\n");
  }

  void consultarEmprestimo() {
    print("\n");
    if (emprestimo.length < 1) {
      print("\nNão existem livros emprestados\n");
      return;
    }
    for (var livro in emprestimo) {
      print("Cliente: ${livro.nome}");
      String format =
          DateFormat('dd/MM/yyyy HH:mm:ss').format(livro.dataEmprestimo);
      print("Data Emprestimo: ${format}");
      print(
          'Titulo: ${livro.emprestimo.titulo}\nAutor: ${livro.emprestimo.autor}');
      String format2 =
          DateFormat('dd/MM/yyyy HH:mm:ss').format(livro.dataEntrega);
      print("Data Entrega: ${format2}");
      print(
          "Data atual: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())}");
      livro.status = this.status(DateTime.now(), livro.dataEntrega);
      print("Status: ${livro.status}\n\n");
    }
  }

  String status(DateTime now, DateTime entreg) {
    Duration diferenca = entreg.difference(now);
    if (diferenca.inSeconds < 0) {
      return "Atrazado";
    } else {
      return "Dentro do Prazo";
    }
  }
}
