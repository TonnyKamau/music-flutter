import 'songsmodel.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });
  static List<Playlist> playlists = [
    Playlist(
      title: 'Rock',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist-1.jpg',
    ),
    Playlist(
      title: 'Pop',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist-2.jpg',
    ),
    Playlist(
      title: 'Hip Hop',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist-3.jpg',
    ),
    Playlist(
      title: 'R&B',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist-4.jpg',
    ),
    Playlist(
      title: 'Jazz',
      songs: Song.songs,
      imageUrl: 'assets/images/playlist-5.jpg',
    ),
  ];
}
