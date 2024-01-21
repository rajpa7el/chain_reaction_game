class GameLogic {
  int noOfPlayers;
  int currentPlayerId;

  GameLogic({this.noOfPlayers = 2, this.currentPlayerId = 0});

  void onTapCell(int cellIndex) {
    currentPlayerId++;

    if (currentPlayerId >= noOfPlayers) {
      currentPlayerId = 0;
    }
  }
}
