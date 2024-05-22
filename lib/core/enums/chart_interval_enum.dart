enum ChartIntervalEnum {
  oneSecond('1s', '1s'),
  oneMinute('1m', '1m'),
  fifteenMinutes('15m', '15m'),
  oneHour('1H', '1h'),
  twoHours('2H', '2h'),
  fourHours('4H', '4h'),
  oneDay('1D', '1d'),
  oneWeek('1W', '1w'),
  oneMonth('1M', '1M');

  final String name;
  final String value;

  const ChartIntervalEnum(this.name, this.value);
}
