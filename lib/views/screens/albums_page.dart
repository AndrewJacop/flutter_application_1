import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/album_model.dart';
import 'package:flutter_application_1/services/albums_service.dart';
import 'package:flutter_application_1/views/screens/album_details_page.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  List<AlbumModel> albumsList = [];
  final albumService = AlbumService();
  bool isLoading = true;

  getData() async {
    albumsList = await albumService.getAllAlbums();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: albumsList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black12,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return AlbumCard(albumsList[index]);
              },
            ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final AlbumModel album;
  const AlbumCard(
    this.album, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.album),
      title: Text(album.title),
      trailing: TextButton(
        child: const Text("More.."),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumDetailsScreen(album)));
        },
      ),
    );
  }
}
