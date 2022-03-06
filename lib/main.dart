import 'package:flame_test/article_1/hello_world/show_flutter_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';

void main() {
  final myGame = ShowFlutterLogoGame();
  runApp(
    GameWidget(
        game: myGame,
    ),
  );
}