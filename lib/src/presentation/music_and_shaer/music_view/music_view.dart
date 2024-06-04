import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taalim/src/presentation/music_and_shaer/music_view/music_cubit/music_cubit.dart';

class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  late AudioPlayer _audioPlayer;
  String? _currentMusicUrl;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  String? _downloadedMusicPath;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    _initDownloader();

    context.read<MusicCubit>().getMusicDocuments();
  }

  Future<void> _initDownloader() async {
    await FlutterDownloader.initialize(debug: true);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MusicCubit, MusicState>(
          builder: (context, state) {
            if (state is MusicLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MusicInitial) {
              return musicResult(state.musicDocuments);
            } else if (state is MusicError) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return const Center(
                child: Text('No data found'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget musicResult(List<QueryDocumentSnapshot> musicDocs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: ListView.builder(
        itemCount: musicDocs.length,
        itemBuilder: (context, index) {
          final musicDoc = musicDocs[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      musicDoc['musicName'],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () async {
                        await _downloadMusic(musicDoc['musicUrl']);
                      },
                      icon: const Icon(Icons.download),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_currentMusicUrl != musicDoc['musicUrl']) {
                      _currentMusicUrl = musicDoc['musicUrl'];
                      try {
                        if (_downloadedMusicPath != null) {
                          await _audioPlayer
                              .setSourceUrl(_downloadedMusicPath!);
                        } else {
                          await _audioPlayer.setSourceUrl(_currentMusicUrl!);
                        }
                        await _audioPlayer.resume();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error playing audio: $e')),
                        );
                      }
                    } else {
                      await _audioPlayer.resume();
                    }
                  },
                  child: const Text('Play'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _audioPlayer.pause();
                  },
                  child: const Text('Pause'),
                ),
                Text(
                    '${_position.inMinutes}:${_position.inSeconds.remainder(60)}'),
                Slider(
                  value: _position.inMilliseconds.toDouble(),
                  min: 0,
                  max: _duration.inMilliseconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(milliseconds: value.toInt());
                    await _audioPlayer.seek(position);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _downloadMusic(String musicUrl) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${musicUrl.split('/').last}';
    await FlutterDownloader.enqueue(
      url: musicUrl,
      savedDir: directory.path,
      showNotification: true,
      openFileFromNotification: true,
    );
    _downloadedMusicPath = filePath;
  }
}
