enum Coplectation { econom, comfort, business }

abstract class Car {
  final int hoursForce;
  final double volumeOfEngine;
  final String carBrend;
  final String color;
  final List<String> options;

  const Car({
    this.carBrend = 'Kia',
    required this.color,
    required this.hoursForce,
    required this.options,
    required this.volumeOfEngine,
  });

  factory Car.create(Coplectation coplectation) {
    final Car car = switch (coplectation) {
      Coplectation.econom => Econom(
          color: 'grey',
          hoursForce: 150,
          options: [
            'Светодиодные фары',
            'Светодиодные дневные ходовые огни',
            'Спортивный задний бампер с диффузором',
          ],
          volumeOfEngine: 1.6),
      Coplectation.comfort => Comfort(
          color: 'blue',
          hoursForce: 190,
          options: [
            'Светодиодные фары',
            'Светодиодные дневные ходовые огни',
            'Спортивный задний бампер с диффузором',
            'Фронтальные подушки безопасности',
            'Система активного управления',
          ],
          volumeOfEngine: 1.6),
      Coplectation.business => Business(
          color: 'black',
          hoursForce: 250,
          options: [
            'Светодиодные фары',
            'Светодиодные дневные ходовые огни',
            'Спортивный задний бампер с диффузором',
            'Фронтальные подушки безопасности',
            'Система активного управления',
            'Сиденья с комбинированной кожаной отделкой',
            'Элементы интерьера с отделкой матовым хромом и чёрным глянцем ',
            'Датчик дождя',
          ],
          volumeOfEngine: 2.0),
    };

    return car;
  }
}

class Econom extends Car {
  Econom({
    required super.color,
    required super.hoursForce,
    required super.options,
    required super.volumeOfEngine,
  });
}

class Comfort extends Car {
  Comfort({
    required super.color,
    required super.hoursForce,
    required super.options,
    required super.volumeOfEngine,
  });
}

class Business extends Car {
  Business({
    required super.color,
    required super.hoursForce,
    required super.options,
    required super.volumeOfEngine,
  });
}
