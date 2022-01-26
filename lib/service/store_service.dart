import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mask_stock/model/store.dart';

class StoreService {

  Future<List<Store>> getStock(double lat, double lng) async {
    List<Store>? storeList = [];

    // setState(() {
    //   // loadingBar가 다시 그려져야하기 때문에 -
    //   isLoading = true;
    // });

    var uri =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=$lat&lng=$lng';

    // get 방식이 비동기로 받아와 await 키워드가 존재하지 않을 시, response값 안에 데이터가 없을 수도 있다.
    var response = await http.get(Uri.parse(uri));

    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    final storeListData = jsonResult['stores'];

    // setState(() {
    // 변경된 상태일 때 화면을 다시 그려야함 -
    // 동일한 데이터가 쌓일 수 있으므로 한 번 clear 진행
    // storeList!.clear();  // 매번 fetch 함수를 호출 할 때 마다 재선언을 해주므로 clear는 필요 없는 부분

    storeListData.forEach((jsonData) {
      storeList.add(Store.fromJson(jsonData));
    });

    // isLoading = false;
    // });

    // log('Response statusCode :: ${response.statusCode}');  // 성공여부
    // log('Response body :: ${response.body}');  // 통신 데이터 출력
    // log('storeList json result :: ${jsonResult['stores']}'); // json형식 storeList

    return storeList.where((store) {
      return store.remainStat == 'plenty' ||
          store.remainStat == 'same' ||
          store.remainStat == 'same';
    }).toList();
  }

  Future<List<Store>> getSearchStock(String storeName) async {
    List<Store>? storeList = [];

    var uri =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';

    var response = await http.get(Uri.parse(uri));

    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    final storeListData = jsonResult['stores'];

    storeListData.forEach((jsonData) {
      storeList.add(Store.fromJson(jsonData));
    });

    return storeList;
  }
}
