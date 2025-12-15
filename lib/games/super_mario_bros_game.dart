// ignore_for_file: unused_import, unused_local_variable
import 'package:flame/palette.dart';
import 'package:flame/components.dart'; //This has the World component&Camera already no need to import separately
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:mario_game/constants/globals.dart';
import 'package:mario_game/level/level_component.dart';
import 'package:mario_game/level/level_option.dart';

class SuperMarioBrosGame extends FlameGame {
  late CameraComponent cameraComponent;
  final World world =
      World(); //World is the component that holds all game objects eg. everything in the game
  // Load your game assets and initialize game components here
  LevelComponent? _currentLevel;

  @override
  Future<void> onLoad() async {
    TiledComponent map = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize.toDouble()),
    );

    world.add(map);

    cameraComponent = CameraComponent(world: world)
      ..viewfinder.position = Vector2(0, 0)
      ..viewfinder.anchor = Anchor.topLeft
      ..viewport.position = Vector2.zero()
      // ..viewfinder.visibleGameSize = Vector2(1000, 250)
      ..viewfinder.zoom = 2.8; // ← Just force a valid zoom;

    addAll([world, cameraComponent]);

    loadlevel(LevelOption.lv_1_1);

    return super.onLoad();
  }

  void loadlevel(LevelOption option) {
    _currentLevel?.removeFromParent();
    _currentLevel = LevelComponent(option);
    add(_currentLevel!);
  }
}
