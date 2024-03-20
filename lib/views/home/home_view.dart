import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/provider/provider.dart';
import '../list/list_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodies = [
      List_View(),
      const Center(
        child: Text('Hello From Settings Screen'),
      ),
      /* const FavoriteView(),
      const Center(
        child: Text('Hello From Settings Screen'),
      ),*/
    ];
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        elevation: 1,
        selectedItemColor: Colors.amberAccent,
        //fixedColor: Colors.black, es igual que selectedItemColor
        unselectedItemColor: Colors.white,
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Lista de la Compra'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          /*
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),*/
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
