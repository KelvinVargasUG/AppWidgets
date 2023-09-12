import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = "snackbar_screen";
  const SnackbarScreen({super.key});

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola soy un snackbar'),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>  AlertDialog(
        title: const Text("Estas seguro?"),
        content: const Text("Estas seguro de esta accion???"),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Snackbar Dialogos"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FilledButton.tonal(
                  onPressed: () {
                    showAboutDialog(context: context, children: [
                      const Text(
                          "Ver las licencias que esta usando la aplicacion")
                    ]);
                  },
                  child: const Text("Licencias Usadas")),
              const SizedBox(
                height: 10,
              ),
              FilledButton.tonal(
                  onPressed: () => _openDialog(context),
                  child: const Text("Mostrar dialogo")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showSnackBar(context),
          icon: const Icon(Icons.remove_red_eye_sharp),
          label: const Text("Mostrar Snackbar"),
          
        ));
  }
}
