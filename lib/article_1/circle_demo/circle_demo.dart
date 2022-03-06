import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';

class CircleDemoGame extends FlameGame with HasCollidables, TapDetector {

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad
    add(ScreenCollidable());
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    add(CircleDemoComponent(info.eventPosition.game));
  }

}

class CircleDemoComponent extends PositionComponent
  with HasGameRef<CircleDemoGame>, HasHitboxes, Collidable {

  CircleDemoComponent(Vector2 position): super(
    position: position,
    size: Vector2.all(64),
    anchor: Anchor.center
  ) {
    _paint = Paint();
    _paint.color = const Color(0xFF0080FF);
    _paint.isAntiAlias = true;
    _paint.style = PaintingStyle.fill;
  }
  static final Vector2 _gravity = Vector2(0, 2000);
  late final Paint _paint;
  late Vector2 _velocity;
  bool _isHit = false;
  bool _isHitEnd = true;

  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad
    addHitbox(HitboxCircle());
    _velocity = Vector2((Random().nextInt(6000) - 3000).toDouble(), 0);
  }

  @override
  void render(Canvas canvas){
    renderHitboxes(canvas, paint: _paint);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    if(_isHit && _isHitEnd) {
      if(position.x < size.x / 2 || position.x + size.x / 2 > gameRef.size.x) {
        _velocity.x *= 0.87;
      }
      if(position.y + size.x / 2 > gameRef.size.y) {
        _velocity.y *= 0.9;
      }
      _velocity *= -0.8;
      _isHitEnd = false;
      return;
    }
    // formula 1: y = y0 + v0t + 1/2gt^2
    // formula 2: v = v0 + vt
    position.add(_gravity * 0.5 * dt * dt + _velocity * dt);
    _velocity.add(_gravity * dt);

    if(position.y - (size.y / 2) > gameRef.size.y) {
      removeFromParent();
    }

  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    // TODO: implement onCollision
    if(other is ScreenCollidable) {
      _isHit = true;
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    // TODO: implement onCollisionEnd
    if(other is ScreenCollidable) {
      _isHitEnd = true;
      _isHit = false;
    }
  }

}