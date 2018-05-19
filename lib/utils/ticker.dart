class CoinTicker {
  final String name;
  final String symbol;
  final int rank;
  final double price;
  final double percentChangeHour;
  final double percentChangeDay;
  final double percentChangeWeek;

  CoinTicker.fromJson(Map<String, dynamic> jsonMap) :
      name = jsonMap['name'],
      symbol = jsonMap['symbol'],
      rank = jsonMap['rank'],
      price = jsonMap['quotes']['USD']['price'],
      percentChangeWeek = jsonMap['quotes']['USD']['percent_change_7d'],
      percentChangeDay = jsonMap['quotes']['USD']['percent_change_24h'],
      percentChangeHour = jsonMap['quotes']['USD']['percent_change_1h'];

  String toString() => name;
}


