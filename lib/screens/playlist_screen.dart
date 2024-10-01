import 'package:flutter/material.dart';
import '../models/playlist_model.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Playlist playlists = Playlist.playlists[0];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Play List'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _PlayListInformation(playlists: playlists),
                const SizedBox(
                  height: 30,
                ),
                const _PlayOrShuffleSwitch(),
                _PlayListSong(playlists: playlists),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayListSong extends StatelessWidget {
  const _PlayListSong({
    required this.playlists,
  });

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: playlists.songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index + 1}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold
            ),
            ),
            title: Text(playlists.songs[index].title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold
            ),
            ),
            subtitle: Text('${playlists.songs[index].description} 02:45',
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          );
        });
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {
  const _PlayOrShuffleSwitch();

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: isPlay ? 0 : MediaQuery.of(context).size.width * 0.45,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                              fontSize: 17,
                              color: isPlay ? Colors.white : Colors.deepPurple),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.deepPurple,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Shuffle',
                          style: TextStyle(
                              fontSize: 17,
                              color: isPlay ? Colors.deepPurple : Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.deepPurple : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayListInformation extends StatelessWidget {
  const _PlayListInformation({
    required this.playlists,
  });

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            'assets/images/4.jpg',
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          playlists.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
