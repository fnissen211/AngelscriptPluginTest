class GetPlayerInfo {

    // TimeModel@ timeModel;
    // CGameHighScore@ highScore;

    string GetName() {
        auto app = cast<CGameManiaPlanet>(GetApp());
        if (app is null) return "Unknown Player";

        auto playerInfo = app.LocalPlayerInfo;
        if (playerInfo is null) return "Unknown Player";
        
        return playerInfo.Name;
    }

    // string GetMapHighscore() {
    //     @highScore = CGameHighScore();
    //     @timeModel = TimeModel();

    //     if (highScore is null) {
    //         return "N/A";
    //     }

    //     print("Highscore: " + highScore.Score);
    //     print("Highscore: " + highScore.Count);
    //     print("Highscore: " + highScore.Rank);
    //     print("Highscore: " + highScore.Medal);

    //     return "Pers. Best: " + timeModel.FormatTime(highScore.Time);
    // }
}