
class GameLogic {
  int noOfPlayers;
  int currentPlayerId;
  int numColumns;
  int numRows;
  int turnCounter = 0;
  int winnerId = -1;
  Map<int, int?> cellStates; // Cell State (1, 2, 3, ...)
  Map<int, int?> cellColors; // Color of cell
  Map<int, bool> activePlayers;
  bool isGameActive = true;
  Map<int, bool> cellExplosionAnimations = {};

// //for animation
//   Map<int, bool> cellExplosionAnimations = {};

  GameLogic({
    this.noOfPlayers = 2,
    this.currentPlayerId = 0,
    this.numColumns = 6,
    this.numRows = 12,
  })  : cellStates = {},
        cellColors = {},
        activePlayers = Map.fromIterable(List.generate(noOfPlayers, (index) => index),
            key: (item) => item, value: (item) => true);

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

  void resetExplosionAnimation(int cellIndex) {
    cellExplosionAnimations[cellIndex] = false;
  }

  // Future<void> onTapCell(int cellIndex) async {
  //   int row = cellIndex ~/ numColumns;
  //   int col = cellIndex % numColumns;

  //   if (cellColors[cellIndex] == null ||
  //       cellColors[cellIndex] == currentPlayerId) {
  //     await handleCellIncrement(cellIndex, row, col);
  //     if (turnCounter >= noOfPlayers) {
  //       checkForElimination();
  //     }
  //     updateCurrentPlayer();
  //   }
  // }

  Future<void> onTapCell(int cellIndex) async {
     if (!isGameActive) return;

    int row = cellIndex ~/ numColumns;
    int col = cellIndex % numColumns;
    // Ensure the game continues only if there's no winner yet
    if (winnerId == -1 && cellColors[cellIndex] == null || cellColors[cellIndex] == currentPlayerId) {
      await handleCellIncrement(cellIndex, row, col);
      if (turnCounter >= noOfPlayers) {
        checkForElimination();
      }
      updateCurrentPlayer();

      // Check for a winner after each move
      int? potentialWinner = checkForWinner();
      if (potentialWinner != null) {
        winnerId = potentialWinner; // Set the winner ID
        freezeGame(); // Freeze the game
        // Announce the winner, implementation depends on your app's UI framework
        print("Winner is Player $winnerId");
      }
    }
  }

  int? checkForWinner() {
    int activePlayerCount = 0;
    int? lastActivePlayerId;
    activePlayers.forEach((playerId, isActive) {
      if (isActive) {
        activePlayerCount++;
        lastActivePlayerId = playerId;
      }
    });

    // If there's only one active player left, return their ID as the winner
    if (activePlayerCount == 1) {
      return lastActivePlayerId;
    }
    return null; // Game continues
  }

  void freezeGame() {
    isGameActive = false;
  }


  void checkForElimination() {
    // Create a set of all players who own at least one cell
    var owners = cellColors.values.toSet();
    // Mark players as inactive if they don't own any cells
    activePlayers.keys.forEach((playerId) {
      if (!owners.contains(playerId)) {
        activePlayers[playerId] = false;
      }
    });
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

    cellExplosionAnimations[cellIndex] = true;

    onExplodeCallback?.call();

    List<int> neighbors = getNeighbors(row, col);
    for (int neighbor in neighbors) {
      if (isValidCell(neighbor)) {
        await Future.delayed(const Duration(milliseconds: 10));
        await updateCellState(neighbor);
      }
    }
  }

  // Future<void> explodeCell(int cellIndex, int row, int col) async {
  //   cellStates[cellIndex] = 0;
  //   cellColors[cellIndex] = null;
  //   cellExplosionAnimations[cellIndex] = true;

  //   onExplodeCallback?.call();

  //   List<int> neighbors = getNeighbors(row, col);
  //   // Collect futures for all neighbor updates
  //   List<Future<void>> neighborUpdates = [];
  //   for (int neighbor in neighbors) {
  //     if (isValidCell(neighbor)) {
  //       // Schedule updates without waiting for them here
  //       neighborUpdates.add(updateCellState(neighbor));
  //     }
  //   }

  //   // Wait for all scheduled updates to complete
  //   await Future.wait(neighborUpdates);
  // }


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
    do {
      currentPlayerId = (currentPlayerId + 1) % noOfPlayers;
    } while (!activePlayers[currentPlayerId]!); // Skip to the next active player

     turnCounter++;
  }

}
