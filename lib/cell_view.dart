import 'package:flutter/material.dart';
import 'game_model.dart';

class CellView extends StatelessWidget {
  final Cell cell;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  CellView(
      {Key? key,
      required this.cell,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: _buildCellContent(),
      ),
    );
  }

  Widget _buildCellContent() {
    if (cell.status == CellStatus.hidden) {
      return Container(); // hidden cell
    } else if (cell.status == CellStatus.flagged) {
      return Icon(Icons.flag, color: Colors.red); // flagged cell
    } else {
      if (cell.hasMine) {
        return Icon(Icons.warning, color: Colors.red); // mine
      } else {
        return Text(
            cell.mineCount.toString()); // cell showing number of adjacent mines
      }
    }
  }
}
