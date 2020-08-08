import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MPlayer extends StatefulWidget
{

  final assetsAudioPlayer;
  final source;
  final src;

  MPlayer({
    @required this.assetsAudioPlayer,
    @required this.source,
    @required this.src,
    Key key
  }) : super(key:key);

  @override
  _playerState createState () => _playerState();
}

class _playerState extends State<MPlayer>
{

  var assetsAudioPlayer;
  var audio;
  var pos = 0;



  @override
  void initState()
  {
    super.initState();

    assetsAudioPlayer = widget.assetsAudioPlayer;
    if(widget.source == 'network')
    {
      assetsAudioPlayer.open(Audio.network(widget.src));
    }
    assetsAudioPlayer.open(Audio(widget.src), autoStart: false);

  }

  onPressedAction(assetsAudioPlayer)
  {
    final bool playing = assetsAudioPlayer.isPlaying.value;
    return playing ? assetsAudioPlayer.pause() : assetsAudioPlayer.play();
  }

  getVal(d){
  var b = d.split(":");
  var c = b.map((val) => double.parse(val)).toList();
  double sum = c.fold(0, (p, c) => p + c);
  return sum;
  }

  getNew(newv)
  {
    Duration d;
    return d;
  }

  getMax(assetsAudioPlayer)
  {
    final duration = assetsAudioPlayer.current.value.duration;
    return getVal(duration.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child:
          Container(
            padding: EdgeInsets.all(16),
            height: 150,
            margin: EdgeInsets.only(bottom: 30),
           color: Colors.black45,
           child: Column(
              children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Source: " + widget.source,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                IconButton(
                   color: Colors.white,
                   onPressed: () => onPressedAction(assetsAudioPlayer),
                   icon: PlayerBuilder.isPlaying(
                    player: assetsAudioPlayer,
                    builder: (context, isPlaying) {
                      return Icon(isPlaying ? Icons.pause : Icons.play_arrow);
                    }
                )
              ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.stop),
                         onPressed: () => assetsAudioPlayer.stop(),
              ),
                  ),
                 Container(
                   child: PlayerBuilder.currentPosition(
                     player: assetsAudioPlayer,
                     builder: (context, duration) {
                       return Text(
                        duration.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    }
                  )
                ),
            ],
        ),
          ]),
            ),
      );
  }


}