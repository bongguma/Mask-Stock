import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_stock/model/store.dart';

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
  List<Store>? storeList = [];
  var isLoading = true;

  Future fetch() async {
    setState(() {
      // loadingBar가 다시 그려져야하기 떄문에 -
      isLoading = true;
    });
    var uri =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?name=%EB%8C%80%EC%A7%80%EC%95%BD%EA%B5%AD';

    // get 방식이 비동기로 받아와 await 키워드가 존재하지 않을 시, response값 안에 데이터가 없을 수도 있다.
    var response = await http.get(Uri.parse(uri));

    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    final storeListData = jsonResult['stores'];

    setState(() {
      // 변경된 상태일 때 화면을 다시 그려야함 -
      // 동일한 데이터가 쌓일 수 있으므로 한 번 clear 진행
      storeList!.clear();

      storeListData.forEach((jsonData) {
        storeList!.add(Store.fromJson(jsonData));
      });

      isLoading = false;
    });

    // log('Response statusCode :: ${response.statusCode}');  // 성공여부
    // log('Response body :: ${response.body}');  // 통신 데이터 출력
    // log('storeList json result :: ${jsonResult['stores']}'); // json형식 storeList
  }

  @override
  void initState() {
    super.initState();

    fetch();
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
          IconButton(icon: Icon(Icons.refresh), onPressed: fetch),
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
