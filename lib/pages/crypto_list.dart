import 'dart:async';
import 'dart:convert';

import 'package:crypto_tracker/UI/TickerListTile.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_tracker/utils/ticker.dart';
import 'package:flutter/material.dart';


class CryptoListingPage extends StatefulWidget {
  final String title = 'Crypto Listing';

  @override
  State<StatefulWidget> createState() => new CryptoListingPageState();

}

class CryptoListingPageState extends State<CryptoListingPage> {
  @override
  void initState() {
    super.initState();
}
  @override
  Widget build(BuildContext context) {

    var futureBuilder = new FutureBuilder(
      future: fetchTickers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createTickerListView(context, snapshot);
          }
        },
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title)
      ),
      body: futureBuilder,

    );
  }


  Future<List<CoinTicker>> fetchTickers() async {
    final response = await http.get('https://api.coinmarketcap.com/v2/ticker');
    final responseJson = json.decode(response.body)['data'];

    List tickers = new List<CoinTicker>();
    for(String id in responseJson.keys) {
      tickers.add(new CoinTicker.fromJson(responseJson[id]));
    }

    return tickers;
  }

  Widget createTickerListView(BuildContext context, AsyncSnapshot snapshot) {
    List<CoinTicker> tickers = snapshot.data;
    return new ListView.builder(
      itemCount: tickers.length,
      itemExtent: 82.0,
      padding: new EdgeInsets.symmetric(vertical: 10.0),
      itemBuilder:  (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new TickerListTile(tickers[index]),
            new Divider(height: 10.0, ),
          ],
        );
      },
    );
  }


}