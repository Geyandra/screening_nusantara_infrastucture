import 'package:flutter/material.dart';
import 'package:nusantara_infrastucture_assessment/View-Model/books.dart';
import 'package:nusantara_infrastucture_assessment/View/home_view.dart';
import 'package:nusantara_infrastucture_assessment/Widgets/transition_page.dart';
import 'package:provider/provider.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<BookViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("${detail.books!.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/Images/open_book.png",
              height: 70,
            ),
            SizedBox(
              height: 40,
            ),
            DoubleBox(
              textone: 'ISBN',
              texttwo: '${detail.books!.isbn}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Title',
              texttwo: '${detail.books!.title}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Subtitle',
              texttwo: '${detail.books!.subtitle}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Author',
              texttwo: '${detail.books!.author}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Publisher',
              texttwo: '${detail.books!.publisher}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Published',
              texttwo: '${detail.books!.published}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Page',
              texttwo: '${detail.books!.pages}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Website',
              texttwo: '${detail.books!.website}',
            ),
            SizedBox(
              height: 10,
            ),
            DoubleBox(
              textone: 'Description',
              texttwo: '${detail.books!.description}',
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {
                  navReplaceTransition(context, HomePage());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class DoubleBox extends StatelessWidget {
  String textone;
  String texttwo;
  double? height;
  DoubleBox({
    required this.textone,
    required this.texttwo,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 110,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue, width: 2)),
          child: Text(
            textone,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: height,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue, width: 2)),
          child: Text(
            texttwo,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
