abstract class YgStatesProperty<T extends Enum, V> {
  const YgStatesProperty();

  V resolve(Set<T> states);

  V lerp(double t, V from, V to) {
    if (t > 0.5) {
      return to;
    }

    return from;
  }
}
