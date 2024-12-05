class GetPlayerInfo {

    string GetName() {
        // Get the main application object
        auto app = cast<CGameManiaPlanet>(GetApp());
        if (app is null) return "Unknown Player";

        // Access the local player info
        auto playerInfo = app.LocalPlayerInfo;
        if (playerInfo is null) return "Unknown Player";
        // Return the player's name
        return playerInfo.Name;
    }
}