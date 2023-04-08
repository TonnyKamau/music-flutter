class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

    static List <Song> songs = [
    Song(
      title: 'Song 1',
      description: 'Description 1',
      url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      coverUrl: 'assets/images/cover-1.jpg',
    ),
    Song(
      title: 'Song 2',
      description: 'Description 2',
      url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
      coverUrl: 'assets/images/cover-2.jpg',
    ),
    Song(
      title: 'Song 3',
      description: 'Description 3',
      url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
      coverUrl: 'assets/images/cover-3.jpg',
    ),  
  ];
}
