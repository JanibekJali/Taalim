// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/material.dart';

// // class AudioPlayerWidget extends StatefulWidget {
// //   final String audioUrl;

// //   AudioPlayerWidget({required this.audioUrl});

// //   @override
// //   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// // }

// // class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
// //   late AudioPlayer _audioPlayer;
// //   bool isPlaying = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _audioPlayer = AudioPlayer();
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   void _playPauseAudio() async {
// //     if (isPlaying) {
// //       await _audioPlayer.pause();
// //     } else {
// //       // Set the source URL
// //       await _audioPlayer.setSourceUrl(widget.audioUrl);

// //       // Play the audio (this line was commented out before)
// //       await _audioPlayer.resume();
// //     }
// //     setState(() {
// //       isPlaying = !isPlaying;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         IconButton(
// //           icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
// //           onPressed: _playPauseAudio,
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:audioplayers/audioplayers.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AudioPlayerCubit extends Cubit<bool> {
//   final AudioPlayer _audioPlayer;
//   AudioPlayerCubit()
//       : _audioPlayer = AudioPlayer(),
//         super(false) {
//     // Listen for when the audio completes
//     _audioPlayer.onPlayerComplete.listen((event) {
//       stop();
//     });
//   }

//   Future<void> play(String audioUrl) async {
//     await _audioPlayer.setSourceUrl(audioUrl);
//     await _audioPlayer.resume();
//     emit(true); // Set state to 'playing'
//   }

//   Future<void> pause() async {
//     await _audioPlayer.pause();
//     emit(false); // Set state to 'paused'
//   }

//   Future<void> stop() async {
//     await _audioPlayer.stop();
//     emit(false); // Set state to 'stopped'
//   }

//   @override
//   Future<void> close() {
//     _audioPlayer.dispose();
//     return super.close();
//   }
// }

// class AudioPlayerWidget extends StatelessWidget {
//   final String audioUrl;

//   AudioPlayerWidget({required this.audioUrl});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AudioPlayerCubit(),
//       child: BlocBuilder<AudioPlayerCubit, bool>(
//         builder: (context, isPlaying) {
//           return Row(
//             children: [
//               IconButton(
//                 icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//                 onPressed: () {
//                   final audioCubit = context.read<AudioPlayerCubit>();
//                   if (isPlaying) {
//                     audioCubit.pause();
//                   } else {
//                     audioCubit.play(audioUrl);
//                   }
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.stop),
//                 onPressed: () {
//                   final audioCubit = context.read<AudioPlayerCubit>();
//                   audioCubit.stop(); // Completely stop the audio
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
