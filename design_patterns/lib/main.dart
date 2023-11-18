import 'package:design_patterns/bin/abstract_fabric/abstract_fabric.dart';
import 'package:design_patterns/bin/abstract_fabric/coffee_house_with_abstract_fabric.dart';
import 'package:design_patterns/bin/builder/build_track.dart';
import 'package:design_patterns/bin/builder/build_truck_with_director.dart';
import 'package:design_patterns/bin/builder/builder_without_director.dart';
import 'package:design_patterns/bin/factory_methods/factory_methode_car.dart';

import 'bin/builder/builder.dart';
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

  _useBuilder();
  //_useAbstractFactory();

  var pizzaBuilder = PizzaBuilder();

  var margarita = (pizzaBuilder
        ..cookingTime(20)
        ..dough(PizzaBase(PizzaDouthDepth.thin, PizzaDouthType.wheat))
        ..souce(PizzaSouceType.pesto)
        ..name('margarita')
        ..toppik([PizzaTopLevel.mozarella, PizzaTopLevel.solami]))
      .build();

  print(margarita);

  print((BulderTruck()
        ..addEngine(EngineType.v12)
        ..addName('Scania V12')
        ..draw('Deep Blue')
        ..addTransmition(TransmitionType.IShift))
      .buld());

  useTruckBuilder();
}

void useTruckBuilder() {
  DirectorTruck director = DirectorTruck();
  var it = ScaniaNormalBulderImpl();
  director.builder = it;
  director.makeTruk();
  print(it.build());
}

void _useBuilder() {
  Director director = Director();
  for (var pizza in [MargaritaPizzaBuilder(), SolamiPizzs()]) {
    director.builder = pizza;
    director.makePizza();
    print(pizza.create());
    print('------' * 20);
  }
}

//useAbstractFactory
void _useAbstractFactory() {
  var typeos = TypeOS.macOs;
  var app = Application(GuiAbstractFactory.returnUI(typeos));
  app.creareGui();

  final coffee = CoffeeHouse(CoffeeAbstractFactory.returnCoffe(CornType.robusta)).getCapucino();

  for (var element in coffee.props) {
    print(element);
  }
}
