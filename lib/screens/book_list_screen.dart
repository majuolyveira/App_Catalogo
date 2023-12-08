import 'package:app_catalogo_biblioteca/providers/great_books.dart';
import 'package:app_catalogo_biblioteca/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Livros'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.bookForm);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatBooks>(context, listen: false).loadBooks(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatBooks>(
                child: const Center(
                  child: Text('Nenhum livro cadastrado!'),
                ),
                builder: (ctx, greatBooks, ch) => greatBooks.itemsCount == 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatBooks.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatBooks.itemByIndex(i).image,
                            ),
                          ),
                          title: Text(greatBooks.itemByIndex(i).title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}