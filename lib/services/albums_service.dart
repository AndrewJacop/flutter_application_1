import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/album_model.dart';

class AlbumService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String albumsPath = "/albums";
  final dio = Dio();

  Future<List<AlbumModel>> getAllAlbums() async {
    List<AlbumModel> albumsList = [];
    final res = await dio.get("$baseUrl/$albumsPath");
    res.data.forEach((album) => {albumsList.add(AlbumModel.fromJson(album))});
    return albumsList;
  }
}
