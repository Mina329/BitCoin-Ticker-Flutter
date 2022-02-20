import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

const apikey = '708EDBF1-4DF1-4F4D-A5B8-05DDA12D51D1' ;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData  {
  Future<double> getCoinData(String value) async {
    http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$value?apikey=$apikey'));
    if(response.statusCode == 200){
      var JsonBody =response.body;
      var DecodedData =await jsonDecode(JsonBody);
      return DecodedData['rate'];
    }else{
      print(response.statusCode);
      return 0 ;
    }
  }
}
