
class Video {

  final String name;

  final String imageURL;


  Video({this.name, this.imageURL});


  static List<Video> makeModelFrom(Map<String, dynamic> json) {
    var jsonArray = json["videos"];

    List<Video> videos = List<Video>();

    jsonArray.forEach((item) {
      final String name = item["name"];
      final String imageURL = item["imageUrl"];
      final video = Video(name: name, imageURL: imageURL);
      videos.add(video);
    });

    return videos;
  }

}