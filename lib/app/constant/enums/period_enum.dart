enum Period {
  day(1),
  week(7),
  month(30);

  const Period(this.asInt);

  final int asInt;
}
