// home_page.dart
import 'package:app_catalogo_biblioteca/screens/book_form_screen.dart';
import 'package:app_catalogo_biblioteca/screens/book_list_screen.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home, color: const Color.fromARGB(255, 54, 98, 244)),
              title: Text("Home"),
              subtitle: Text("Tela Inicial"),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book_outlined, color: const Color.fromARGB(255, 54, 98, 244)),
              title: Text("Catálogo"),
              subtitle: Text("Catálogo de Livros"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksListScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: const Color.fromARGB(255, 54, 98, 244)),
              title: Text("Adicionar"),
              subtitle: Text("Adicionar Novos Livros"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookFormScreen()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da tela inicial'),
      ),
    );
  }
}
