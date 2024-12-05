import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';
import 'models/menu.dart';
import 'ui/pizza_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Pizzéria'),
      title: 'Pizzéria',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  Cart _cart;

  MyHomePage({required this.title, Key? key}) :
    _cart = Cart(), 
    super(key: key);
    

  final _menus = [
  Menu(type: 1, title: 'Entrées', image: 'entree.png', color: Colors.lightGreen),
  Menu(type: 2, title: 'Pizzas', image: 'pizza.png', color: Colors.redAccent),
  Menu(type: 3, title: 'Desserts', image: 'dessert.png', color: Colors.brown),
  Menu(type: 4, title: 'Boissons', image: 'boisson.png', color: Colors.lightBlue),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title, _cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch (_menus[index].type) {
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PizzaList(_cart)),
                  );
                  break;
              }
            },
            child: _buildRow(_menus[index]),
          ),
          itemExtent: 180,
        ),
      ),
    );
  }

  _buildRow(Menu menu) {
    return Container(
      height:180,
      decoration: BoxDecoration(
        color: menu.color,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/menus/${menu.image}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: 50,
            child: Center(
              child: Text(
                menu.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}