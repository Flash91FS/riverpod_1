

//an extension method that works on any value as long as it is a 'num' and we want it to work on optional (nullable) objects of that type
extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}