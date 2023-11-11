enum GuitarType { lesPaul, stratocaster, superstrat }

abstract class Guitar {
  final String name;
  final String woodOfDeck;
  final String color;
  final double mensure;
  final int quantityString;

  const Guitar({
    required this.color,
    required this.mensure,
    required this.quantityString,
    required this.woodOfDeck,
    required this.name,
  });

  factory Guitar.create(GuitarType guitarType) {
    switch (guitarType) {
      case GuitarType.lesPaul:
        return LesPaul(
          color: 'red',
          mensure: 24.74,
          name: 'Gibson',
          quantityString: 6,
          woodOfDeck: 'red wood',
        );
      case GuitarType.stratocaster:
        return Stratocaster(
          color: 'white',
          mensure: 25.5,
          name: 'Fender',
          quantityString: 6,
          woodOfDeck: 'maple',
        );
      case GuitarType.superstrat:
        return Superstrat(
          color: 'black',
          mensure: 25.5,
          name: 'Ibanez',
          quantityString: 7,
          woodOfDeck: 'maple',
        );
      default:
        throw Exception();
    }
  }

  double costGuitar();

  String play();

  @override
  String toString() {
    return 'Guitar: $name guitar color: $color';
  }
}

class LesPaul extends Guitar {
  const LesPaul({
    required super.color,
    required super.mensure,
    required super.name,
    required super.quantityString,
    required super.woodOfDeck,
  });

  @override
  double costGuitar() {
    return (2000 * quantityString).toDouble();
  }

  @override
  String play() {
    return 'jjjjjjjjj';
  }
}

class Stratocaster extends Guitar {
  const Stratocaster({
    required super.color,
    required super.mensure,
    required super.name,
    required super.quantityString,
    required super.woodOfDeck,
  });

  @override
  double costGuitar() {
    return (1500 * quantityString + 500).toDouble();
  }

  @override
  String play() {
    return 'glass glass glass';
  }
}

class Superstrat extends Guitar {
  const Superstrat({
    required super.color,
    required super.mensure,
    required super.name,
    required super.quantityString,
    required super.woodOfDeck,
  });

  @override
  double costGuitar() {
    return (1500 * quantityString + 100).toDouble();
  }

  @override
  String play() {
    return 'JJJJJJJJJJ';
  }
}
