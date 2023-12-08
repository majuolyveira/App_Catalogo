import 'dart:io';
import 'dart:math';

import 'package:app_catalogo_biblioteca/models/book.dart';
import 'package:app_catalogo_biblioteca/utils/db_book_util.dart';
import 'package:flutter/material.dart';

class GreatBooks with ChangeNotifier {
  List<Book> _items = [];

  Future<void> loadBooks() async {
    final dataList = await DbBookUtil.getData('books');
    _items = dataList
        .map(
          (item) => Book(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Book> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Book itemByIndex(int index) {
    return _items[index];
  }

  void addBook(String title, File image,) {
    final newBook = Book(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      
    );

    _items.add(newBook);
    DbBookUtil.insert('books', {
      'id': newBook.id,
      'title': newBook.title,
      'image': newBook.image.path,
    });
    notifyListeners();
  }
}