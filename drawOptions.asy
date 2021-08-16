struct DrawOption {
  bool showAnchor;
  bool showOrigin;
  bool showBounds;

  void operator init(
    bool showAnchor = false, 
    bool showOrigin = false,
    bool showBounds = false) {
    this.showAnchor = showAnchor;
    this.showOrigin = showOrigin;
    this.showBounds = showBounds;
  }
}