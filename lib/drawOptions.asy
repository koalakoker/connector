struct DrawOption {
  bool showAnchor;
  bool showAnchorLabel;
  bool showOrigin;
  align originAlign;
  bool showBounds;

  void operator init(
    bool showAnchor      = false, 
    bool showAnchorLabel = false, 
    bool showOrigin      = false,
    align originAlign    = S,
    bool showBounds      = false) {
    this.showAnchor      = showAnchor;
    this.showAnchorLabel = showAnchorLabel;
    this.showOrigin      = showOrigin;
    this.originAlign     = originAlign;
    this.showBounds      = showBounds;
  }
}