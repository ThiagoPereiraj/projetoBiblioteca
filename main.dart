
import 'biblioteca.dart';
import 'dart:io';
void main() {
  var instancia=Biblioteca([]);
  int option=0;
  do{
    print("Digite o que deseja fazer:");
    print("1. Adicionar um livro na biblioteca");
    print("2. Remover um livro na biblioteca");
    print("3. Emprestar Livro");
    print("4. Realizar Devolução");
    print("5. Consultar Livros Disponiveis");
    print("6. Consultar Empréstimos");
    print("7. Finalizar Progama");
    option=int.parse(stdin.readLineSync()!);
    switch (option) {
      case 1:
        instancia.addLivros();
        break;
      case 2:
        instancia.removeLivros();
        break;
      case 3:
        instancia.emprestarLivro();
        break;
      case 4:
        instancia.devolverLivro();
        break;
      case 5:
        instancia.livrosDisponiveis();
        break;
      case 6:
        instancia.consultarEmprestimo();
        break;
      case 7:
        print("Finalizando...");
        break;
      default:
        print("Opção inválida");
    }
  }while(option!=7);
}
//https://github.com/marnescassule/bibliotecaPOO        