import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_app/models/video.dart';
import 'package:youtube_app/widgets/api.dart';


class VideosBloc implements BlocBase{

  Api api;
  List<Video> videos = new   List<Video>();

  final StreamController<List<Video>> _videosController = new StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = new StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc(){

    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {

    videos = await api.search(search);
    _videosController.sink.add(videos);
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videosController.close();
    _searchController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

}