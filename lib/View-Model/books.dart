import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nusantara_infrastucture_assessment/Model/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookViewModel with ChangeNotifier {
  final dio = Dio();
  String url = "https://basic-book-crud-e3u54evafq-et.a.run.app";
  List<BooksModel> _booksModel = [];
  BooksModel? _bookModel;
  List<BooksModel> get getbooks => _booksModel;
  BooksModel? get books => _bookModel;

  Future<void> getAllBooks() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String? token = pref.getString("token");
      var res = await dio.get("$url/api/books",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (res.statusCode == 200) {
        final List book = res.data["data"];
        print("here");
        _booksModel = book.map((e) => BooksModel.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
    notifyListeners();
  }

  selectedBook(newbook) {
    _bookModel = newbook;
    notifyListeners();
  }

  Future<void> addBooks({
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required DateTime published,
    required String publisher,
    required int pages,
    required String website,
    required String description,
  }) async {
    print("Add");
    final res = await dio.post("$url/api/books/add", data: {
      "isbn": isbn,
      "title": title,
      "subtitle": subtitle,
      "author": author,
      "published": published,
      "publisher": publisher,
      "pages": pages.toString(),
      "website": website,
      "description": description,
    });
    print(res.statusCode);
    notifyListeners();
  }

  Future<void> editBooks({
    required String id,
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required DateTime published,
    required String publisher,
    required int pages,
    required String website,
    required String description,
  }) async {
    print("Edit");
    final res = await dio.put("$url/api/books/$id/edit", data: {
      "isbn": isbn,
      "title": title,
      "subtitle": subtitle,
      "author": author,
      "published": published,
      "publisher": publisher,
      "pages": pages.toString(),
      "website": website,
      "description": description,
    });
    print(res.statusCode);

    notifyListeners();
  }

  Future<void> deleteBooks({required String id}) async {
    final res = await dio.delete("$url/api/books/$id");
    print(res.statusCode);

    notifyListeners();
  }
}
