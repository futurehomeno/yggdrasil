// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  static const String routeName = 'TestScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TestScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgLayoutTabbed(
      tabs: <YgLayoutTab>[
        YgLayoutTab(
          title: 'Scrollable',
          content: YgLayoutBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                for (int i = 0; i < 20; i++)
                  Container(
                    color: i % 2 == 0 ? Colors.red : Colors.blueAccent,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(i.toString()),
                  ),
              ],
            ),
          ),
        ),
        YgLayoutTab(
          title: 'Sliver',
          content: YgSliverLayoutBody(
            sliver: SliverList.builder(itemBuilder: (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.amber : Colors.purple,
                height: 100,
                alignment: Alignment.center,
                child: Text(index.toString()),
              );
            }),
          ),
        ),
        const YgLayoutTab(
          title: 'Centered',
          content: YgLayoutBody(
            child: ColoredBox(
              color: Colors.pink,
              child: Center(
                child: Text(
                  'Centered content',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        YgLayoutTab(
          title: 'Sticky',
          content: YgLayoutBody(
            footer: YgButtonGroup.vertical(
              children: <YgButton>[
                YgButton(
                  variant: YgButtonVariant.link,
                  child: const Text('Previous'),
                  onPressed: () {},
                ),
                YgButton(
                  child: const Text('Next'),
                  onPressed: () {},
                ),
              ],
            ),
            child: const ColoredBox(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Centered content',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        YgLayoutTab(
          title: 'PushDown',
          content: YgLayoutBody(
            footerBehavior: YgFooterBehavior.pushDown,
            footer: YgButtonGroup.vertical(
              children: <YgButton>[
                YgButton(
                  variant: YgButtonVariant.link,
                  child: const Text('Previous'),
                  onPressed: () {},
                ),
                YgButton(
                  child: const Text('Next'),
                  onPressed: () {},
                ),
              ],
            ),
            child: const DemoPlaceholder(
              height: 2000,
            ),
          ),
        ),
      ],
      appBar: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.green,
          height: 64,
          alignment: Alignment.center,
          child: const Text(
            'AppBar',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

// class YgLayoutTabbed extends StatefulWidget {
//   const YgLayoutTabbed({
//     super.key,
//     required this.tabs,
//     required this.appBar,
//     this.initialTab = 0,
//   });

//   final int initialTab;
//   final List<YgLayoutTab> tabs;
//   final Widget appBar;

//   @override
//   State<YgLayoutTabbed> createState() => _YgLayoutTabbedState();
// }

// class _YgLayoutTabbedState extends State<YgLayoutTabbed> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: DefaultTabController(
//         length: widget.tabs.length,
//         child: YgLayoutRenderWidget(
//           children: <Widget>[
//             TabBarView(
//               children: <Widget>[
//                 for (final YgLayoutTab tab in widget.tabs) tab.content,
//               ],
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 widget.appBar,
//                 YgTabBar(
//                   tabs: <YgTab>[
//                     for (final YgLayoutTab tab in widget.tabs)
//                       YgTab(
//                         label: tab.title,
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class YgLayoutRenderWidget extends MultiChildRenderObjectWidget {
//   const YgLayoutRenderWidget({
//     super.key,
//     super.children,
//   });

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return YgLayoutRenderer();
//   }
// }

// class YgLayoutRendererParentData extends ContainerBoxParentData<RenderBox> {}

// class YgLayoutRenderer extends RenderBox
//     with
//         ContainerRenderObjectMixin<RenderBox, YgLayoutRendererParentData>,
//         RenderBoxContainerDefaultsMixin<RenderBox, YgLayoutRendererParentData> {
//   Size? _appBarSize;
//   Size get appBarSize => _appBarSize ?? Size.zero;

//   @override
//   void setupParentData(covariant RenderObject child) {
//     child.parentData = YgLayoutRendererParentData();
//   }

//   @override
//   void performLayout() {
//     final List<RenderBox> children = getChildrenAsList();
//     final RenderBox appBar = children.last;
//     final RenderBox content = children.first;

//     appBar.layout(
//       BoxConstraints(
//         minHeight: 0,
//         maxHeight: constraints.maxHeight,
//         maxWidth: constraints.maxWidth,
//         minWidth: constraints.maxWidth,
//       ),
//       parentUsesSize: true,
//     );

//     _appBarSize = appBar.size;

//     content.layout(
//       BoxConstraints.tight(
//         constraints.smallest,
//       ),
//     );

//     size = constraints.biggest;

//     print(size);
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     defaultPaint(context, offset);
//   }

//   @override
//   bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
//     return defaultHitTestChildren(result, position: position);
//   }
// }

// class YgLayoutContentRenderWidget extends SingleChildRenderObjectWidget {
//   const YgLayoutContentRenderWidget({
//     super.key,
//     super.child,
//   });

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return YgLayoutContentRenderer();
//   }
// }

// class YgLayoutContentRenderer extends YgRenderProxyBoxWithOffsetChild {
//   @override
//   void performLayout() {
//     final RenderBox? child = this.child;
//     if (child == null) {
//       size = constraints.smallest;

//       return;
//     }

//     final YgLayoutRenderer? layout = getLayout();

//     final EdgeInsets padding;
//     final double minHeight;
//     if (layout == null) {
//       padding = EdgeInsets.zero;
//       minHeight = 0;
//     } else {
//       print('layout.constraints.maxHeight: ${layout.constraints.maxHeight}');
//       final double topPadding = layout.appBarSize.height;
//       padding = EdgeInsets.only(
//         top: topPadding,
//       );
//       minHeight = layout.constraints.maxHeight - topPadding;
//     }

//     final BoxConstraints childConstraints = BoxConstraints(
//       minHeight: min(minHeight, constraints.maxHeight),
//       maxHeight: constraints.maxHeight,
//       maxWidth: constraints.maxWidth,
//       minWidth: constraints.minWidth,
//     );

//     print('childConstraints: $childConstraints');

//     child.layout(
//       childConstraints,
//       parentUsesSize: true,
//     );

//     (child.parentData as BoxParentData).offset = padding.topLeft;

//     size = padding.inflateSize(child.size);
//   }

//   YgLayoutRenderer? getLayout() {
//     for (RenderObject? parent = this.parent; parent != null; parent = parent.parent) {
//       if (parent is YgLayoutRenderer) {
//         return parent;
//       }
//     }

//     return null;
//   }
// }

// class YgLayoutTab {
//   const YgLayoutTab({
//     required this.title,
//     required this.content,
//   });

//   final String title;
//   final Widget content;
// }

// abstract class YgRenderProxyBoxWithOffsetChild extends RenderProxyBox {
//   @override
//   void setupParentData(covariant RenderObject child) {
//     if (child.parentData is! BoxParentData) {
//       child.parentData = BoxParentData();
//     }
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     final RenderBox? child = this.child;
//     if (child == null) {
//       return;
//     }

//     final BoxParentData parentData = child.parentData as BoxParentData;
//     context.paintChild(child, parentData.offset + offset);
//   }

//   @override
//   bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
//     final RenderBox? child = this.child;
//     if (child == null) {
//       return false;
//     }

//     final BoxParentData parentData = child.parentData as BoxParentData;

//     return result.addWithPaintOffset(
//       offset: parentData.offset,
//       position: position,
//       hitTest: (BoxHitTestResult result, Offset transformed) {
//         return child.hitTest(
//           result,
//           position: transformed,
//         );
//       },
//     );
//   }

//   @override
//   void applyPaintTransform(covariant RenderObject child, Matrix4 transform) {
//     // TODO: implement applyPaintTransform
//     super.applyPaintTransform(child, transform);
//   }

//   @override
//   double? computeDistanceToActualBaseline(TextBaseline baseline) {
//     final RenderBox? child = this.child;
//     if (child == null) {
//       return 0.0;
//     }

//     final double? result = child.getDistanceToActualBaseline(baseline);
//     if (result != null) {
//       final BoxParentData parentData = child.parentData as BoxParentData;

//       return result + parentData.offset.dy;
//     }

//     return null;
//   }
// }

// class YgLayoutBody extends StatelessWidget {
//   const YgLayoutBody({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: Colors.cyan,
//       child: SingleChildScrollView(
//         child: RepaintBoundary(
//           child: YgLayoutContentRenderWidget(
//             child: SafeArea(
//               top: false,
//               child: child,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
