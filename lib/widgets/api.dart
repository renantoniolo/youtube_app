import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_app/models/video.dart';

const API_KEY = "AIzaSyAIHlInRKpmCFY02_fVQT51DOD8L7KQhww";

class Api{

  search(String search) async{

    http.Response response =  await http.get(
      "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
    );

    return decode(response);
  }

  List<Video> decode(http.Response response ){

    List<Video> videos = List<Video>();

    if(response.statusCode == 200){ // ok

      var decoded = json.decode(response.body);

      videos = decoded["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();

      return videos;

    }
    else { // erro
      return videos;
    }

  }

}


/*

"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=AIzaSyAIHlInRKpmCFY02_fVQT51DOD8L7KQhww&maxResults=10"
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"

*/