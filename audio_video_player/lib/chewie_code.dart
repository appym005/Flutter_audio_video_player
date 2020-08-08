import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget
{

  final VideoPlayerController videoPlayerController;
  final bool looping;
  final String source;

  ChewieListItem({
    @required this.videoPlayerController,
    @required this.source,
    this.looping,
    Key key,
  }) : super(key : key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem>
{
  ChewieController _chewieController;

  @override
  void initState()
  {
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16/9,
        autoInitialize: true,
        looping: widget.looping,
        errorBuilder: (context, errorMessage)
        {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(18),
            child: Text("Source: " + widget.source, style: TextStyle(color: Colors.white),),
          ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ]),
    );
  }

  /*@override
  void dispose()
  {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }*/

}

