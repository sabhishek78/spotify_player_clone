import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
      home: SpotifyPlayer(),
  ));
}

class SpotifyPlayer extends StatefulWidget {
  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {

  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  List<Song> allSongs = SongData().songs; // You are given a list of songs here for Stretch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Best of Hindi',
        ),
        centerTitle: true,

      ),
      body: Column(
          children: <Widget>[
            Image.network('https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805'),
            Text(dummySong.name),
            Text(dummySong.artistName),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(icon:Icon(Icons.thumb_up),onPressed: (){},),
                IconButton(icon:Icon(Icons.skip_previous),onPressed: (){},),
                IconButton(icon:Icon(Icons.play_arrow),onPressed: (){},iconSize: 50,),
                IconButton(icon:Icon(Icons.skip_next),onPressed: (){},),
                IconButton(icon:Icon(Icons.thumb_down),onPressed: (){},),
              ],
            )

          ],
        
      )
    );
  }
}
