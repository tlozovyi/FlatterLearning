import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WordsDetails extends StatefulWidget {
  final WordPair wordPair;

  WordsDetails(this.wordPair) : assert(wordPair != null);

  @override
  State<StatefulWidget> createState() {
    return WordDetailsState(wordPair);
  }
}

class WordDetailsState extends State<WordsDetails> {
  final WordPair wordPair;
  var _firstWordUrl = '';
  var _secondWordUrl = '';

  WordDetailsState(this.wordPair) : assert(wordPair != null);

  @override
  Widget build(BuildContext context) {
    var firstRow = _createRow(wordPair.first, _firstWordUrl);
    var secondRow = _createRow(wordPair.second, _secondWordUrl);
    
    if (_firstWordUrl.isEmpty) {
      getImageUrlForWord(wordPair.first).then((url) {
        print("Loaded first word URL: " + url);
        setState(() {
          _firstWordUrl = url;
        });
      });
    } else if (_secondWordUrl.isEmpty) {
      getImageUrlForWord(wordPair.second).then((url) {
        print("Loaded second word URL: " + url);
        setState(() {
          _secondWordUrl = url;
        });
      });
    }
  
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

  Widget _createRow(String text, String webImageUrl) {
    print("creating row, url is: " + webImageUrl);
    
    var widgetToShow;
    if (webImageUrl.isEmpty ) {
      widgetToShow = Icon(Icons.timelapse);
    } else {
      widgetToShow = new CachedNetworkImage(
        imageUrl: webImageUrl,
        placeholder: (context, url) => Icon(Icons.timelapse),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      );
    }

    var row = Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16), child: Text(text)),
            Expanded(
              child: widgetToShow,
            ),
          ],
        )
      )
    );
  
    return row;
  }

  Future<Object> getImageUrlForWord(String word) async {
    var url = "https://pixabay.com/api/?key=13910625-feb4345918917b4a7648f5f30&q=" + word + "&image_type=photo";
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    var result = jsonResponse['hits'][0]['webformatURL'];
    return result as String;
  }
  
}

class WordsDetailsPage {
  static void open(BuildContext context, WordPair wordPair) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return WordsDetails(wordPair);
    }));
  }
}
