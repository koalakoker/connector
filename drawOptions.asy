struct DrawOption {
  bool showAnchor;
  bool showOrigin;

  void operator init(bool showAnchor = false, bool showOrigin = false) {
    this.showAnchor = showAnchor;
    this.showOrigin = showOrigin;
  }
}