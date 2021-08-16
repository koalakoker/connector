struct DrawOption {
  bool showAnchor;
  bool showAnchorLabel;
  bool showOrigin;
  bool showBounds;

  void operator init(
    bool showAnchor      = false, 
    bool showAnchorLabel = false, 
    bool showOrigin      = false,
    bool showBounds      = false) {
    this.showAnchor      = showAnchor;
    this.showAnchorLabel = showAnchorLabel;
    this.showOrigin      = showOrigin;
    this.showBounds      = showBounds;
  }
}