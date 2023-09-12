import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardScreen extends StatelessWidget {
  static const String name = "card_screen";
  const CardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType1(
                label: card['label'],
                elevation: card['elevation'],
              )),
          ...cards.map((card) => _CardType2(
                label: card['label'],
                elevation: card['elevation'],
              )),
          ...cards.map((card) => _CardType3(
                label: card['label'],
                elevation: card['elevation'],
              )),
          ...cards.map((card) => _CardType4(
                label: card['label'],
                elevation: card['elevation'],
              )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.construction_sharp),
                    onPressed: () {},
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 20),
                  )),
            ],
          )),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        // ignore: unnecessary_const
        borderRadius: const BorderRadius.all(const Radius.circular(12)),
        side: BorderSide(color: colors.primary, width: 1),
      ),
      elevation: elevation,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.construction_sharp),
                    onPressed: () {},
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '$label - outlined',
                    style: const TextStyle(fontSize: 20),
                  )),
            ],
          )),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.construction_sharp),
                    onPressed: () {},
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '$label - filled',
                    style: const TextStyle(fontSize: 20),
                  )),
            ],
          )),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/600/350?image=${elevation.toInt()}',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(35)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.construction_sharp),
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}
