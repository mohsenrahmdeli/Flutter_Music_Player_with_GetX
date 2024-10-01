import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  // final String imageUrl;

  Playlist({required this.title, required this.songs, });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Hip Hop',
      songs: Song.songs,
      // imageUrl: 'https://elements.envato.com/learn/best-royalty-free-music-tracks',
    ),
    Playlist(
      title: 'Rock & Roll',
      songs: Song.songs,
      // imageUrl: 'assets/images/4.jpg',
    ),
    Playlist(
      title: 'Techno',
      songs: Song.songs,
      // imageUrl: 'assets/images/4.jpg',
    ),
  ];
}
