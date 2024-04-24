import 'package:flutter/material.dart';
import 'package:movieapp/core/resources/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWideget extends StatefulWidget {
  const VideoPlayerWideget({
    Key? key,
    required this.videoId,
    required this.movieTitle,
  }) : super(key: key);
  final String? videoId;
  final String movieTitle;

  @override
  State<VideoPlayerWideget> createState() => _VideoPlayerWidegetState();
}

class _VideoPlayerWidegetState extends State<VideoPlayerWideget> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 80.0),
            child: Center(
              child: Text(
                widget.movieTitle,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: AppColors.black,
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  onEnded: (data) {
                    Navigator.of(context).pop();
                  },
                ),
                builder: (_, player) {
                  return player;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
