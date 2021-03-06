import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_stock/layout/remain_state_tile.dart';
import 'package:mask_stock/model/store.dart';
import 'package:mask_stock/viewmodel/store_vm.dart';
import 'package:provider/provider.dart';

class StockListScreen extends StatelessWidget {
  // @override
  // void initState() {
  //   super.initState();

  // then -> fetch 함수가 이뤄진 다음 이루어져야하는 부분
  //   storeService.fetch().then((fetchStores) {
  //     setState(() {
  //       storeList = fetchStores;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final storeViewModel = Provider.of<StoreViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            Text('마스크 재고 존재 장소 전체 : ${storeViewModel.storeList.length}곳'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              child: Text(
                '검색',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              )),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // 새로고침 기능
                storeViewModel.getStock();
              }),
        ],
      ),
      body: SafeArea(
        child: !storeViewModel.isLoading
            ? ListView(
                children: storeViewModel.storeList // where 조건에 맞는 데이터만 map으로 list 변환된다.
                    .map((store) {
                  return ReaminStateTile(store);
                }).toList(),
              )
            : LoadingBar(),
      ),
    );
  }
}

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('데이터를 불러오는 중 ...'),
          SizedBox(
            height: 10.0,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

/*
* widget 분리 시, function으로 분리하는 것보다 class로 분리한다.
* function은 widget tree가 인식하지 못 한다는 단점과
* function으로 rebuild 시, function 전체가 reubild 된다.
* class 분리에는 rebuild 시, 재빌드 되야하는 부분만 재빌드된다.
* */
class TestTextContainer extends StatelessWidget {
  const TestTextContainer({Key? key, var storeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () async {
          // await fetch();

          // 만약 내가 여기서 storeList 데이터를 출력하고 싶을 때에는 onPressed 비동기가 필수
          // log('storeList :: ${storeList!.toString()}');
        },
        child: Text('Click!!'),
      ),
    );
  }
}
