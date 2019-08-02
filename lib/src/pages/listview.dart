import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();

    // This will trigger every time you detect a scroll.
    _scrollController.addListener(() {
      // If the scroll reaches the bottom of the page, add more images
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        //_addImages();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      ),
    );
  }

  Widget _createList () {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listNumbers.length,
      itemBuilder: ( BuildContext context, int index ) {

        final image = _listNumbers[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/id/$image/500/300'),
          placeholder: AssetImage('assets/loader.gif'),
        );
      },
    );
  }

  void _addImages () {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNumbers.add( _lastItem );
    }

    setState(() {
      
    });
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final _duration = new Duration( seconds:  2);
    return new Timer(_duration, reqHTTP);
  }

  void reqHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(
        milliseconds: 250
      )
    );

    _addImages();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _createLoading() {
    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}