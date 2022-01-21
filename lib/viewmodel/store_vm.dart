import 'package:flutter/cupertino.dart';
import 'package:mask_stock/model/store.dart';
import 'package:mask_stock/service/store_service.dart';

class StoreViewModel with ChangeNotifier {
  List<Store> storeList = [];
  var isLoading  = false;

  final _storeService = StoreService();

  // storeViewModel 생성할 떄, 생성자 안에서 fetch() 함수가 한 번 실행 될 수 있겠금 함.
  StoreViewModel() {fetch();}

  Future? fetch() async {
    isLoading = true;
    notifyListeners(); // Loading 화면 변경이 있음으로 listener로 통제해줘야한다.

    storeList = await _storeService.fetch();
    isLoading = false;
    notifyListeners(); // 데이터리스트가 보여야하므로 listener로 통제를 해줘야한다.
  }
}