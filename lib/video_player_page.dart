import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({this.url, Key key}) : super(key: key);

  final String url;

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {

  VideoPlayerController _videoPlayerController;

  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoPlayerController.value.initialized ? 
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Stack(
            children: <Widget>[
              VideoPlayer(
                _videoPlayerController
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow
                  ),
                  onTap: () {
                    if(_isPlaying) {
                      _videoPlayerController.pause();
                    } else {
                      _videoPlayerController.play();
                    }
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
              ),
            ],
          ),
        )
        : Container(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.play_arrow),
      //   onPressed: () {
      //     _videoPlayerController.play();
      //   },
      // ),
    );
  }
}