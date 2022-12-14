import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double spendedAmount;
  final double maxAmount;

  const BarChart({
    super.key,
    required this.label,
    required this.spendedAmount,
    required this.maxAmount,
  });

  @override
  Widget build(BuildContext context) {
    final amountPercentage = maxAmount == 0 ? 0.0 : spendedAmount / maxAmount;

    return LayoutBuilder(builder: (ctx, constraints) {
      final maxHeight = constraints.maxHeight;

      return Column(
        children: [
          Container(
            height: maxHeight * 0.15,
            child:
                FittedBox(child: Text('${spendedAmount.toStringAsFixed(0)} €')),
          ),
          Container(
            height: maxHeight * 0.7,
            // Fixed sizes are somewhat ok here...
            width: 16,
            child: Stack(
              children: [
                // First child is rendered first ("behind")
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // amountPercentage < 0.05
                //     ? Container()
                //     :
                // Second child is rendered after ("on top")
                FractionallySizedBox(
                  heightFactor: amountPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: maxHeight * 0.15,
            child: FittedBox(child: Text(label)),
          ),
        ],
      );
    });
  }
}
