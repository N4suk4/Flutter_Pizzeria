import 'package:flutter/material.dart';
import '../models/pizza.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;

  PizzaDetails(this._pizza, {Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._pizza.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          Text(widget._pizza.title),
          Image.asset(
            'assets/images/pizzas/${widget._pizza.image}',
            height: 180,
          ),
          Text('Recette'),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Text(
              widget._pizza.garniture,
            ),
          ),
          const Text('Pâte et tailleSélectionnées'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text('La pâte')),
              Expanded(child: Text('La sauce')),
            ],
          ),
          const Text('Sauce sélectionnées'),
          const Text('Les sauces'),
          Text('${widget._pizza.price} €'),
          _buildBuyButton(),
        ],
      ),
    );
  }

  _buildBuyButton() {
    return
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
              print('Commande de la pizza ${widget._pizza.title}');
            },
          ),
        ],
      );
  }
}