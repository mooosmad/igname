import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.title,
    required this.color,
    required this.rightWidget,
    required this.iconWidget,
  });

  final Color color;
  final String title;
  final Widget rightWidget;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: iconWidget,
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 24),
            child: rightWidget,
          )
        ],
      ),
    );
  }
}
