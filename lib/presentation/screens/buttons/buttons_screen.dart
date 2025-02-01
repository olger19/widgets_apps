import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      //Para que ocupe todo el ancho de la pantalla
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //Para que los botones no se salgan de la pantalla(Wrap)
        child: Wrap(
          //Espacio entre los botones cada vez que agregue otro boton
          spacing: 10,
          //Alineacion de los botones
          alignment: WrapAlignment.center,
          //Botones que voy a mostrar
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            //Boton con un color diferente desabilitado por eso el null
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disabled')),
            //Boton Elevated con constructor icon, basicamente lo mismo que el anterior
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_outlined),
                label: const Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new),
                label: const Text('Filled Icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
                label: const Text('Outline Icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_box_outlined),
                label: const Text('Text Icon')),

            const CustomButton(),

            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
                onPressed: () {},
                style: ButtonStyle(
                  //Material State Property ya no se usa
                  //backgroundColor: MaterialStateProperty.all(colors.primary.withOpacity(0.5)),
                  //Use Widget State Property All para cambiar el color del boton
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: const WidgetStatePropertyAll(Colors.white),
                ),
                icon: const Icon(Icons.app_registration_rounded)),
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
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        // InkWell es parecido a GestureDetector pero con efectos de material
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Mundo'),
          ),
        ),
      ),
    );
  }
}
