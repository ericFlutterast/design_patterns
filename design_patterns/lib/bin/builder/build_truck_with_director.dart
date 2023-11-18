import 'build_track.dart' show EngineType, TransmitionType;

final class Truck {
  String color;
  String weelFormul;
  String truckName;
  EngineType engineType;
  TransmitionType transmitionType;

  Truck({
    this.color = 'white',
    this.weelFormul = '4x2',
    this.truckName = 'scania normal',
    this.engineType = EngineType.lineSix,
    this.transmitionType = TransmitionType.IShift,
  });

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
}

abstract interface class TruckBuilder {
  void createPlatform();
  void addEngine();
  void addTransmition();
  void draw();
  void addName();

  void build() {}
}

final class ScaniaNormalBulderImpl implements TruckBuilder {
  late Truck _truck;

  ScaniaNormalBulderImpl() {
    _truck = Truck();
  }

  @override
  void addEngine() => _truck.engineType = EngineType.lineSix;

  @override
  void addName() => _truck.truckName = 'ScaniaNormal';

  @override
  void addTransmition() => _truck.transmitionType = TransmitionType.IShift;

  @override
  void createPlatform() => _truck.weelFormul = '4x2';

  @override
  void draw() => _truck.color = 'white';

  @override
  Truck build() => _truck;
}

final class DirectorTruck {
  TruckBuilder? _truckBuilder;

  DirectorTruck([this._truckBuilder]);

  set builder(TruckBuilder builder) => _truckBuilder = builder;

  void makeTruk() {
    assert(_truckBuilder != null);
    _truckBuilder!.addEngine();
    _truckBuilder!.addName();
    _truckBuilder!.addTransmition();
    _truckBuilder!.createPlatform();
    _truckBuilder!.build();
  }
}
