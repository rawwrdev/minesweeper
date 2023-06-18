import 'package:flutter/material.dart';
import 'game_model.dart';
import 'game_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minesweeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GameModel gameModel;

  @override
  void initState() {
    super.initState();
    gameModel = GameModel(width: 10, height: 10, mineCount: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minesweeper"),
      ),
      body: GameGridView(
        gameModel: gameModel,
        onCellTap: (x, y) {
          setState(() {
            gameModel.revealCell(x, y);
          });
        },
        onCellLongPress: (x, y) {
          setState(() {
            gameModel.flagCell(x, y);
          });
        },
      ),
    );
  }
}
