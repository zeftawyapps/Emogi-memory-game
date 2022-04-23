import 'package:audioplayers/audioplayers.dart';

void runAudio(String uri) async {
  final player = AudioPlayer();
  var duration = await player.play(uri);
}

class PlaySound {
  String _currect = "audio/currect.mp3";
  String _click = "audio/click.mp3";
  String _wrang = "audio/wrong.mp3";
  String _win = "audio/wingame.mp3";
  String _winMony = "audio/getmony.mp3";

  String _start = "audio/newGame.mp3";
  String _loss = "audio/gamiover.mp3";
  String _helpAdd = "audio/haddtime.mp3";
  String _helpCurrect = "audio/hcurrect.mp3";

  final clickAudio = AudioCache();
  final wrongAudio = AudioCache();
  final currectAudio = AudioCache();
  final winAudio = AudioCache();

  Future playClick() async {
    await clickAudio.play(_click);
  }

  Future playWrong() async {
    await clickAudio.play(_wrang);
  }

  Future playCurrect() async {
    await currectAudio.play(_currect);
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
}
