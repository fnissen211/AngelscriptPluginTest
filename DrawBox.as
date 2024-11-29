class DrawBox {
    // Setup for class
    vec2 boxPosition = vec2(100, 100); // Initial position of the box
    vec2 boxSize = vec2(200, 50);      // Size of the box
    bool isDragging = false;           // Is the box being dragged?
    vec2 dragOffset = vec2(0, 0);      // Offset between mouse position and box corner

    void Render() {
        vec2 mousePos = UI::GetMousePos();

        // Handle mouse down event (start dragging)
        if (UI::IsMouseDown(UI::MouseButton::Left)) {
            if (!isDragging) {
                // Check if mouse is inside the box
                if (mousePos.x >= boxPosition.x && mousePos.x <= boxPosition.x + boxSize.x &&
                    mousePos.y >= boxPosition.y && mousePos.y <= boxPosition.y + boxSize.y) {
                    isDragging = true; // Start dragging
                    dragOffset = mousePos - boxPosition; // Calculate drag offset
                }
            }
        }

        // If the mouse is dragging, update the box position
        if (isDragging) {
            boxPosition = mousePos - dragOffset;
        }

        // Handle mouse released event (stop dragging)
        if (UI::IsMouseReleased(UI::MouseButton::Left)) {
            isDragging = false; // Stop dragging when the mouse is released
        }

        // Draw the box
        nvg::BeginPath();
        nvg::Rect(boxPosition.x, boxPosition.y, boxSize.x, boxSize.y);
        nvg::FillColor(vec4(0, 0, 0, 0.7)); // Black box with transparency
        nvg::Fill();

        // Draw the text
        nvg::FontSize(20.0);
        nvg::FillColor(vec4(1, 1, 1, 1)); // White text
        nvg::TextAlign(nvg::Align::Center | nvg::Align::Middle);
        nvg::Text(boxPosition.x + boxSize.x / 2, boxPosition.y + boxSize.y / 2, "Drag Me!");
    }
}