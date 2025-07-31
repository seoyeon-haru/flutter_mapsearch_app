import 'package:flutter_mapsearch_app/data/model/location.dart';
import 'package:flutter_mapsearch_app/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 클래스 만들기
class HomeState {
  List<Location> locations;
  HomeState(this.locations);
}

// 2. 뷰 모델 만들기 - Notifier 상속
// Notifier 상속할 때 뷰 모델이 어떤 상태를 관리하는지 제네릭으로 명시
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]); // 검색하기 전에 최초의 상태는 location이 비어있을테니 빈 리스트로 초기화
  }

  Future<void> searchMaps(String query) async {
    // 텍스트 입력받을 수 있게 파라미터로 전달
    final locationRepository = LocationRepository();
    // view로부터 전달받은 쿼리 스트링을 searchMaps 메서드를 통해서 결과를 가지고 오게 한다.
    final locations = await locationRepository.searchMaps(query);
    // 결과를 가져왔으니 상태를 업데이트 해줘야 한다.
    // state에 바로 할당해도 되지만 새로운 객체를 만들어서 새로운 객체 안에 할당한다.
    state = HomeState(locations);
  }
}

// 3. ViewModel 관리자 만들기
// Provider는 관리자
// NotifierProvider 객체를 생성해주고 어떤 뷰모델을 관리하는지의 타입과 어떤 상태를 가지고 있는지 명시
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel(); // 객체 안에서 HomeViewModel 생성해주는 함수 넣어줌
});
