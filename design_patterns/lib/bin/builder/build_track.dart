// ignore_for_file: constant_identifier_names, unused_field

enum EngineType { lineSix, v8, v6, v12 }

enum TransmitionType { Eton, IShift }

class BulderTruck {
  String _color;
  String _weelFormul;
  String _truckName;
  EngineType _engineType;
  TransmitionType _transmitionType;

  BulderTruck()
      : _color = 'white',
        _truckName = 'Stream Line',
        _weelFormul = '4x2',
        _engineType = EngineType.lineSix,
        _transmitionType = TransmitionType.Eton;

  String get color => _color;
  String get truckName => _truckName;
  String get weelFormul => _weelFormul;
  EngineType get engineType => _engineType;
  TransmitionType get transmitionType => _transmitionType;

  void createPlatform({String? wheelFormul}) => _weelFormul = wheelFormul!;
  void addEngine(EngineType engineType) => _engineType = engineType;
  void addTransmition(TransmitionType transmitionType) => _transmitionType = transmitionType;
  void draw(String color) => _color = color;
  void addName(String name) => _truckName = name;

  Truck buld() => Truck(this);
}

class Truck {
  late final String color;
  late final String weelFormul;
  late final String truckName;
  late final EngineType engineType;
  late final TransmitionType transmitionType;

  Truck(BulderTruck bulderTruck) {
    color = bulderTruck.color;
    weelFormul = bulderTruck.weelFormul;
    truckName = bulderTruck.truckName;
    engineType = bulderTruck.engineType;
    transmitionType = bulderTruck.transmitionType;
  }

  @override
  String toString() {
    var infoStr = 'name: $truckName \n';
    infoStr += weelFormul;
    infoStr += 'trasmition type: $transmitionType';
    infoStr += engineType.toString();
    infoStr += '}\n';
    infoStr += 'color $color';
    return infoStr;
  }

  static BulderTruck get bilder => BulderTruck();
}
