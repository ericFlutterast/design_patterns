//абстрактный продукт
abstract interface class Coffee {
  final num cost;
  final String name;
  final String sweetness;
  final String corn;

  const Coffee({
    required this.corn,
    required this.cost,
    required this.name,
    required this.sweetness,
  });

  List get props => [cost, name, sweetness, corn];
}

//arabica
class Latte extends Coffee {
  Latte({
    required super.cost,
    required super.name,
    required super.sweetness,
    required super.corn,
  });
}

class Capucino extends Coffee {
  Capucino({
    required super.cost,
    required super.name,
    required super.sweetness,
    required super.corn,
  });
}

class Americano extends Coffee {
  Americano({
    required super.cost,
    required super.name,
    required super.sweetness,
    required super.corn,
  });
}

enum CornType { arabica, robusta }

//main class abstract factory
abstract interface class CoffeeAbstractFactory {
  final String? cornName;

  Coffee getCapucino();
  Coffee getLatte();
  Coffee getAmericano();

  const CoffeeAbstractFactory(this.cornName);

  factory CoffeeAbstractFactory.returnCoffe(CornType coffeeType) {
    final CoffeeAbstractFactory coffee = switch (coffeeType) {
      CornType.arabica => ArabicaCoffee(),
      CornType.robusta => RobustaCoffee(),
    };

    return coffee;
  }
}

class ArabicaCoffee implements CoffeeAbstractFactory {
  @override
  String get cornName => 'Arabico';

  @override
  Coffee getAmericano() => Americano(cost: 100, name: 'Americano', sweetness: 'not sweet', corn: cornName);

  @override
  Coffee getCapucino() => Capucino(cost: 120, name: 'Capucino', sweetness: 'sweet', corn: cornName);
  @override
  Coffee getLatte() => Latte(cost: 130, name: 'Latte', sweetness: 'sweet', corn: cornName);
}

class RobustaCoffee implements CoffeeAbstractFactory {
  @override
  String get cornName => 'Robusta';

  @override
  Coffee getAmericano() => Americano(cost: 110, name: 'Americano', sweetness: 'not sweet', corn: cornName);

  @override
  Coffee getCapucino() => Capucino(cost: 130, name: 'Capucino', sweetness: 'sweet', corn: cornName);

  @override
  Coffee getLatte() => Latte(cost: 140, name: 'Latte', sweetness: 'sweet', corn: cornName);
}

class CoffeeHouse {
  final CoffeeAbstractFactory coffeeAbstractFactory;

  const CoffeeHouse(this.coffeeAbstractFactory);

  Coffee getCapucino() => coffeeAbstractFactory.getCapucino();
  Coffee getAmericano() => coffeeAbstractFactory.getAmericano();
  Coffee getLatte() => coffeeAbstractFactory.getLatte();
}
