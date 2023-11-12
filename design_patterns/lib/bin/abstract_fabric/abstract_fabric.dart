//абстрактные классы продуктов для интерфейса
abstract class AppBar {
  final String system;

  const AppBar(this.system);

  create();
}

abstract class Container {
  final String system;

  const Container(this.system);

  create();
}

abstract class BottomNavigationBar {
  final String system;

  const BottomNavigationBar(this.system);

  create();
}

//Реализации для платформ
class WindowsAppBar extends AppBar {
  const WindowsAppBar() : super('window');

  @override
  create() {
    print('app bar for windows is create');
  }
}

class WindowsContainer extends Container {
  const WindowsContainer() : super('windows');

  @override
  create() {
    print('container for windows is create');
  }
}

class WindowsBottomNavigationBar extends BottomNavigationBar {
  const WindowsBottomNavigationBar() : super('windows');

  @override
  create() {
    print('BottomNavigationBar for windows is create');
  }
}

class MacOSAppBar extends AppBar {
  const MacOSAppBar() : super('MacOS');

  @override
  create() {
    print('app bar for MacOS is create');
  }
}

class MacOSContainer extends Container {
  const MacOSContainer() : super('MacOS');

  @override
  create() {
    print('Container for MacOS is create');
  }
}

class MacOSBottomNavigationBar extends BottomNavigationBar {
  const MacOSBottomNavigationBar() : super('MacOS');

  @override
  create() {
    print('Bottom navigation bar for MacOS is create');
  }
}

//главный класс абстрактной фабрики
abstract class GuiAbstractFactory {
  AppBar getAppBar();
  Container getContainer();
  BottomNavigationBar getBottomNavigationBar();

  const GuiAbstractFactory._();

  factory GuiAbstractFactory.returnUI(TypeOS typeOS) {
    final result = switch (typeOS) {
      TypeOS.windows => WindowsFactoryGui(),
      TypeOS.macOs => MacOSFactoryGui(),
    };

    return result;
  }
}

//реализация для платформы windows
final class WindowsFactoryGui implements GuiAbstractFactory {
  @override
  AppBar getAppBar() => WindowsAppBar();

  @override
  BottomNavigationBar getBottomNavigationBar() => WindowsBottomNavigationBar();

  @override
  Container getContainer() => WindowsContainer();
}

//реализация для платформы macOS
final class MacOSFactoryGui implements GuiAbstractFactory {
  @override
  AppBar getAppBar() => MacOSAppBar();

  @override
  BottomNavigationBar getBottomNavigationBar() => MacOSBottomNavigationBar();

  @override
  Container getContainer() => MacOSContainer();
}

enum TypeOS { windows, macOs }

class Application {
  final GuiAbstractFactory guiAbstractFactory;

  const Application(this.guiAbstractFactory);

  void creareGui() {
    guiAbstractFactory.getAppBar().create();
    guiAbstractFactory.getContainer().create();
    guiAbstractFactory.getBottomNavigationBar().create();
  }
}
