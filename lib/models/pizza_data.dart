import '/models/pizza.dart';
class PizzaData {

  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, 'Barbecue', 'Sauce barbecue, mozzarella, poulet, oignons, poivrons', 'pizza-bbq.jpg', 8));
    list.add(Pizza(2, 'Hawaienne', 'De l\'ananas sur une pizza est une abhération, elle merite d\'être chère', 'pizza-hawai.jpg', 80));
    list.add(Pizza(3, 'Epinards', 'Sauce tomate, mozzarella, épinards, champignons, olives', 'pizza-spinach.jpg', 7));
    list.add(Pizza(4, 'Végétarienne', 'Sauce tomate, mozzarella, poivrons, oignons, champignons, olives', 'pizza-vegetable.jpg', 10));
    return list;
  }
}