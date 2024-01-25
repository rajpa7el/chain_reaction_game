class GameLogic {
  int noOfPlayers;
  int currentPlayerId;
  int numColumns;
  int numRows;
  Map<int, int> cellStates; // Cell State (1,2,3)
  Map<int, int> cellColors; //Color of cell

  GameLogic(
      {this.noOfPlayers = 2,
      this.currentPlayerId = 0,
      this.numColumns = 6,
      this.numRows = 12})
      : cellStates = {},
        cellColors = {};

  void onTapCell(int cellIndex) {
    int row = cellIndex ~/ numColumns;
    int col = cellIndex % numColumns;

    if (cellColors[cellIndex] == null) { // Assign color to empty cell
      cellColors[cellIndex] = currentPlayerId;
      cellStates[cellIndex] = (cellStates[cellIndex] ?? 0) + 1;
      updateCurrentPlayer();
    } 
    
    
    else if (cellColors[cellIndex] == currentPlayerId) {
      // Increment number if cell color matches current player

      if(cellStates[cellIndex]==1 && (cellIndex == 0 || cellIndex == numColumns-1 //Corner
      || cellIndex == numColumns*(numRows-1) || cellIndex == numColumns * numRows -1) ){

        cellColors.remove(cellIndex);
        cellStates.remove(cellIndex);

        if(cellIndex==0){
          updateCell(1);
          updateCell(numColumns);

        } else if(cellIndex == numColumns-1){
          updateCell(cellIndex-1);
          updateCell(cellIndex+numColumns);

        } else if(cellIndex == numColumns*(numRows-1)){
          updateCell(cellIndex+1);
          updateCell(cellIndex-numColumns);
          
        } else if(cellIndex == numColumns * numRows -1){
          updateCell(cellIndex-1);
          updateCell(cellIndex-numColumns);
          
        }
      }

      else if(cellStates[cellIndex]==2 && (col==0 || col==numColumns-1 || row==0 || row==numRows-1)){ //Border

        cellColors.remove(cellIndex);
        cellStates.remove(cellIndex);

        if(col==0){
          updateCell(cellIndex+1);
          updateCell(cellIndex+numColumns);
          updateCell(cellIndex-numColumns);

        } else if(col==numColumns-1){
          updateCell(cellIndex-1);
          updateCell(cellIndex+numColumns);
          updateCell(cellIndex-numColumns);

        } else if(row==0){
          updateCell(cellIndex+1);
          updateCell(cellIndex-1);
          updateCell(cellIndex+numColumns);

        } else if(row==numRows-1){
          updateCell(cellIndex+1);
          updateCell(cellIndex-1);
          updateCell(cellIndex-numColumns);

        }
      }

      else if(cellStates[cellIndex]==3){
        cellColors.remove(cellIndex);
        cellStates.remove(cellIndex);
        updateCell(cellIndex+1);
        updateCell(cellIndex-1);
        updateCell(cellIndex+numColumns);
        updateCell(cellIndex-numColumns);

      }

      else{
         cellStates[cellIndex] = (cellStates[cellIndex] ?? 0) + 1;
      }
      updateCurrentPlayer();
    }
  }
  void updateCell(int cellIndex){
    cellColors[cellIndex] = currentPlayerId;
    cellStates[cellIndex] = (cellStates[cellIndex] ?? 0) + 1;
  }

  void updateCurrentPlayer() {
      currentPlayerId = (currentPlayerId + 1) % noOfPlayers;
    }
}
