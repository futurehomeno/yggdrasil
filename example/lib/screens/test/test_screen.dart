import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  static const String routeName = 'TestScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TestScreen(),
    );
  }

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final OverlayPortalController _controller = OverlayPortalController()..show();

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Test',
      child: Column(
        children: <Widget>[
          OverlayPortal(
            controller: _controller,
            overlayChildBuilder: (BuildContext context) {
              return TestWidget(
                name: 'THE CONTAINER',
                child: Container(
                  color: Colors.grey[900],
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: YgButton(
                    onPressed: _controller.toggle,
                    child: const Text('Close'),
                  ),
                ),
              );
            },
            child: TestWidget(
              name: 'THE BUTTON',
              child: YgButton(
                onPressed: () {
                  _controller.toggle();
                },
                child: const Text('I am just a button'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class TestWidget extends SingleChildRenderObjectWidget {
  const TestWidget({
    super.key,
    required this.name,
    super.child,
  });

  final String name;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return TestRenderBox(
      name: name,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant TestRenderBox renderObject) {
    renderObject.name = name;
    super.updateRenderObject(context, renderObject);
  }
}

class TestRenderBox extends RenderProxyBox {
  TestRenderBox({
    required String name,
  }) : _name = name;

  String _name;
  String get name => _name;
  set name(String newName) {
    if (_name != newName) {
      print('!--- NAME CHANGE ---! $_name ==> $newName !--- NAME CHANGE ---! ');
      _name = newName;
    }
  }

  @override
  void performLayout() {
    print('!--- LAYOUT ---! $_name !--- LAYOUT ---!');
    super.performLayout();
  }
}
