import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/feature/home/data/models/DetailChartModel.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/DetailBloc.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/DetailState.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/widget/NetworkImage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/formatters.dart';
import '../bloc/detail/ChartTimeFrame.dart';
import '../bloc/detail/DetailEvent.dart';
import '../widget/TimeFrameSelector.dart';

class DetailPage extends StatefulWidget {
  final String coinId;

  const DetailPage({super.key, required this.coinId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    context.read<DetailBloc>().add(CommonDetailFetch(widget.coinId));
    context.read<DetailBloc>().add(CoinChartRequested(widget.coinId));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        builder: (context, state) {
          final spots = _generateSpots(state.coins);

          if (spots.isEmpty) {
            return const SizedBox(
              height: 350,
              child: Center(child: Text("No Data")),
            );
          }

          final minY = spots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
          final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

          final isUpTrend = spots.last.y >= spots.first.y;

          final trendColor = isUpTrend ? Colors.green : Colors.red;
          final coinData = state.coinData?.coin;
          final coinCurrentChange =
              double.tryParse(coinData?.change ?? '0') ?? 0 >= 0;

          return Stack(
            children: [
              ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                networkImage(coinData?.iconUrl ?? ""),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${coinData?.name ?? ''} (${coinData?.symbol ?? ''})',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${coinData?.price ?? '0'}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Text(
                                          '(${coinData?.change ?? '0'})',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: coinCurrentChange == true
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30),

                            Row(
                              children: [
                                Text("MCap: "),
                                Text(
                                  Formatters.formatMarketCap(
                                    coinData?.marketCap,
                                  ),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                SizedBox(width: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: parseColor(coinData?.color),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '#${coinData?.rank ?? '-'}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            Text(coinData?.description ?? ""),
                            Text.rich(
                              TextSpan(
                                text: coinData?.websiteUrl ?? "",
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final url = Uri.parse(
                                      coinData?.websiteUrl ?? "",
                                    );
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 450,
                        child: LineChart(
                          LineChartData(
                            minY: minY * 0.98,
                            maxY: maxY * 1.02,

                            backgroundColor: Colors.white,

                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (value) =>
                                  FlLine(color: Colors.white10, strokeWidth: 1),
                            ),

                            borderData: FlBorderData(show: false),

                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 55,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      value.toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 10,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: _getBottomInterval(state),
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      _formatBottomTitle(state, value.toInt()),
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 10,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            lineTouchData: LineTouchData(
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                // tooltipBgColor: Colors.grey.shade900,
                                getTooltipItems: (touchedSpots) {
                                  return touchedSpots.map((spot) {
                                    return LineTooltipItem(
                                      "\$${spot.y.toStringAsFixed(2)}",
                                      const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),

                            lineBarsData: [
                              LineChartBarData(
                                spots: spots,
                                isCurved: true,
                                curveSmoothness: 0.3,
                                barWidth: 3,
                                color: trendColor,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      trendColor.withOpacity(0.4),
                                      trendColor.withOpacity(0.05),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TimeFrameSelector(
                        selected: state.timeFrame ?? ChartTimeFrame.D7,
                        onSelected: (timeFrame) {
                          context.read<DetailBloc>().add(
                            TimeFrameChanged(timeFrame, widget.coinId),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              if (state.isLoading)
                const ColoredBox(
                  color: Colors.black26,
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }

  List<FlSpot> _generateSpots(List<ChartHistoryData> list) {
    return list.asMap().entries.map((entry) {
      return FlSpot(
        entry.key.toDouble(),
        double.tryParse(entry.value.price ?? '0') ?? 0,
      );
    }).toList();
  }

  double _getBottomInterval(DetailState state) {
    switch (state.timeFrame) {
      case ChartTimeFrame.H1:
        return 5; // show every 5 minutes
      case ChartTimeFrame.H3:
        return 10; // every 10 minutes
      case ChartTimeFrame.H12:
        return 2; // every 2 hours
      case ChartTimeFrame.H24:
        return 4; // every 4 hours
      case ChartTimeFrame.D7:
        return 1; // every day
      case ChartTimeFrame.D30:
        return 5; // every 5 days
      case ChartTimeFrame.M3:
        return 2; // every 2 weeks
      case ChartTimeFrame.Y1:
        return 1; // every month
      case ChartTimeFrame.Y3:
        return 3; // every 3 months
      case ChartTimeFrame.Y5:
        return 6; // every 6 months
      case null:
        return 10; // every 10 minutes
    }
  }

  String _formatBottomTitle(DetailState state, int index) {
    switch (state.timeFrame) {
      case ChartTimeFrame.H1:
      case ChartTimeFrame.H3:
        return "${index}m";

      case ChartTimeFrame.H12:
      case ChartTimeFrame.H24:
        return "${index}h";

      case ChartTimeFrame.D7:
      case ChartTimeFrame.D30:
        return "${index}d";

      case ChartTimeFrame.M3:
        return "${index}w"; // weekly

      case ChartTimeFrame.Y1:
      case ChartTimeFrame.Y3:
      case ChartTimeFrame.Y5:
        return "${index}m"; // monthly
      case null:
        return "${index}m";
    }
  }

  Color parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      return Colors.grey; // fallback
    }
    hexColor = hexColor.replaceAll('#', '');
    // If API sends 6-digit color, add full opacity (FF)
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
