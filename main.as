DrawBox@ drawBox;

void Main() {
    @drawBox = DrawBox();
}

void Render() {
    // gets called every frame
    drawBox.Render();
}