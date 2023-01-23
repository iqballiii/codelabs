// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../doodle_dash.dart';

abstract class PowerUp extends SpriteComponent
    with HasGameRef<DoodleDash>, CollisionCallbacks {
  final hitbox = RectangleHitbox();
  double get jumpSpeedMultiplier;
  double get pointsBoost;

  PowerUp({
    super.position,
  }) : super(
          size: Vector2.all(50),
          priority: 2,
        );

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    await add(hitbox);
  }
}

// Powerups: Add Rocket class
class Rocket extends PowerUp {
  // Add lines from here...
  @override
  double get jumpSpeedMultiplier => 3.5;
  @override
  double get pointsBoost => 0.0;

  Rocket({
    super.position,
  });

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/rocket_1.png');
    size = Vector2(50, 70);
  }
}

// Powerups: Add NooglerHat class
class NooglerHat extends PowerUp {
  // Add lines from here...
  @override
  double get jumpSpeedMultiplier => 2.5;
  @override
  double get pointsBoost => 0.0;

  NooglerHat({
    super.position,
  });

  final int activeLengthInMS = 5000;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/noogler_hat.png');
    size = Vector2(75, 50);
  }
}

// Powerups: Add Points
class PowerBooster extends PowerUp {
  @override
  double get jumpSpeedMultiplier => 1.0;
  @override
  double get pointsBoost => 50.0;

  PowerBooster({
    super.position,
  });

  final int activeLengthInMs = 1;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/power_booster_sprite.png');
    size = Vector2(70, 50);
  }
}
