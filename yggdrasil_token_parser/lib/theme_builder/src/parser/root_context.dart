part of 'parsing_context.dart';

class RootContext extends ParsingContext with JsonParseMixin {
  RootContext() : super._root();

  /// Recursively visit child contexts.
  void visitChildrenRecursively(void Function(ParsingContext child) visitor, {bool validOnly = false}) {
    void loop(ParsingContext context) {
      if (validOnly && !context.isValid) {
        return;
      }

      visitor(context);
      for (final ParsingContext child in context.children.values) {
        loop(child);
      }
    }

    loop(this);
  }

  bool validateRawDataRecursively() {
    bool fullyValid = true;

    visitChildrenRecursively((ParsingContext child) {
      fullyValid &= child.validateRawData();
    });

    return fullyValid;
  }
}
