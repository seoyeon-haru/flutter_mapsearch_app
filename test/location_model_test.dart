import 'dart:convert';

import 'package:flutter_mapsearch_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Location model test', () {
    String dummydate = """
{
      "title": "<b>HYBE</b>",
      "link": "",
      "category": "엔터테인먼트>연예기획사",
      "description": "",
      "telephone": "",
      "address": "서울특별시 용산구 한강로3가 65-9",
      "roadAddress": "서울특별시 용산구 한강대로 42",
      "mapx": "1269641900",
      "mapy": "375245525"
}
""";
    // 1. Map 으로 변환
    Map<String, dynamic> map = jsonDecode(dummydate);

    // 2. 객체로 변환
    Location location = Location.fromJson(map);
    expect(location.mapy, "375245525");
    print(location.toJson());
  });
}
