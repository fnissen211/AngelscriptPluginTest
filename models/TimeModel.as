class TimeModel {
    string FormatTime(uint time) {
        
        uint hours = time / (1000 * 60 * 60);
        uint minutes = (time / (1000 * 60)) % 60;
        uint seconds = (time / 1000) % 60;
        uint milliseconds = time % 1000;

        if (hours < 0) {
            hours = 0;
        }
        if (minutes < 0) {
            minutes = 0;
        }
        if (seconds < 0) {
            seconds = 0;
        }
        if (milliseconds < 0) {
            milliseconds = 0;
        }

        if (hours == 0 && minutes == 0) {
            return Text::Format("%02d", seconds) + "." + Text::Format("%03d", milliseconds);
        }
        if (hours == 0) {
            return Text::Format("%02d", minutes) + ":" + Text::Format("%02d", seconds) + "." + Text::Format("%03d", milliseconds);
        }

        return Text::Format("%02d", hours) + ":" + Text::Format("%02d", minutes) + ":" + Text::Format("%02d", seconds) + "." + Text::Format("%03d", milliseconds);
    }
}