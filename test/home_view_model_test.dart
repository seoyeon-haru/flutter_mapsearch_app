import 'package:flutter_mapsearch_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HomeViewModel test', () async{
    // 앱 내에서는 providerContainer 안에서 뷰 모델을 관리
    // 테스트 환경에서 widget을 생성하지 않고 테스트 할 수 있게 providerContainer 제공
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(homeViewModelProvider.notifier);
    // 처음 HomeViewModel의 상태 => 빈 리스트인걸 테스트
    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.locations.isEmpty, true); // 실제 값이 비어있는지 테스트 한다
    // HomeViewModel에서 searchMaps 메서드 호출 후 상태가 변경이 정상적으로 되는지 테스트
    await homeVm.searchMaps('HYBE');
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.locations.isEmpty, false);

    afterState.locations.forEach((action) {
      print(action.toJson());
    });
    });
}