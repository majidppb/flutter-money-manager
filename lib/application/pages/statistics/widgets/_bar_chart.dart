part of '../statistics.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({required List<ItemSummary> items}) : _items = items;

  final List<ItemSummary> _items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: _items.isEmpty
          ? const Center(child: Text('No data to show!'))
          : BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) =>
                        Theme.of(context).colorScheme.primaryContainer,
                    tooltipHorizontalAlignment: FLHorizontalAlignment.center,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${double.parse((_items[group.x].percentage).toStringAsFixed(2))}%',
                        TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    drawBelowEverything: false,
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTitles,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    drawBelowEverything: false,
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getAmount,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingGroups(context),
                gridData: const FlGridData(show: false),
              ),
            ),
    );
  }

  BarChartGroupData makeGroupData(
    BuildContext context,
    int x,
    double y, {
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    final toY = _items.last.percentage + 5;

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: _items[x].category.color,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: toY < 100 ? toY : 100,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(BuildContext context) {
    final List<BarChartGroupData> list = [];
    for (int i = 0; i < _items.length; i++) {
      list.add(
        makeGroupData(
          context,
          i,
          _items[i].percentage,
        ),
      );
    }
    return list;
  }

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: AxisSide.bottom,
      space: 0,
      angle: 1.5708,
      child: Transform.translate(
          offset: const Offset(-110, 0),
          child: Text(_items[value.toInt()].category.name)),
    );
  }

  Widget getAmount(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      angle: 1.5708,
      child: Transform.translate(
          offset: const Offset(20, 0),
          child: Text(_items[value.toInt()].amount.toInt().toString())),
    );
  }
}
