import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'chewie_code.dart';
import 'music_player_view.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: 'AVPlayer',
     theme: ThemeData(
      primarySwatch: Colors.red,
     ),
     home: Player(),
    );
  }
}

class Player extends StatelessWidget
{
  String songUrl = 'https://codingwithjoe.com/wp-content/uploads/2018/03/applause.mp3';
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Media Player'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),

              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: [
                  ListView(
                    children: <Widget>[
                      ChewieListItem(
                          videoPlayerController: VideoPlayerController.asset(
                            'assets/videos/nf.mp4',
                         ),
                         looping: true,
                        source: "Asset",
                       ),
                      ChewieListItem(
                          videoPlayerController: VideoPlayerController.network(
                             'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
                        ),
                        source: "Network",
                        ),]), 
                  ListView(
                    children: [
                      MPlayer(
                    assetsAudioPlayer: AssetsAudioPlayer.newPlayer(),
                    source: "assets",
                    src: 'assets/audios/survival.mp3',
                      ),
                      MPlayer(
                        assetsAudioPlayer: AssetsAudioPlayer.newPlayer(),
                        source: "network",
                        src: songUrl,
                      )
                  ])


          ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                height: 50,
                alignment: Alignment.bottomCenter,
                color: Colors.black26,
                child: ButtonBar(
                  layoutBehavior: ButtonBarLayoutBehavior.constrained,
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      //margin: EdgeInsets.only(left: 20, right: 50),
                      child: RaisedButton(
                        child: Icon(Icons.video_library),
                        onPressed: (){controller.jumpToPage(0);},
                      ),
                    ),

                    Container(
                      width: 150,
                      child: RaisedButton(
                        child: Icon(Icons.music_note),
                        onPressed: (){controller.jumpToPage(1);},
                      ),
                    ),
                  ],
                )
              ),
            )
        ]),
      ),
    );
  }

}