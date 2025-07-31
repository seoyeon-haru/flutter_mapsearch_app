import 'dart:convert';

import 'package:flutter_mapsearch_app/data/model/location.dart';
import 'package:http/http.dart';

class LocationRepository { // 통신의 기본은 비동기 
  Future<List<Location>> searchMaps(String query) async { // searchMaps 함수 호출할 때 query 넘겨받을 수 있게 파라미터 추가
    final client = Client(); // http 사용법은 우선 클라이언트 객체 생성
    final response = await client.get( // 객체를 생성했다면 클라이언트 get 메서드 안에
        Uri.parse( // uri 클래스에 parse라는 static 함수 이용하여 테스트 할 때 작성했던 요청할 URL 작성
            'https://openapi.naver.com/v1/search/local.json?query=$query'), // URL에 $표시해서 query 바로 추가할 수 있게 해주기
        headers: { // headers 파라미터에 Map 타입으로 발급받은 API 넣어주기
          'X-Naver-Client-Id': ,
          'X-Naver-Client-Secret': ,
        });
        if (response.statusCode == 200) { // 응답 코드
          Map<String,dynamic> map = jsonDecode(response.body); // 응답 데이터
          final items = List.from(map['items']); // List에서 Map을 호출하게 되면 return 타입이 Iterable이 됨
          final iterable = items.map((e){
            return Location.fromJson(e);
          });
          final list = iterable.toList();
          return list;
        }
        return []; // if 문 안에서만 return을 해주면 searchMap에 오류가 발생하기 때문에 여기에도 return
  }
}
