import 'package:flutter/material.dart';
import 'game_model.dart';
import 'cell_view.dart';

class GameGridView extends StatelessWidget {
  final GameModel gameModel;
  final Function(int, int) onCellTap;
  final Function(int, int) onCellLongPress;

  GameGridView({
    Key? key,
    required this.gameModel,
    required this.onCellTap,
    required this.onCellLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gameModel.width,
        ),
        itemCount: gameModel.width * gameModel.height,
        itemBuilder: (context, index) {
          int x = index % gameModel.width;
          int y = index ~/ gameModel.width;
          return CellView(
            cell: gameModel.grid[y][x],
            onTap: () => onCellTap(x, y),
            onLongPress: () => onCellLongPress(x, y),
          );
        },
      ),
    );
  }
}
