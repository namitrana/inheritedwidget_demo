import 'package:flutter/material.dart';
//webhook configured....
void main(){
  runApp(MyApp());
}

class CartState extends InheritedWidget{

  CartState({Key key, this.count, this.addCart, this.removeCart, Widget child})
      : super(key: key, child: child);

  final int count;
  final Function addCart;
  final Function removeCart;

  @override
  bool updateShouldNotify(covariant CartState oldWidget) {
    return count != oldWidget.count;
  }

  ///We are creating the context in the root directory so that we can access
  ///the root widget directly and fetch the properties from any of the descendants
  ///from any widget deep down.
  ///
  static CartState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartState>();
  }
  
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFF167F67),
      ),
      title: "Inherited Widget",
      home: RootWidget(),
    );
  }

}

class RootWidget extends StatefulWidget{
    @override
    _RootWidgetState createState(){
      return _RootWidgetState();
    }
}

class _RootWidgetState extends State{

  int count = 0;

  void addCart(){
    setState(() {
        count++;
    });
  }

  void removeCart(){
     setState(() {
       count--;
     });
  }

  Widget build(BuildContext){
    return CartState(
      count: count,
      addCart: addCart,
      removeCart: removeCart,
      child: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterState = CartState.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF167F67),
        title: Text(
          'InheritedWidget',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: const Color(0xFFFFFFFF),
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 5),
                child: CircleAvatar(
                  radius: 10.0,
                  child: Text(
                    '${CartState.of(context).count}',
                    style: TextStyle(fontSize: 15, color: const Color(0xFFFFFFFF),),
                  ),
                  backgroundColor: const Color(0xFFA11B00),
                ),
              ),
            ],
          )
        ],
      ),

      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ItemsSection(),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: new FloatingActionButton(
                onPressed: counterState.addCart,
                child: new Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: new FloatingActionButton(
                onPressed: counterState.removeCart,
                child: new Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterState = CartState.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Items in cart: ${counterState.count}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}