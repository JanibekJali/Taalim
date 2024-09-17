import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/widgets/audio/cubit/audio_player_cubit.dart';
import 'package:taalim/src/core/ui/widgets/audio/cubit/audio_player_state.dart';

class AudioPlayerWidget extends StatelessWidget {
  final String audioUrl;

  const AudioPlayerWidget({super.key, required this.audioUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioPlayerCubit(),
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, state) {
          bool isPlaying = state is AudioPlayerPlaying;
          return Row(
            children: [
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: AppColors.blue,
                  size: 30,
                ),
                onPressed: () {
                  final audioCubit = context.read<AudioPlayerCubit>();
                  if (isPlaying) {
                    audioCubit.pause();
                  } else {
                    audioCubit.play(audioUrl);
                  }
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.stop,
                  color: AppColors.blue,
                  size: 30,
                ),
                onPressed: () {
                  final audioCubit = context.read<AudioPlayerCubit>();
                  audioCubit.stop(); // Completely stop the audio
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
