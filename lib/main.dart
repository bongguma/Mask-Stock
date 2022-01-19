import 'package:flutter/material.dart';
import 'package:mask_stock/model/store.dart';
import 'package:mask_stock/service/store_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storeService = StoreService();
  List<Store>? storeList = [];
  var isLoading  = false;

  @override
  void initState() {
    super.initState();

    // then -> fetch 함수가 이뤄진 다음 이루어져야하는 부분
    storeService.fetch().then((fetchStores) {
      setState(() {
        storeList = fetchStores;
      });
    });
  }

  Widget _buildremainState(Store store) {
    var remainState = '판매중지';
    var description = '';
    var color = Colors.black;

    switch (store.remainStat) {
      case 'plenty':
        remainState = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainState = '보통';
        description = '30개 이상';
        color = Colors.yellow;
        break;
      case 'few':
        remainState = '부족';
        description = '2~30개';
        color = Colors.red;
        break;
      case 'empty':
        remainState = '소진임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
    }

    return Column(
      children: <Widget>[
        Text(
          remainState,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 존재 장소 전체 : ${storeList!.where((store) {
          return store.remainStat == 'plenty' ||
              store.remainStat == 'same' ||
              store.remainStat == 'same';
        }) .length}'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            storeService.fetch().then((fetchStores) {
              setState(() {
                storeList = fetchStores;
              });
            });
          } ),
        ],
      ),
      body: !isLoading
          ? ListView(
              children: storeList!.where((store) {
                return store.remainStat == 'plenty' ||
                    store.remainStat == 'same' ||
                    store.remainStat == 'same';
              }) // where 조건에 맞는 데이터만 map으로 list 변환된다.
                  .map((store) {
                return ListTile(
                  title: Text(store.name!),
                  subtitle: Text(store.addr!),
                  trailing: _buildremainState(store),
                );
              }).toList(),
            )
          : LoadingBar(),
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
