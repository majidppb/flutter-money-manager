part of '../statistics.dart';

class _PieChart extends StatelessWidget {
  const _PieChart({required this.income, required this.expense})
      : balance = income - expense > 0 ? income - expense : 0;

  final double income;
  final double expense;
  final double balance;

  static const radius = 120.0;
  static const fontSize = 16.0;
  static const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: [
            PieChartSectionData(
              color: kExpenseColor,
              value: expense,
              title: balance > 0
                  ? '${(expense / income * 100).toStringAsFixed(2)}%'
                  : '100%',
              radius: radius,
              titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
                shadows: shadows,
              ),
              badgeWidget: const Text('Expense'),
              badgePositionPercentageOffset: 1.25,
            ),
            PieChartSectionData(
              color: kIncomeColor,
              value: balance,
              title: '${(balance / income * 100).toStringAsFixed(2)}%',
              radius: radius,
              titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
                shadows: shadows,
              ),
              badgeWidget: const Text('Balance'),
              badgePositionPercentageOffset: 1.25,
            ),
          ],
        ),
      ),
    );
  }
}

// ***** Label *****
//  Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: 10,
//           width: 10,
//           decoration: const ShapeDecoration(
//             shape: CircleBorder(),
//             color: Colors.blue,
//           ),
//         ),
//         kWidth10,
//         const Text('Expenses'),
//       ],
//     ),
//     Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: 10,
//           width: 10,
//           decoration: const ShapeDecoration(
//             shape: CircleBorder(),
//             color: Colors.amber,
//           ),
//         ),
//         kWidth10,
//         const Text('Balance')
//       ],
//     ),
//   ],
// ),

// ***** Income / Expense selectable *****
// class _PieChart extends StatefulWidget {
//   const _PieChart({required this.income, required this.expenses});

//   final double income;
//   final double expenses;

//   static const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

//   @override
//   State<_PieChart> createState() => _PieChartState();
// }

// class _PieChartState extends State<_PieChart> {
//   CategoryType _categoryType = CategoryType.expense;

//   List<PieChartSectionData> showingSections() {
//     return [
//       PieChartSectionData(
//         color: Colors.blue,
//         value: widget.income,
//         title: widget.income.toInt().toString(),
//         radius: _categoryType == CategoryType.expense ? 110.0 : 100.0,
//         titleStyle: TextStyle(
//           fontSize: _categoryType == CategoryType.expense ? 20.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: const Color(0xffffffff),
//           shadows: _PieChart.shadows,
//         ),
//         badgeWidget: const Text('Expense'),
//         badgePositionPercentageOffset: .98,
//       ),
//       PieChartSectionData(
//         color: Colors.amber,
//         value: widget.expenses,
//         title: widget.expenses.toInt().toString(),
//         radius: _categoryType == CategoryType.income ? 110.0 : 100.0,
//         titleStyle: TextStyle(
//           fontSize: _categoryType == CategoryType.income ? 20.0 : 16.0,
//           fontWeight: FontWeight.bold,
//           color: const Color(0xffffffff),
//           shadows: _PieChart.shadows,
//         ),
//         badgeWidget: const Text('Income'),
//         badgePositionPercentageOffset: .98,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: AspectRatio(
//         aspectRatio: 1,
//         child: PieChart(
//           PieChartData(
//             pieTouchData: PieTouchData(
//               touchCallback: (FlTouchEvent event, pieTouchResponse) {
//                 if (pieTouchResponse != null &&
//                     pieTouchResponse.touchedSection != null) {
//                   final touchedIndex =
//                       pieTouchResponse.touchedSection!.touchedSectionIndex;
//                   if (touchedIndex == 0 || touchedIndex == 1) {
//                     setState(() {
//                       _categoryType = touchedIndex == 0
//                           ? CategoryType.expense
//                           : CategoryType.income;
//                     });
//                   }
//                 }
//               },
//             ),
//             borderData: FlBorderData(
//               show: false,
//             ),
//             sectionsSpace: 0,
//             centerSpaceRadius: 0,
//             sections: showingSections(),
//           ),
//         ),
//       ),
//     );
//   }
// }
