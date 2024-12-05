import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  var format = NumberFormat("###.##€");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget._cart.TotalItems(),
              itemBuilder: (context, index) =>
                  _buildCartItems(widget._cart.getCartItem(index)),
            ),
          ),
          Table(
            children: [
              TableRow(children: [
                Container(
                  padding: EdgeInsets.only(left: 50),
                ),
                Text("TOTAL HT"),
                Text(format.format(widget._cart.prixTotal()))
              ]),
              TableRow(children: [
                Container(
                  padding: EdgeInsets.only(left: 50),
                ),
                Text("TVA"),
                Text(format.format(widget._cart.prixTotal() * 0.1))
              ]),
              TableRow(children: [
                Container(
                  padding: EdgeInsets.only(left: 50),
                ),
                Text("TOTAL TTC"),
                Text(format.format(widget._cart.prixTotal() * 1.1))
              ])
            ],
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  print("Clear");
                },
                child: Text('Valider')),
          )
        ],
      ),
    );
  }

  _buildCartItems(CartItem item) {
    return Row(
      children: [
        Image(
          image: AssetImage('assets/images/pizzas/${item.pizza.image}'),
          height: 100,
        ),
        Column(
          children: [
            Text(
              item.pizza.title,
              style: PizzeriaStyle.headerTextStyle,
            ),
            Row(
              children: [
                Text(
                  '${item.pizza.total} €',
                  style: PizzeriaStyle.subPriceTotalTextStyle,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          item.quantity--;
                        });
                        print("${item.quantity}");
                      },
                    ),
                    Text('${item.quantity}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          item.quantity++;
                        });
                        print("${item.quantity}");
                      },
                    ),
                  ],
                )
              ],
            ),
            Text(
              'Sous-Total: ${item.quantity * item.pizza.total} €',
              style: PizzeriaStyle.priceTotalTextStyle,
            )
          ],
        )
      ],
    );
  }
}
