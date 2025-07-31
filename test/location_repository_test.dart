import 'dart:math';

import 'package:flutter_mapsearch_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LocationRepository test', () async{ 
    LocationRepository locationRepository = LocationRepository(); // 객체를 변수에 담아서 보내줌
    final locations = await locationRepository.searchMaps('HYBE');
    expect(locations.isEmpty, false); // 비어있지 않을 것이기 때문에 false
    for (var location in locations) { // 진짜 값이 들어가 있는지 for문 돌림
      print(location.toJson());
    }
  });
}