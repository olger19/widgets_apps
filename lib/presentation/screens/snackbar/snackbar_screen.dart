import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_apps/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    final snakback = SnackBar( 
      content: const Text('Hola, soy un snackbar personalizado'),
      action: SnackBarAction(label: 'OK!', onPressed: (){}),
      duration: const Duration(seconds: 2),
      );

    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }

  void openDialog (BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, //Obligar al usuario a elegir una opcion, no se puede cerrar la ventana
      builder:(context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Esto no se puede deshacer'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),

      //Licencias dialogos
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(
                context: context,
                children: [
                  const Text('Aliqua aliquip adipisicing occaecat fugiat.')
                ]
                );
            }, child: const Text('Licencias usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), child: const Text('Mostrar dialogo')),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
  
}