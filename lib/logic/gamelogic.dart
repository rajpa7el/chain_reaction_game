import 'package:chain_reaction_app/common/global.dart';

class GameLogic {
  int noOfPlayers;
  int currentPlayerId;
  int numColumns;
  int numRows;
  Map<int, int?> cellStates; // Cell State (1, 2, 3, ...)
  Map<int, int?> cellColors; // Color of cell

// //for animation
//   Map<int, bool> cellExplosionAnimations = {};

  GameLogic({
    this.noOfPlayers = 2,
    this.currentPlayerId = 0,
    this.numColumns = 6,
    this.numRows = 12,
  })  : cellStates = {},
        cellColors = {};

//for animation
  // CellPosition getCellPosition(int row, int col) {
  //   bool isEdgeRow = row == 0 || row == numRows - 1;
  //   bool isEdgeCol = col == 0 || col == numColumns - 1;
  //   if (isEdgeRow && isEdgeCol) {
  //     return CellPosition.corner; // Corner cells
  //   } else if (isEdgeRow || isEdgeCol) {
  //     return CellPosition.edge; // Edge cells
  //   } else {
  //     return CellPosition.center; // Center cells
  //   }
  // }

  Function? onExplodeCallback;

  void setOnExplodeCallback(Function callback) {
    onExplodeCallback = callback;
  }

  // void resetExplosionAnimation(int cellIndex) {
  //   cellExplosionAnimations[cellIndex] = false;
  // }

  Future<void> onTapCell(int cellIndex) async {
    int row = cellIndex ~/ numColumns;
    int col = cellIndex % numColumns;

    if (cellColors[cellIndex] == null ||
        cellColors[cellIndex] == currentPlayerId) {
      await handleCellIncrement(cellIndex, row, col);
      updateCurrentPlayer();
    }
  }

  Future<void> handleCellIncrement(int cellIndex, int row, int col) async {
    int newState = (cellStates[cellIndex] ?? 0) + 1;
    cellStates[cellIndex] = newState;
    cellColors[cellIndex] = currentPlayerId;

    if (newState >= getCriticalMass(row, col)) {
      await explodeCell(cellIndex, row, col);
    }
  }

  Future<void> explodeCell(int cellIndex, int row, int col) async {
    cellStates[cellIndex] = 0;
    cellColors[cellIndex] = null;

    // cellExplosionAnimations[cellIndex] = true;

    onExplodeCallback?.call();

    List<int> neighbors = getNeighbors(row, col);
    for (int neighbor in neighbors) {
      if (isValidCell(neighbor)) {
        await Future.delayed(const Duration(milliseconds: 10));
        await updateCellState(neighbor);
      }
    }
  }

  List<int> getNeighbors(int row, int col) {
    List<int> neighbors = [];
    if (row > 0) neighbors.add((row - 1) * numColumns + col); // Top
    if (row < numRows - 1) {
      neighbors.add((row + 1) * numColumns + col); // Bottom
    }
    if (col > 0) neighbors.add(row * numColumns + (col - 1)); // Left
    if (col < numColumns - 1) {
      neighbors.add(row * numColumns + (col + 1)); // Right
    }
    return neighbors;
  }

  bool isValidCell(int cellIndex) {
    return cellIndex >= 0 && cellIndex < numColumns * numRows;
  }

  int getCriticalMass(int row, int col) {
    bool isEdgeRow = row == 0 || row == numRows - 1;
    bool isEdgeCol = col == 0 || col == numColumns - 1;

    if (isEdgeRow && isEdgeCol) {
      return 2; // Corner
    } else if (isEdgeRow || isEdgeCol) {
      return 3; // Edge
    } else {
      return 4; // Center
    }
  }

  Future<void> updateCellState(int neighborIndex) async {
    int newState = (cellStates[neighborIndex] ?? 0) + 1;
    cellStates[neighborIndex] = newState;
    cellColors[neighborIndex] = currentPlayerId;

    int row = neighborIndex ~/ numColumns;
    int col = neighborIndex % numColumns;
    if (newState >= getCriticalMass(row, col)) {
      await explodeCell(neighborIndex, row, col);
    }
  }

  void updateCurrentPlayer() {
    currentPlayerId = (currentPlayerId + 1) % noOfPlayers;
  }
}
