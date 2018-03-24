import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ListItem.dart';
import 'ListItemDetail.dart';


class PersonList extends StatefulWidget{

  @override
  createState() => new _PersonListState();
}


class _PersonListState extends State<PersonList>{

  var _items = <ListItem>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallFont = const TextStyle(fontSize: 13.0);

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Json Test'),
      ),
      body: new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _items.length * 2,
          itemBuilder: (BuildContext context, int position){

            if(position.isOdd){
              return new Divider();
            }
            else{
              int index = position ~/2;
              return _buildRow(index);
            }

          }
      ),
    );
  }


  _loadData()async{

    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(url);
    setState((){
      final membersJSON = JSON.decode(response.body);
      for(var memberJSON in membersJSON){
        var item = new ListItem();
        item.id = memberJSON['id'];
        item.name = memberJSON['name'];
        item.userName = memberJSON['username'];
        item.email = memberJSON['email'];

        var address = memberJSON['address'];
        item.street = address['street'];
        item.suite = address['suite'];
        item.city = address['city'];
        item.zipcode = address['zipcode'];

        var geo = address['geo'];
        item.lat = geo['lat'];
        item.lng = geo['lng'];

        item.phone = memberJSON['phone'];
        item.website = memberJSON['website'];

        _items.add(item);
      }
    });

  }

  _pushItemDetail(ListItem listItem){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => new ListItemDetails(listItem))
    );
  }

  Widget _buildRow(int i){

    return new ListTile(
      title: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("${_items[i].name}", style: _biggerFont,),
          new Text("${_items[i].email}", style: _smallFont,)
        ],
      ),
      
      onTap: (){
        _pushItemDetail(_items[i]);
      }

    );
  }


}
