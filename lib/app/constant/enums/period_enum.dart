/// Used to indicate the period of time which the most popular articles are to be
/// retrieved from API.
///
/// Options are: [day], [week] and [month]
enum Period {
  day(1),
  week(7),
  month(30);

  const Period(this.asInt);

  final int asInt;
}
