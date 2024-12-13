import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/menu.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  var format = NumberFormat('###.00 €');

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>(); 
    return ListView.builder(
      itemCount: cart.TotalItems(),
      itemBuilder: (context, index) {
        var item = cart.getCartItem(index);
        return _buildCartItems(item);
      },
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