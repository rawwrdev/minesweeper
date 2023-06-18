import 'dart:math';

enum CellStatus { hidden, revealed, flagged }

class Cell {
  CellStatus status = CellStatus.hidden;
  int mineCount = 0;
  bool hasMine = false;
}

class GameModel {
  final int width;
  final int height;
  final int mineCount;
  late List<List<Cell>> grid;

  GameModel(
      {required this.width, required this.height, required this.mineCount}) {
    _initGrid();
    _plantMines();
    _calculateMineCounts();
  }

  void _initGrid() {
    grid = List.generate(
      height,
      (_) => List.generate(
        width,
        (_) => Cell(),
      ),
    );
  }

  void _plantMines() {
    var rng = Random();
    for (var i = 0; i < mineCount; i++) {
      while (true) {
        var x = rng.nextInt(width);
        var y = rng.nextInt(height);
        if (!grid[y][x].hasMine) {
          grid[y][x].hasMine = true;
          break;
        }
      }
    }
  }

  void _calculateMineCounts() {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        var cell = grid[y][x];
        if (cell.hasMine) continue;
        for (var dx = -1; dx <= 1; dx++) {
          for (var dy = -1; dy <= 1; dy++) {
            var nx = x + dx, ny = y + dy;
            if (nx >= 0 && nx < width && ny >= 0 && ny < height) {
              if (grid[ny][nx].hasMine) cell.mineCount++;
            }
          }
        }
      }
    }
  }

  void revealCell(int x, int y) {
    final cell = grid[y][x];

    if (cell.status != CellStatus.hidden) {
      return;
    }

    cell.status = CellStatus.revealed;

    if (cell.mineCount == 0) {
      for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
          var nx = x + dx, ny = y + dy;
          if (nx >= 0 && nx < width && ny >= 0 && ny < height) {
            revealCell(nx, ny);
          }
        }
      }
    }
  }

  void flagCell(int x, int y) {
    final cell = grid[y][x];

    if (cell.status == CellStatus.hidden) {
      cell.status = CellStatus.flagged;
    } else if (cell.status == CellStatus.flagged) {
      cell.status = CellStatus.hidden;
    }
  }
}
