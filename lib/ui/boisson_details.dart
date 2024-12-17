import 'package:flutter/material.dart';
import 'package:pizzeria/models/boisson.dart';

class BoissonDetails extends StatefulWidget {
  final Boisson boisson;

  const BoissonDetails({Key? key, required this.boisson}) : super(key: key);

  @override
  _BoissonDetailsState createState() => _BoissonDetailsState();
}

class _BoissonDetailsState extends State<BoissonDetails> {
  double _teneurEnSucreModifiee = 10.6; // Valeur initiale, à ajuster selon la boisson

  @override
  void initState() {
    super.initState();
    _teneurEnSucreModifiee = widget.boisson.teneurEnSucre;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.boisson.nom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/boissons/${widget.boisson.nom}.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.boisson.nom,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Teneur en sucre: ${_teneurEnSucreModifiee.toStringAsFixed(1)}g'),
            const SizedBox(height: 16.0),
            Slider(
              value: _teneurEnSucreModifiee,
              min: 0,
              max: 20,  // Ajuste la plage selon tes besoins
              divisions: 20,
              label: _teneurEnSucreModifiee.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _teneurEnSucreModifiee = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour ajouter la boisson au panier
                print('Commander ${widget.boisson.nom} avec $_teneurEnSucreModifiee g de sucre');
              },
              child: const Text('Commander'),
            ),
          ],
        ),
      ),
    );
  }
}
