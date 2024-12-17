import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/boisson.dart';
import 'package:provider/provider.dart';

class BuyButtonBoissonWidget extends StatelessWidget {
  final Boisson _boisson;

  const BuyButtonBoissonWidget(this._boisson,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<Cart>(context, listen: false);
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
              final cart = Provider.of<Cart>(context, listen: false);
              print('Commande de la boisson');
              cart.addBoisson(_boisson);
            },
          ),
        ],
      );
  }
}