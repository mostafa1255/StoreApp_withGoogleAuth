import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/Flutter Maps , Firebase , Sqflite and APIs in Arabic - #5 Maps Setup.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      body: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPlayPressed,
        child: Icon(_playing ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  _onPlayPressed() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _playing = !_playing;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
