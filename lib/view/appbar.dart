import 'package:flutter/material.dart';
import 'package:furniture/view/cartscreen.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({super.key});

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.search,
              size: 30,
            ),
            const Column(
              children: [
                Text(
                  'MAKE HOME',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                 Text(
                  'BEAUTIFUL',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(
                        yourhinttext: '',
                        yourlabletext: '',
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
