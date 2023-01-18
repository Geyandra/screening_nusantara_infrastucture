import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nusantara_infrastucture_assessment/Model/book_model.dart';
import 'package:provider/provider.dart';

import '../View-Model/books.dart';
import '../Widgets/field_data.dart';

class BookAdd extends StatefulWidget {
  BookAdd({super.key});
  static const nameRoute = 'Add';

  @override
  State<BookAdd> createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
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
              child: Text("Add Books",
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
              hintext: " ",
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
              hintext: " ",
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
              hintext: " ",
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
              hintext: " ",
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
              hintext: " ",
            ),
            FieldData(
              icon: Icons.onetwothree,
              label: "Publisher",
              // controller: pagescontrol,
              // keyboardtype: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("please fill field");
                } else {
                  return null;
                }
              },
              hintext: " ",
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
              hintext: " ",
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
              hintext: " ",
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
              hintext: " ",
            ),
            Container(
              width: 230,
              height: 50,
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<BookViewModel>(context).addBooks(
                        isbn: isbncontrol.text,
                        title: titlecontrol.text,
                        subtitle: subtitlecontrol.text,
                        author: authorcontrol.text,
                        published: DateTime.now(),
                        publisher: publishercontrol.text,
                        pages: int.parse(pagescontrol.text),
                        website: websitecontrol.text,
                        description: descripcontrol.text);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Tambah Data")),
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
