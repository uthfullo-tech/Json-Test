import 'package:flutter/material.dart';
import 'ListItem.dart';

class ListItemDetails extends StatefulWidget{

  final ListItem listItem;

  ListItemDetails(this.listItem){
    if(this.listItem == null){
      throw new ArgumentError("member of MemberWidget cannot be null. "
          "Received: '$listItem'");
    }
  }

  @override
  createState() => new ListItemDetailsState(listItem);
}


class ListItemDetailsState extends State<ListItemDetails>{

  final ListItem listItem;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  ListItemDetailsState(this.listItem);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List Details'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("id: "+listItem.id.toString() , style: _biggerFont,textAlign: TextAlign.left),
            new Text("name: "+listItem.name, style: _biggerFont),
            new Text("userName: "+listItem.userName, style: _biggerFont),

            new Padding(padding: new EdgeInsets.all(10.0)),
            new Text("Address:", style: _biggerFont ),
            new Text("street: "+listItem.street, style: _biggerFont),
            new Text("suite: "+listItem.suite, style: _biggerFont),
            new Text("city: "+listItem.city, style: _biggerFont),
            new Text("zipcode: "+listItem.zipcode, style: _biggerFont),

            new Padding(padding: new EdgeInsets.all(10.0)),
            new Text("Geo:",style: _biggerFont),
            new Text("lat: "+listItem.lat.toString(), style: _biggerFont),
            new Text("lng: "+listItem.lng.toString(), style: _biggerFont),

            new Padding(padding: new EdgeInsets.all(10.0)),
            new Text("Contacts:",style: _biggerFont),
            new Text("phone: "+listItem.phone, style: _biggerFont),
            new Text("website: "+listItem.website, style: _biggerFont),
          ],
        ),
      ),
    );
  }

}