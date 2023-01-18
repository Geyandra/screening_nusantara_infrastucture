import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../View-Model/books.dart';
import '../Widgets/field_data.dart';

class BooksData extends StatefulWidget {
  BooksData({super.key});
  static const nameRoute = 'Add';

  @override
  State<BooksData> createState() => _BooksDataState();
}

class _BooksDataState extends State<BooksData> {
  final isbncontrol = TextEditingController();
  final titlecontrol = TextEditingController();
  final subtitlecontrol = TextEditingController();
  final authorcontrol = TextEditingController();
  final publishercontrol = TextEditingController();
  final pagescontrol = TextEditingController();
  final websitecontrol = TextEditingController();
  final descripcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<BookViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Books Data"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 40),
              child: Text("Edit/Delete Books",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            FieldData(
              icon: Icons.abc,
              label: "ISBN",
              controller: isbncontrol,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.isbn}' : " ",
            ),
            FieldData(
              icon: Icons.menu_book,
              label: "Title",
              controller: titlecontrol,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.title}' : " ",
            ),
            FieldData(
              icon: Icons.menu_book,
              label: "Subtitle",
              controller: subtitlecontrol,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.subtitle}' : " ",
            ),
            FieldData(
              icon: Icons.contact_page_sharp,
              label: "Author",
              controller: authorcontrol,
              keyboardtype: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.author}' : " ",
            ),
            FieldData(
              icon: Icons.home_work,
              label: "Publisher",
              controller: publishercontrol,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.publisher}' : " ",
            ),
            FieldData(
              icon: Icons.date_range,
              label: "Published",
              // controller: pagescontrol,
              // keyboardtype: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.published}' : " ",
            ),
            FieldData(
              icon: Icons.onetwothree,
              label: "Pages",
              controller: pagescontrol,
              keyboardtype: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.pages}' : " ",
            ),
            FieldData(
              icon: Icons.web,
              label: "Website",
              controller: websitecontrol,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.website}' : " ",
            ),
            FieldData(
              icon: Icons.list_alt_sharp,
              label: "Description",
              controller: descripcontrol,
              maxlines: 3,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: detail != null ? '${detail.books!.description}' : " ",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        Provider.of<BookViewModel>(context).editBooks(
                            isbn: isbncontrol.text,
                            title: titlecontrol.text,
                            subtitle: subtitlecontrol.text,
                            author: authorcontrol.text,
                            published: DateTime.now(),
                            publisher: publishercontrol.text,
                            pages: int.parse(pagescontrol.text),
                            website: websitecontrol.text,
                            description: descripcontrol.text,
                            id: '${detail.books!.id}');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade200),
                      child: Text("Edit")),
                ),
                Container(
                  width: 100,
                  height: 50,
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        Provider.of<BookViewModel>(context)
                            .deleteBooks(id: "${detail.books!.id}");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade200),
                      child: Text("Delete")),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
