class Achievement {
  String _name = "";
  String _description = "";
  String _svgPath = "";
  bool _unlocked = false;
  int _exp = 0;
  // static Image _image = NULL;

  Achievement(this._name, this._description, this._svgPath);

  String getName() {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  String getDescription() {
    return _description;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setSvgPath(String svgPath) {
    _svgPath = svgPath;
  }

  String getSvgPath() {
    return _svgPath;
  }

  void achievementUnlock() {
    _unlocked = true;
  }

  bool getStatus() {
    return _unlocked;
  }
}
