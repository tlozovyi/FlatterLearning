import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordsDetails extends StatelessWidget {
  final WordPair wordPair;

  const WordsDetails({this.wordPair}) : assert(wordPair != null);

  @override
  Widget build(BuildContext context) {
    var firstRow = _createRow(wordPair.first, "assets/images/puppy.jpg");
    var secondRow = _createRow(wordPair.second, "assets/images/tree.jpg");

    var mainColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[firstRow, secondRow, Spacer()],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Words details"),
      ),
      body: mainColumn,
    );
  }

  Widget _createRow(String text, String image) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(margin: EdgeInsets.all(16), child: Text(text)),
            Expanded(
              child: Image.asset(image),
            ),
          ],
        )
      )
    );
  }
}

class WordsDetailsPage {
  static void open(BuildContext context, WordPair wordPair) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return WordsDetails(wordPair: wordPair);
    }));
  }
}
