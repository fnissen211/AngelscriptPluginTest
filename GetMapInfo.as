class GetMapInfo {
    TimeModel@ timeModel;

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
            return "N/A";  // Fallback if challenge is null
        }
        return "Map Name: " + challenge.MapName;
    }

    string GetMapBronzeMedal() {
        @timeModel = TimeModel();
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "N/A";
        }

        return "Bronze Medal: " + timeModel.FormatTime(challenge.TMObjective_BronzeTime);
    }

    string GetMapSilverMedal() {
        @timeModel = TimeModel();
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "N/A";
        }

        return "Silver Medal: " + timeModel.FormatTime(challenge.TMObjective_SilverTime);
    }

    string GetMapGoldMedal() {
        @timeModel = TimeModel();
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "N/A";
        }

        return "Gold Medal: " + timeModel.FormatTime(challenge.TMObjective_GoldTime);
    }

    string GetMapAuthorMedal() {
        @timeModel = TimeModel();
        auto challenge = GetChallenge();
        if (challenge is null) {
            return "N/A";
        }

        return "Author Medal: " + timeModel.FormatTime(challenge.TMObjective_AuthorTime);
    }

}