DrawBox@ drawBox;
GetPlayerInfo@ getPlayerInfo;

void Main() {
    @drawBox = DrawBox();

    auto app = cast<CGameManiaPlanet>(GetApp());
    if (app is null) {
        print("App is null");
        return;
    }

    @getPlayerInfo = GetPlayerInfo();
    if (getPlayerInfo is null) {
        print("GetPlayerInfo failed to initialize");
        return;
    }

}

void Render() {
        auto app = cast<CGameManiaPlanet>(GetApp());
        auto playground = app.CurrentPlayground;
        
        if (playground is null) {
            print("CurrentPlayground is null");
            return;
        } else {
            drawBox.Render();
        }
}