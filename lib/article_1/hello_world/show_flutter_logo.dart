import 'package:flame/components.dart';
import 'package:flame/game.dart';

class LogoSprite extends SpriteComponent {
  // set the size of the sprite to be drawn to 16x16
  LogoSprite(): super(size: Vector2.all(16));
  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    // load icon.png as image sprite, you can also customize the image file.
    sprite = await Sprite.load("icon.png");
    // set the anchor point to the center of the sprite.
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    // TODO: implement onGameResize
    super.onGameResize(gameSize);
    // this function will called once before the first time it is rendered
    position = gameSize / 2;
  }
}

class ShowFlutterLogoGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    add(LogoSprite());
  }
}