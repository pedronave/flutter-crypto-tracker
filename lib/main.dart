import 'package:flutter/material.dart';

import 'pages/crypto_list.dart';

void main() {
  runApp(new MaterialApp(
    title: "Crypto Tracker",
    theme: new ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: new CryptoListingPage()
  ));
}