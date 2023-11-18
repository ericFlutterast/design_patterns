// ignore_for_file: unused_field

import 'builder.dart' show PizzaDouthDepth, PizzaDouthType, PizzaSouceType, PizzaTopLevel, PizzaBase;

class PizzaBuilder {
  String _name;
  PizzaBase _dough;
  PizzaSouceType _souce;
  int _cookingTime;
  List<PizzaTopLevel> _topping;

  PizzaBuilder()
      : _name = 'pizza',
        _dough = PizzaBase(PizzaDouthDepth.thick, PizzaDouthType.corn),
        _souce = PizzaSouceType.pesto,
        _cookingTime = 20,
        _topping = [PizzaTopLevel.bacon, PizzaTopLevel.mozarella];

  List<PizzaTopLevel> get gettoppik => _topping;
  String get getname => _name;
  PizzaBase get getdough => _dough;
  PizzaSouceType get getsouce => _souce;
  int get getcookingTime => _cookingTime;

  void toppik(List<PizzaTopLevel> newToppik) => _topping = newToppik;
  void name(String name) => _name = name;
  void dough(PizzaBase dough) => _dough = dough;
  void souce(PizzaSouceType souce) => _souce = souce;
  void cookingTime(int cookingType) => _cookingTime = cookingType;

  Pizza build() => Pizza(this);
}

class Pizza {
  late final String name;
  late final PizzaBase dough;
  late final PizzaSouceType souce;
  late final int cookingTime;
  late final List<PizzaTopLevel> topping;

  Pizza(PizzaBuilder pizzaBuilder) {
    name = pizzaBuilder.getname;
    dough = pizzaBuilder.getdough;
    souce = pizzaBuilder.getsouce;
    cookingTime = pizzaBuilder.getcookingTime;
    topping = pizzaBuilder.gettoppik;
  }

  @override
  String toString() {
    var infoStr = 'Pizza name: $name \n';
    infoStr += dough.toString();
    infoStr += 'sauce type: ${souce.toString().split('.')[1]}\n';
    infoStr += 'topping: {';
    topping.forEach((element) {
      infoStr += element.toString().split('.')[1] + ', ';
    });
    infoStr += '}\n';
    infoStr += 'cooking time: $cookingTime minutes';
    return infoStr;
  }

  static PizzaBuilder get builder => PizzaBuilder();
}
