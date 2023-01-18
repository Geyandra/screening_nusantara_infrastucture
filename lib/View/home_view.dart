import 'package:flutter/material.dart';
import 'package:nusantara_infrastucture_assessment/View-Model/books.dart';
import 'package:nusantara_infrastucture_assessment/View/book_add.dart';
import 'package:nusantara_infrastucture_assessment/View/book_details.dart';
import 'package:nusantara_infrastucture_assessment/View/databook.dart';
import 'package:nusantara_infrastucture_assessment/Widgets/transition_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookprovider = Provider.of<BookViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Books Documentation"),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            navPushTransition(context, BookAdd());
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 8),
            child: Image.asset(
              "assets/Images/book_add.png",
              height: 50,
            ),
          ),
        ),
        body: FutureBuilder(
          future: bookprovider.getAllBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: bookprovider.getbooks.length,
              itemBuilder: (context, index) => Card(
                  color: Colors.blue.shade50,
                  child: ListTile(
                    onLongPress: () {
                      final books = bookprovider.getbooks.elementAt(index);
                      context.read<BookViewModel>().selectedBook(books);
                      navPushTransition(context, BooksData());
                    },
                    onTap: () {
                      final books = bookprovider.getbooks.elementAt(index);
                      context.read<BookViewModel>().selectedBook(books);
                      navPushTransition(context, BookDetail());
                    },
                    leading: Image.asset(
                      "assets/Images/open_book.png",
                      height: 60,
                    ),
                    title: Text(
                      "${bookprovider.getbooks[index].title}",
                      textAlign: TextAlign.justify,
                    ),
                    subtitle: Text(
                      "${bookprovider.getbooks[index].subtitle}",
                      textAlign: TextAlign.justify,
                    ),
                  )),
            );
          },
        ));
  }
}
