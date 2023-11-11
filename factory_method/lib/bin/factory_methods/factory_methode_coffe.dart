enum CoffeeType { latte, capucino, espresso, raf }

abstract class Coffee {
  final num cost;
  final String mame;
  final String sweetness;

  const Coffee({
    required this.cost,
    required this.mame,
    required this.sweetness,
  });

  factory Coffee.create(CoffeeType coffeeType) {
    final Coffee coffee = switch (coffeeType) {
      CoffeeType.capucino => Capucino(cost: 140, mame: 'capucino', sweetness: 'sweet'),
      CoffeeType.latte => Latte(cost: 150, mame: 'latte', sweetness: 'sweet more'),
      CoffeeType.espresso => Espresso(cost: 90, mame: 'espresso', sweetness: 'not sweet '),
      CoffeeType.raf => Raff(cost: 200, mame: 'raf', sweetness: 'very sweet'),
    };

    return coffee;
  }

  num get costOfCoffe => cost;
  String get mameOfCoffe => mame;
  String get sweetnessOfCoffee => sweetness.toString();
}

class Latte extends Coffee {
  const Latte({
    required super.cost,
    required super.mame,
    required super.sweetness,
  });
}

class Capucino extends Coffee {
  const Capucino({
    required super.cost,
    required super.mame,
    required super.sweetness,
  });
}

class Espresso extends Coffee {
  const Espresso({
    required super.cost,
    required super.mame,
    required super.sweetness,
  });
}

class Raff extends Coffee {
  Raff({
    required super.cost,
    required super.mame,
    required super.sweetness,
  });
}
