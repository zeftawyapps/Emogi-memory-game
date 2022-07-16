import 'package:audioplayers/audioplayers.dart';

void runAudio(String uri) async {
  final player = AudioPlayer();
  var duration = await player.play(uri);
}

class PlaySound {
  String playcurrect = "audio/currect.mp3";
  String playclick = "audio/click.mp3";
  String playwrang = "audio/wrong.mp3";
  String _win = "audio/wingame.mp3";
  String _winMony = "audio/getmony.mp3";
  String playpay = "audio/casher.mp3";

  String _start = "audio/newGame.mp3";
  String _loss = "audio/gamiover.mp3";
  String _helpAdd = "audio/haddtime.mp3";
  String _helpCurrect = "audio/hcurrect.mp3";

  final clickAudio = AudioCache();
  final wrongAudio = AudioCache();
  final currectAudio = AudioCache();
  final winAudio = AudioCache();
Future play(String playUrl)async{
  await clickAudio.play(playUrl);

}
  Future playClick() async {
    await clickAudio.play(playclick);
  }

  Future playWrong() async {
    await clickAudio.play(playwrang);
  }

  Future playCurrect() async {
    await currectAudio.play(playcurrect);
  }

  Future playwin() async {
    await currectAudio.play(_win);
  }

  Future playwinMomy() async {
    await currectAudio.play(_winMony);
  }

  Future playloss() async {
    await currectAudio.play(_loss);
  }

  Future playhelpAdd() async {
    await currectAudio.play(_helpAdd);
  }

  Future playhelpcurrec() async {
    await currectAudio.play(_helpCurrect);
  }

  Future playStart() async {
    await currectAudio.play(_start);
  }

  Future playPayment() async {
    await currectAudio.play(playpay);
  }
}
