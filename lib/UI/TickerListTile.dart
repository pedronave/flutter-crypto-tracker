import 'package:crypto_tracker/utils/ticker.dart';
import 'package:flutter/material.dart';


class TickerListTile extends StatelessWidget {
  final CoinTicker _ticker;

  TickerListTile(this._ticker);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title:
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
               children: <Widget>[
                 new Text(
                     _ticker.symbol,
                     style: new TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.w700,
                     )
                 ),
                 new Container(
                   padding: new EdgeInsets.symmetric(horizontal: 2.0),
                   child: new Text(
                       "|",
                       style: new TextStyle(
                         fontSize: 20.0,
                         fontWeight: FontWeight.w300,
                       )
                   ),
                 ),
                 new Text(
                     _ticker.name,
                     style: new TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.w300,
                     )
                 ),

               ],
              ),
              new Text(
                _ticker.price.toString() + "\$",
                textAlign: TextAlign.end,
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,

                ),
              ),
            ]
        ),
        subtitle: new Container(
            padding: new EdgeInsets.only(top: 15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                createPercentText("1h", _ticker.percentChangeHour),
                createPercentText("24h", _ticker.percentChangeDay),
                createPercentText("7d", _ticker.percentChangeWeek),
              ],
            )
        )
    );
  }

  Widget createPercentText(String time, double percentChange){
    String displayText;
    Color textColor;
    if( percentChange > 0.0 ) {
      displayText= "+" + percentChange.toStringAsFixed(2) + "%";
      textColor = Colors.green[300];
    }else{
      displayText = percentChange.toStringAsFixed(2) + "%";
      textColor = Colors.red[600];
    }
    return new Row(
      children: <Widget>[
        new Text(
          time + ": ",
          style: new TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        new Text(
          displayText,
          style: new TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );

  }

}