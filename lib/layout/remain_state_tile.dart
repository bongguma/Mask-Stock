import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_stock/model/store.dart';
import 'package:url_launcher/url_launcher.dart';


class ReaminStateTile extends StatelessWidget {
  final Store store;

  ReaminStateTile(this.store);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListTile(
      title: Text(store.name!),
      subtitle: Text(store.addr!),
      trailing: _buildremainState(store),
      onTap: () {
        _googleMapAction(store.lat!, store.lng!);
      },
    );
    // return _buildremainState(store);
  }

  _googleMapAction(num lat, num lng) async {
    final url = 'https://google.com/maps/search/?api=1&query=$lat,$lng';

    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw '지도 연결이 불가합니다.{$url}';
    }
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

}