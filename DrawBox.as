class DrawBox {
    
    // Setup for class
    vec2 boxPosition = vec2(100, 100); // Initial position of the box
    vec2 boxSize = vec2(200, 100);      // Size of the box
    bool isDragging = false;           // Is the box being dragged?
    vec2 dragOffset = vec2(0, 0);      // Offset between mouse position and box corner

    // UserInfo
    GetPlayerInfo@ getPlayerInfo;

    // MapInfo
    GetMapInfo@ getMapInfo;

    void Render() {
        // Initialize player
        @getPlayerInfo = GetPlayerInfo();
        @getMapInfo = GetMapInfo();

        vec2 mousePos = UI::GetMousePos();


        // Draw the box
        nvg::BeginPath();
        nvg::Rect(boxPosition.x, boxPosition.y, boxSize.x, boxSize.y);
        nvg::FillColor(vec4(0, 0, 0, 0.7)); // Black box with transparency
        nvg::Fill();

        // Draw the text
        nvg::FontSize(15.0);
        nvg::FillColor(vec4(1, 1, 1, 1)); // White text
        nvg::TextAlign(nvg::Align::Center | nvg::Align::Middle);
        nvg::Text(boxPosition.x + 100, boxPosition.y + 10, getMapInfo.GetMapName());
        // nvg::Text(boxPosition.x + 100, boxPosition.y + 30, getPlayerInfo.GetMapHighscore());
        nvg::Text(boxPosition.x + 100, boxPosition.y + 30, getMapInfo.GetMapAuthorMedal());
        nvg::Text(boxPosition.x + 100, boxPosition.y + 50, getMapInfo.GetMapGoldMedal());
        nvg::Text(boxPosition.x + 100, boxPosition.y + 70, getMapInfo.GetMapSilverMedal());
        nvg::Text(boxPosition.x + 100, boxPosition.y + 90, getMapInfo.GetMapBronzeMedal());


        // Handle mouse released event (stop dragging)
        if (UI::IsMouseReleased(UI::MouseButton::Left)) {
            isDragging = false; // Stop dragging when the mouse is released
        }

        // Handle mouse down event (start dragging)
        if (UI::IsMouseDown(UI::MouseButton::Left)) {
            if (!isDragging) {
                // Check if mouse is inside the box
                if (mousePos.x >= boxPosition.x && mousePos.x <= boxPosition.x + boxSize.x &&
                    mousePos.y >= boxPosition.y && mousePos.y <= boxPosition.y + boxSize.y) 
                    {
                        isDragging = true; // Start dragging
                        dragOffset = mousePos - boxPosition; // Calculate drag offset
                    }
            } else {
                boxPosition = mousePos - dragOffset;
            }
        }
    }
}