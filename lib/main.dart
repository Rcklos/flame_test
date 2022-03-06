import 'package:flame_test/article_1/bgm_audio/bgm_audio.dart';
import 'package:flame_test/article_1/circle_demo/circle_demo.dart';
import 'package:flame_test/article_1/hello_world/show_flutter_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';

void main() {
  final myGame = CircleDemoGame();
  runApp(
    GameWidget(
        game: myGame,
    ),
  );
}