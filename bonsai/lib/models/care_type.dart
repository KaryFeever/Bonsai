class CareType {
  String _name = "";
  int _frequency = 0;
  int _frequencyIndex = 0;
  int _timeIndex = 0;
  bool _enabled = false;

  CareType(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  bool getEnabled() {
    return _enabled;
  }

  void setEnabled(bool value) {
    _enabled = value;
  }

  int getFrequency() {
    return _frequency;
  }

  void setFrequency(int frequency) {
    _frequency = frequency;
  }

  int getFrequencyIndex() {
    return _frequencyIndex;
  }

  void setFrequencyIndex(int index) {
    _frequencyIndex = index;
  }

  int getTimeIndex() {
    return _timeIndex;
  }

  void setTimeIndex(int index) {
    _timeIndex = index;
  }
}
