import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  static const String name = "button_screen";
  const ButtonScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Button Screen'),
        ),
        body: const _BottonsView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.navigation),
        ));
  }
}

class _BottonsView extends StatelessWidget {
  const _BottonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Wrap(
          spacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevate")),
            const ElevatedButton(
                onPressed: null, child: Text("Elevate disable")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Elevate icon")),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(
                onPressed: () {},
                label: const Text("Filled Icon"),
                icon: const Icon(Icons.adb_rounded)),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_rounded),
              label: const Text("Outlined Icon"),
            ),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.cabin),
              label: const Text("Text Icon"),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
