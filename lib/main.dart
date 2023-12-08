import 'package:app_catalogo_biblioteca/providers/great_books.dart';
import 'package:app_catalogo_biblioteca/screens/book_form_screen.dart';
import 'package:app_catalogo_biblioteca/screens/home_page.dart';
import 'package:app_catalogo_biblioteca/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatBooks(),
      child: MaterialApp(
        title: 'Great Books',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          AppRoutes.bookForm: (ctx) => const BookFormScreen(),
        },
      ),
    );
  }
}