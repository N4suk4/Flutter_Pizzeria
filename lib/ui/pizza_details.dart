import 'package:flutter/material.dart';
import 'package:pizzeria/models/option_item.dart';
import 'package:pizzeria/ui/share/buy_button_widget.dart';
import '../models/pizza.dart';
import './share/pizzeria_style.dart';
import './share/total_widget.dart';
import 'share/appbar_widget.dart';
import 'package:pizzeria/ui/bottom_navigation_bar_widget.dart';


class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;

  PizzaDetails(this._pizza, {Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();}

class _PizzaDetailsState extends State<PizzaDetails> {
  final title = 'Détails de la pizza';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          Text(
            'Pizza ${widget._pizza.title}',
            style:PizzeriaStyle.pagetitleTextStyle,
            ),
          Image.network(
            widget._pizza.image,
            height: 180,
          ),
          Text(
            'Recette',
            style: PizzeriaStyle.headerTextStyle,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Text(
              widget._pizza.garniture,
            ),
          ),
          Text(
            'Pâte et taille sélectionnées',
            style: PizzeriaStyle.headerTextStyle,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildDropDownPates()),
              Expanded(child: _buildDropDownTailles()),
            ],
          ),
          Text(
            'Sauce sélectionnées',
            style: PizzeriaStyle.headerTextStyle,
            ),
          Text(
            'Les sauces',
            style: PizzeriaStyle.regularTextStyle,
          ),
          _buildDropDownSauces(),
          Text('${widget._pizza.price} €'),
          TotalWidget(widget._pizza.total),
          BuyButtonWidget(widget._pizza),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(2),
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

  _buildDropDownPates() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.pates[widget._pizza.pate],
      items: _buildDropDownItem(Pizza.pates),
      onChanged: (item) {
        setState((){
          widget._pizza.pate = item!.value;
        });
      }
    );
  }

  _buildDropDownTailles() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.tailles[widget._pizza.taille],
      items: _buildDropDownItem(Pizza.tailles),
      onChanged: (item) {
        setState((){
          widget._pizza.taille = item!.value;
        });
      }
    );
  }

  _buildDropDownSauces() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.sauces[widget._pizza.sauce],
      items: _buildDropDownItem(Pizza.sauces),
      onChanged: (item) {
        setState((){
          widget._pizza.sauce = item!.value;
        });
      }
    );
  }

  _buildDropDownItem(List<OptionItem> list) {
    return Iterable.generate(
      list.length,
      (i) => DropdownMenuItem<OptionItem>(
        value: list[i],
        child: Text(list[i].name),
      ),
    ).toList();
  }
}