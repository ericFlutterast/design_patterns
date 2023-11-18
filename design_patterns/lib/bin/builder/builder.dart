//перечисления из которых состоит пицца
// ignore_for_file: avoid_function_literals_in_foreach_calls

enum PizzaDouthDepth { thin, thick }

enum PizzaDouthType { wheat, corn, rye }

enum PizzaSouceType { pesto, tomato, barbeque }

enum PizzaTopLevel { mozarella, solami, bacon, shrimps }

//то что буддет в пицце при любых значениях
class PizzaBase {
  final PizzaDouthDepth pizzaDouthDepth;
  final PizzaDouthType pizzaDouthType;

  const PizzaBase(this.pizzaDouthDepth, this.pizzaDouthType);

  @override
  String toString() {
    var depthStr = pizzaDouthDepth.toString().split('.')[1];
    var douthTypeStr = pizzaDouthType.toString().split('.')[1];
    return 'douth type $douthTypeStr & $depthStr \n';
  }
}

//пицца
//product
class Pizza {
  String name;
  int cookingTime;
  PizzaBase douth;
  PizzaSouceType pizzaSouceType;
  List<PizzaTopLevel> pizzaTopLevel;

  Pizza({
    this.name = 'brick',
    this.cookingTime = 30,
    this.pizzaSouceType = PizzaSouceType.barbeque,
    this.douth = const PizzaBase(PizzaDouthDepth.thick, PizzaDouthType.wheat),
    this.pizzaTopLevel = const [PizzaTopLevel.mozarella, PizzaTopLevel.solami],
  });

  @override
  String toString() {
    var pizzaInfo = 'Pizza name: $name \n';
    pizzaInfo += 'cooking time: $cookingTime\n';
    pizzaInfo += douth.toString();
    pizzaInfo += pizzaSouceType.toString();
    pizzaTopLevel.forEach((element) {
      pizzaInfo += element.toString();
    });
    return pizzaInfo;
  }
}

//builder
abstract interface class Builder {
  void prepareDouth();
  void addSouce();
  void addTopik();
  Pizza create();
}

final class MargaritaPizzaBuilder implements Builder {
  late Pizza _pizza;

  MargaritaPizzaBuilder() {
    _pizza = Pizza(name: 'margarita', cookingTime: 40);
  }

  @override
  void addSouce() {
    _pizza.pizzaSouceType = PizzaSouceType.tomato;
  }

  @override
  void addTopik() {
    _pizza.pizzaTopLevel = [PizzaTopLevel.bacon, PizzaTopLevel.mozarella];
  }

  @override
  void prepareDouth() {
    _pizza.douth = PizzaBase(PizzaDouthDepth.thin, PizzaDouthType.wheat);
  }

  @override
  Pizza create() {
    return _pizza;
  }
}

final class SolamiPizzs implements Builder {
  late Pizza _pizza;

  SolamiPizzs() {
    _pizza = Pizza(name: 'Solami', cookingTime: 35);
  }

  @override
  void addSouce() => _pizza.pizzaSouceType = PizzaSouceType.pesto;

  @override
  void addTopik() =>
      _pizza.pizzaTopLevel = [PizzaTopLevel.mozarella, PizzaTopLevel.shrimps, PizzaTopLevel.bacon];

  @override
  void prepareDouth() => PizzaBase(PizzaDouthDepth.thick, PizzaDouthType.wheat);

  @override
  Pizza create() {
    return _pizza;
  }
}

final class Director {
  Builder? _builder;

  Director([this._builder]);

  set builder(Builder builder) => _builder = builder;

  void makePizza() {
    assert(_builder != null);
    _builder!.prepareDouth();
    _builder!.addSouce();
    _builder!.addTopik();
    _builder!.create();
  }
}
