import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AudioGame extends FlameGame with HasTappables {
  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    final button = SpriteButtonComponent(
      button: await Sprite.load("icon_64.png"),
      buttonDown: await Sprite.load("icon.png"),
      onPressed: tapUp,
      anchor: Anchor.center,
    );
    button.position = canvasSize / 2;
    add(button);
  }

  @override
  Color backgroundColor() {
    // TODO: implement backgroundColor
    return const Color(0xffffffff);
  }

  void tapUp() {
    // Pause the BGM if it's playing
    if(FlameAudio.bgm.isPlaying) {
      FlameAudio.bgm.pause();
      if (kDebugMode) {
        print("stop");
      }
    }
    else {
      // initialize the Audio Player and play if it's the first click
      if(FlameAudio.bgm.audioPlayer == null) {
        FlameAudio.bgm.initialize();
        FlameAudio.bgm.play("bgm.mp3");
      }
      else {
        // resume playing
        FlameAudio.bgm.resume();
      }
      if (kDebugMode) {
        print("play");
      }
    }
  }
}