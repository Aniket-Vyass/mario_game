import 'package:flame/experimental.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:mario_game/constants/globals.dart';
import 'package:mario_game/games/super_mario_bros_game.dart';
import 'package:mario_game/level/level_option.dart';

class LevelComponent extends Component with HasGameRef<SuperMarioBrosGame> {
  final LevelOption option;

  late Rectangle _levelBounds;

  LevelComponent(this.option);

  @override
  Future<void> onLoad() async {
    final level = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );

    gameRef.world.add(level);

    _levelBounds = Rectangle.fromPoints(
      Vector2.zero(),
      Vector2(
            level.tileMap.map.width.toDouble(),
            level.tileMap.map.height.toDouble(),
          ) *
          Globals.tileSize,
    );

    await super.onLoad();
  }
}
