class GetMapInfo {
    CGameCtnChallenge@ GetChallenge() {
        auto app = cast<CGameManiaPlanet>(GetApp());
        if (app is null) {
            print("App is null");
            return null;
        }

        // Check if CurrentPlayground is null
        auto playground = app.CurrentPlayground;
        if (playground is null) {
            print("CurrentPlayground is null");
            return null;
        }

        // Check if Interface is null
        auto challengeInterface = playground.Interface;
        if (challengeInterface is null) {
            print("Interface is null");
            return null;
        }

        // Check if Challenge is null
        auto challenge = challengeInterface.Challenge;
        if (challenge is null) {
            print("Challenge is null");
            return null;
        }

        return challenge;  // Return the challenge object
    }

    string GetMapName() {
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "";  // Fallback if challenge is null
        }
        return "Map Name: " + challenge.MapName;
    }

    string GetMapBronzeMedal() {
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "";  // Fallback if challenge is null
        }
        return "Bronze Medal: " + Text::Format("%d", challenge.TMObjective_BronzeTime);
    }

    string GetMapSilverMedal() {
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "";  // Fallback if challenge is null
        }
        return "Silver Medal: " + Text::Format("%d", challenge.TMObjective_SilverTime);
    }

    string GetMapGoldMedal() {
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "";  // Fallback if challenge is null
        }
        return "Gold Medal: " + Text::Format("%d", challenge.TMObjective_GoldTime);
    }

}