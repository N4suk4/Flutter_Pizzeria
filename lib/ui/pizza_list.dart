import 'package:flutter/material.dart';
import '../models/pizza.dart';
import '../models/pizza_data.dart';

class PizzaList extends StatefulWidget {
  List<Pizza> _pizzas = [];

  @override
  State<PizzaList> createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  List<Pizza> _pizzas = [];
  
  @override
  void initState() {
    _pizzas = PizzaData.buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nos Pizzas'),
      ),
      body: ListView.builder(
        padding:const EdgeInsets.all(8.0),
        itemCount: _pizzas.length,
        itemBuilder: (context, index) {
          return _buildRow(_pizzas[index]);
          }
        )
      );
  }

  _buildRow(Pizza pizza) {
    return Card(
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom:Radius.circular(10.0),
          top: Radius.circular(2.0),
        ),
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(pizza.title),
          subtitle: Text(pizza.garniture),
          leading: const Icon(Icons.local_pizza),
        ),
        Image.asset(
          'assets/images/pizzas/${pizza.image}',
          height: 120,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(pizza.garniture),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: 
                  MaterialStateProperty.all<Color>(Colors.red.shade800)),
              child: const Row(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 5),
                  Text('Commander'),
                ],
              ),
              onPressed: () {
                print('Commande de la pizza ${pizza.title}');
              },
            )
          ],
        )
      ],
    )
    );
  }
}