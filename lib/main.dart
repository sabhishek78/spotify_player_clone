import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';
import 'dart:math';
List<Song> allSongs = SongData().songs;
Random rand=Random();
int index=rand.nextInt(allSongs.length);


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

  //List<Song> allSongs = SongData().songs;

  // You are given a list of songs here for Stretch
  AudioPlayer audioPlayer = AudioPlayer();
  bool playing=false;

  triggerAudioPlayer()
  {
    setState(() {

      if(!playing)
      {
        playing=true;
        audioPlayer.play(allSongs[index].playUrl);
      }
      else{
        playing=false;
        audioPlayer.pause();
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Best of Hindi',
        ),
        centerTitle: true,

      ),
      body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(allSongs[index].imageUrl),
            Text(allSongs[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),textAlign: TextAlign.justify,),
            Text(allSongs[index].artistName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(icon:Icon(Icons.thumb_up),onPressed: (){},color: Colors.white,),
                IconButton(icon:Icon(Icons.skip_previous),onPressed: (){
                  if(index==0)
                    {
                      index=index;
                    }
                  else
                    {
                      index=index-1;
                    }
                  triggerAudioPlayer();
                },
                  color: Colors.white,),
                FloatingActionButton(
                        onPressed: ()
                         {
                           triggerAudioPlayer();

                        },

                        child: playing?new Icon(Icons.pause):new Icon(Icons.play_arrow)),
                IconButton(icon:Icon(Icons.skip_next),onPressed: (){
                  if(index==allSongs.length-1)
                  {
                    index=index;
                  }
                  else
                  {
                    index=index+1;
                  }
                  triggerAudioPlayer();
                },color: Colors.white,),
                IconButton(icon:Icon(Icons.thumb_down),onPressed: (){},color: Colors.white,),

              ],
            )

          ],
        
      )
    );
  }
}
