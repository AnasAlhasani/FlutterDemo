import 'package:flutter/material.dart';
import 'VideoCell.dart';
import 'DetailsWidget.dart';
import 'Video.dart';
import 'DataClient.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<AppWidget> {
  var _isLoading = false;
  var _videos = List<Video>();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue), 
      home: _scaffold()
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() => _isLoading = true);
              _fetchData();
            },
          )
        ],
      ),
      body: _center()
    );
  }

  Center _center() {
    return Center(
      child: _isLoading ? 
        CircularProgressIndicator(): 
        ListView.builder(
          itemCount: _videos != null ? _videos.length : 0,
          itemBuilder: (context, index) {
          final video = _videos[index];
          return FlatButton(
            padding: EdgeInsets.all(0.0),
            child: VideoCell(video: video),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                builder: (context) => DetailsWidget()
              ));
            },
          );
          },
        ),
    );
  }

  _fetchData() {
    DataClient.fetch(
      "http://api.letsbuildthatapp.com/youtube/home_feed",
      (List<Video> videos) {
        setState(() => _isLoading = false);
        this._videos = videos;
    }, (String message) {
      setState(() => _isLoading = false);
      print(message);
    });
  }

}
