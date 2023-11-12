import 'package:design_patterns/bin/abstract_fabric/abstract_fabric.dart';
import 'package:design_patterns/bin/abstract_fabric/coffee_house_with_abstract_fabric.dart';
import 'package:design_patterns/bin/factory_methods/factory_methode_car.dart';

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

  // print('coffee');
  // for (var coffee in CoffeeType.values) {
  //   final thisCoffee = Coffee.create(coffee);
  //   print('name: ${thisCoffee.mame}, sweetness: ${thisCoffee.sweetness}, cost: ${thisCoffee.cost}');
  //   print(_divider);
  // }

  print('car');
  for (var carComplectation in Coplectation.values) {
    final car = Car.create(carComplectation);
    print(
        'nameBrend: ${car.carBrend}, hoursForce: ${car.hoursForce} volumeOfEngine: ${car.volumeOfEngine} color: ${car.color} options: ${car.options}');
    print(_divider);
  }

  _useAbstractFactory();
}

void _useAbstractFactory() {
  var typeos = TypeOS.macOs;
  var app = Application(GuiAbstractFactory.returnUI(typeos));
  app.creareGui();

  final coffee = CoffeeHouse(CoffeeAbstractFactory.returnCoffe(CornType.robusta)).getCapucino();

  for (var element in coffee.props) {
    print(element);
  }
}
