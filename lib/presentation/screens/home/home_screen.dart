import 'package:flutter/material.dart';
import 'package:widgets_apps/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: MenuItems.appMenuItems.length,
      itemBuilder: (context,index){
        final menuItem = MenuItems.appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },// Construir en tiempo de ejecucion
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItems menuItem;
  const _CustomListTile({required this.menuItem});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: (){
        // TODO: Navegar a la pantalla seleccionada
      },
    );
  }
  
}