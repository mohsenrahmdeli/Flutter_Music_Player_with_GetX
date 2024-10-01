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

  static List<Song> songs = [
    Song(
      title: 'Baroone Lanati',
      description: 'Baroone Lanati',
      url: 'assets/music/Baroone Lanati.mp3',
      coverUrl: 'assets/images/1.jpg',
    ),
    Song(
      title: 'Esmet Chie',
      description: 'Esmet Chie',
      url: 'assets/music/Esmet Chie.mp3',
      coverUrl: 'assets/images/2.jpg',
    ),
    Song(
      title: 'Labod',
      description: 'Labod',
      url: 'assets/music/Labod.mp3',
      coverUrl: 'assets/images/3.jpg',
    ),
  ];
}
