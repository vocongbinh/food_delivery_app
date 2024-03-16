import 'package:flutter/cupertino.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                // image: DecorationImage(image: )
                ),
          ),
          flex: 2,
        ),
        // Flexible(child: , flex: 2,),
      ],
    );
  }
}
