import 'APIClient.dart';
import 'Video.dart';

class DataClient {

  static fetch(String url, void onSuccess(List<Video> videos), void onFailure(String message)) {
      APIClient.execute(url, (Map<String, dynamic> json) {
        final videos = Video.makeModelFrom(json);
        onSuccess(videos);
      }, onFailure); 
  }

}