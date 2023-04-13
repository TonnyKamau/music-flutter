import 'package:flutter/material.dart';

import '../model/playlistmodel.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Playlist playlists = Playlist.playlists[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'PlayList',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _PlaylistInfo(playlists: playlists),
              const SizedBox(
                height: 20,
              ),
              const _PlayOrShuffle(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: playlists.songs.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        '${index + 1}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      title: Text(
                        playlists.songs[index].title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Text(playlists.songs[index].description),
                      trailing: const Icon(Icons.more_vert),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayOrShuffle extends StatefulWidget {
  const _PlayOrShuffle({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayOrShuffle> createState() => _PlayOrShuffleState();
}

class _PlayOrShuffleState extends State<_PlayOrShuffle> {
  bool isPlaying = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Container(
        height: 50.0,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: isPlaying ? 0 : width * 0.45,
              child: Container(
                height: 50.0,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.circular(15.0),
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
                          'play',
                          style: TextStyle(
                            color: isPlaying ? Colors.black : Colors.deepPurple,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: isPlaying ? Colors.black : Colors.deepPurple,
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
                          'shuffle',
                          style: TextStyle(
                            color: isPlaying ? Colors.deepPurple : Colors.black,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shuffle,
                        color: isPlaying ? Colors.deepPurple : Colors.black,
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

class _PlaylistInfo extends StatelessWidget {
  const _PlaylistInfo({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            playlists.imageUrl,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          playlists.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
