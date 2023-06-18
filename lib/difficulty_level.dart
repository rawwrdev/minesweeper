enum Difficulty { easy, medium, hard }

class DifficultyLevel {
  final Difficulty difficulty;

  DifficultyLevel(this.difficulty);

  int get width {
    switch (difficulty) {
      case Difficulty.easy:
        return 8;
      case Difficulty.medium:
        return 16;
      case Difficulty.hard:
        return 24;
      default:
        return 8;
    }
  }

  int get height {
    return width;
  }

  int get mines {
    return (width * height / 6.4).round();
  }
}
