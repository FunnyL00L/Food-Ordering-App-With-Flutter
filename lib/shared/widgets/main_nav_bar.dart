import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_ordering_app_with_flutter_and_bloc/screens/biling/pembayaran.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      backgroundColor: colorScheme.background,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onBackground.withOpacity(.5),
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      selectedLabelStyle: textTheme.bodySmall,
      unselectedLabelStyle: textTheme.bodySmall,
      type: BottomNavigationBarType.fixed,
     onTap: (index) {
  switch (index) {
    case 0:
      context.pushNamed('home');
      break;
    case 1:
      context.pushNamed('Pencarian');
      break;
    case 2:
      context.pushNamed('Pesanan');
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage()));
      break;
    default:
  
}
        switch (index) {
          case 0:
            context.pushNamed('home');
            break;
          case 1:
            context.pushNamed('Pencarian');
            break;
          case 2:
            context.pushNamed('Pesanan');
            break;
          case 3:
            context.pushNamed('Payment');
            break;
          default:
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Billing',
        ),
      ],
    );
  }
}
