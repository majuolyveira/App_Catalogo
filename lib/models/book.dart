import 'dart:io';

class Book {
  final String id;
  final String title;
  final File image;

  Book({
    required this.id,
    required this.title,
    required this.image,
  });
}
