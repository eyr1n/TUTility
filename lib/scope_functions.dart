extension ScopeFunctions<T> on T {
  R let<R>(R Function(T) block) {
    return block(this);
  }

  T also(void Function(T) block) {
    block(this);
    return this;
  }
}
