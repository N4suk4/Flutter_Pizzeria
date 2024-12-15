import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import 'package:pizzeria/ui/bottom_navigation_bar_widget.dart';

class Panier extends StatefulWidget {

  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  var format = NumberFormat("###.##€");

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.totalItems(),
              itemBuilder: (context, index) =>
                  _buildCartItems(cart.getCartItem(index)),
            ),
          ),
          Table(
            children: [
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(left: 50),
                ),
                const Text("TOTAL HT"),
                Text(format.format(cart.prixTotal()))
              ]),
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(left: 50),
                ),
                const Text("TVA"),
                Text(format.format(cart.prixTotal() * 0.1))
              ]),
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(left: 50),
                ),
                const Text("TOTAL TTC"),
                Text(format.format(cart.prixTotal() * 1.1))
              ])
            ],
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  print("Clear");
                },
                child: const Text('Valider')),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
    );
  }

  _buildCartItems(CartItem item) {
    return Row(
      children: [
        Image(
          image: NetworkImage(item.pizza.image),
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
