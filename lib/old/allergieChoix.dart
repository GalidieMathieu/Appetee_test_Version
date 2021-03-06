import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageViewIndicators Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  var test2;


  final test = new DataList ("asset/400.jpg",  "blé", 10);


  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.amber,
    Colors.brown,
    Colors.yellow,
    Colors.blue,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CirclePageIndicator Demo'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            _buildPageView(),
            _buildCircleIndicator(),
          ],
        ),
      ],
    );
  }

  _buildPageView() {
    return Container(
      color: Colors.black87,
      height: _boxHeight,

      child: PageView.builder(
          itemCount: test.count,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: FlutterLogo(
                // colors: _items[index],
                size: 50.0,
              ),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: test.count,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}


class Data {
  final String product_pic;
  final String product_name;
  Data({this.product_pic, this.product_name});
}

class DataList {
  final List<Data> test = new List<Data>();
  final count;

  DataList(String productPic, String productName, this.count)
  {
    for(int i = 0 ; i < count ; ++i)
      {
        Data data = new Data(product_pic : productPic, product_name : productName);
        test.add(data);
      }
  }
}