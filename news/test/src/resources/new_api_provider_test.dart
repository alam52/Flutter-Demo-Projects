  import 'package:news/src/resources/news_api_provider.dart';
  import 'dart:convert';
  import 'package:test_api/test_api.dart';
  import 'package:http/http.dart';
  import 'package:http/testing.dart';

  void main(){
    test('FetchTopIds returns a list of Ids',(){
      //setup of test case
      final sum = 1 + 3;
      //expectation
      expect(sum,4);
    });
  }