part of yg_states;

/// A helper class to simplify using [YgStyle].
abstract class StateWithYgStateAndStyle<Widget extends StatefulWidget, VisualState extends YgState,
        Style extends YgStyle<VisualState>> extends State<Widget>
    with
        TickerProviderStateMixin<Widget>,
        YgVsyncMixin<Widget>,
        YgStyleBuilderMixin<Widget, Style>,
        YgStateBuilderMixin<Widget, VisualState> {}
