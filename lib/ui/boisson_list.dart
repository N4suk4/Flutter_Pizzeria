import 'package:flutter/material.dart';
import 'package:pizzeria/services.dart/pizzeria_service.dart';
import '../models/boisson.dart';
import 'boisson_details.dart';
import 'package:pizzeria/ui/bottom_navigation_bar_widget.dart';
import 'package:pizzeria/ui/share/buy_button_boisson_widget.dart';

class BoissonList extends StatefulWidget {
  const BoissonList({Key? key}) : super(key: key);

  @override
  State<BoissonList> createState() => _BoissonListState();
}

class _BoissonListState extends State<BoissonList> {
  late Future<List<Boisson>> _boissons;
  final PizzeriaService _service = PizzeriaService();

  @override
  void initState() {
    super.initState();
    _boissons = _service.fetchBoissons();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nos Boissons'),
      ),
      body: FutureBuilder<List<Boisson>>(
        future: _boissons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucune boisson disponible.'));
          } else {
            return _buildListView(snapshot.data!);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
    );
  }

  _buildListView(List<Boisson> boissons) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: boissons.length,
      itemBuilder: (context, index) {
        return _buildRow(boissons[index]);
      }
    );
  }

  _buildRow(Boisson boisson) {
    return Card(
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom:Radius.circular(10.0),
          top: Radius.circular(2.0)),
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BoissonDetails(boisson: boisson),
              ),
            );
          },
          child: _buildBoissonDetails(boisson),
        ),
        BuyButtonBoissonWidget(boisson),
      ],
    )
    );
  }

  _buildBoissonDetails(Boisson boisson) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(boisson.nom),
          subtitle: Text(boisson.teneurEnSucre as String),
          leading: Icon(Icons.local_pizza),
        ),
        Image.network (
          boisson.image,
          height: 120,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(boisson.teneurEnSucre as String),
        ),
      ],
    );
  }

}
