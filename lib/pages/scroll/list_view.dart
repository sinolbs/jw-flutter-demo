import 'package:flutter/material.dart';

import '../../components/components.dart';

class ListViewScrollPage extends StatefulWidget {
  @override
  _ListViewScrollPageState createState() => _ListViewScrollPageState();
}

class _ListViewScrollPageState extends State<ListViewScrollPage> {
  final _controller = ScrollController();

  Future<Null> _refresh() {
    print('refreshed');
    return Future.value(null);
  }

  @override
  Widget build(BuildContext context) {
    final items = List<int>.generate(100, (i) => i + 1).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Scroll'),
      ),
      drawer: JWFDDrawer(),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          controller: _controller,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => ListTile(
                title: Text('Item ${items[index]}'),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.jumpTo(0),
        child: Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }
}