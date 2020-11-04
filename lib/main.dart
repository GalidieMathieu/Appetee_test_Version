import 'package:flutter/material.dart';
import 'package:flutter_app/app2.dart';
import 'package:flutter_app/allergieChoix.dart';
import 'package:flutter_app/WelcomeScreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: FirstRoute(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('test'),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.orangeAccent),
        child: Products(),
      ),
    );
  }
}

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final list_item = [
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"},
    {"name": "test", "pic": "asset/400.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(top: 10, left: 10.0, right: 10.0, bottom: 10),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    itemCount: list_item.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 3
                            : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.5),
                    itemBuilder: (BuildContext context, int index) {
                      return Product(
                        product_pic: list_item[index]['pic'],
                        product_name: list_item[index]['name'],
                      );
                    })),
            Container(
                color: Colors.blue,
                margin: const EdgeInsets.only(
                    bottom: 200, top: 30, left: 10.0, right: 10.0),
                child: IntrinsicWidth(
                    child: Center(
                  child: Text('test2'),
                )))
          ]),
    );
  }
}

class Product extends StatelessWidget {
  final product_pic;
  final product_name;
  var _color = Colors.white;

  Product({this.product_pic, this.product_name});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          border: Border.all( color: _color, width: 8,),

          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
            onTap: () {
              _color = Colors.red;
            },
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: product_name,
                      child: Material(
                        child: GridTile(
                          child: Image.asset(
                            product_pic,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, top: 10, left: 10.0, right: 10.0),
                      child: Center(
                        child: Text(product_name),
                      ))
                ])));
  }
}
