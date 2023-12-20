import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/core/resources/app_colors.dart';
import 'package:movieapp/widgets/app_bar/custom_app_bar.dart';
import 'package:movieapp/widgets/custom_elevated_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWideget extends StatefulWidget {
  const VideoPlayerWideget({Key? key, required this.videoId}) : super(key: key);
  final String? videoId;

  @override
  State<VideoPlayerWideget> createState() => _VideoPlayerWidegetState();
}

class _VideoPlayerWidegetState extends State<VideoPlayerWideget> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  //double _volume = 100;
  //bool _muted = false;
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

    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
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
    return YoutubePlayerBuilder(
        onEnterFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColors.black,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.settings,
            //     color: Colors.white,
            //     size: 25.0,
            //   ),
            //   onPressed: () {
            //     Logger.log('Settings Tapped!');
            //   },
            // ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            Navigator.of(context).pop();
          },
        ),
        builder: (_, player) {
          return Scaffold(
            appBar: CustomAppBar(
              title: Text('Watch Trailer'),
            ),
            body: Stack(
              children: [
                player,
                CustomElevatedButton(
                  text: "Done",
                  onPressed: () {
                    Logger.log("PlayerState: ${_playerState.toString()}}");
                    Logger.log("PlayerState: ${_videoMetaData.toString()}}");
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }
}
