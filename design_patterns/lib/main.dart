import 'package:design_patterns/bin/factory_methods/factory_methode_car.dart';
import 'package:design_patterns/bin/factory_methods/factory_methode_coffe.dart';

import 'bin/factory_methods/factory_method_guitar.dart';

const String _divider = '<-------------------------------------->';

void main(List<String> arguments) {
  print('guitar');
  for (var element in GuitarType.values) {
    Guitar guitar = Guitar.create(element);
    print(guitar.costGuitar().toString());
    print(guitar.toString());
    print(_divider);
  }

  print('coffee');
  for (var coffee in CoffeeType.values) {
    final thisCoffee = Coffee.create(coffee);
    print('name: ${thisCoffee.mame}, sweetness: ${thisCoffee.sweetness}, cost: ${thisCoffee.cost}');
    print(_divider);
  }

  print('car');
  for (var carComplectation in Coplectation.values) {
    final car = Car.create(carComplectation);
    print(
        'nameBrend: ${car.carBrend}, hoursForce: ${car.hoursForce} volumeOfEngine: ${car.volumeOfEngine} color: ${car.color} options: ${car.options}');
    print(_divider);
  }
}
