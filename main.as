DrawBox@ drawBox;
GetPlayerInfo@ getPlayerInfo;

void Main() {
    @drawBox = DrawBox();

    // Initialize GetPlayerInfo and GetMapInfo only if necessary dependencies are available
    auto app = cast<CGameManiaPlanet>(GetApp());  // Ensure app is initialized
    if (app is null) {
        print("App is null");
        return;  // Don't proceed further if the app is not initialized
    }

    @getPlayerInfo = GetPlayerInfo();
    if (getPlayerInfo is null) {
        print("GetPlayerInfo failed to initialize");
        return;  // Skip further initialization if GetPlayerInfo failed
    }

}

void Render() {
    // Gets called every frame
    drawBox.Render();
}