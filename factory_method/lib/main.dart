import 'package:factory_method/bin/factory_methode_coffe.dart';

import 'bin/factory_method_guitar.dart';

void main(List<String> arguments) {
  for (var element in GuitarType.values) {
    Guitar guitar = Guitar.create(element);
    print(guitar.costGuitar().toString());
    print(guitar.toString());
    print('<-------------------------------------->');
  }

  for (var coffee in CoffeeType.values) {
    final thisCoffee = Coffee.create(coffee);
    print('name: ${thisCoffee.mame}, sweetness: ${thisCoffee.sweetness}, cost: ${thisCoffee.cost}');
    print('---------------------------');
  }
}
