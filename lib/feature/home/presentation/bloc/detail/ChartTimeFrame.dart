enum ChartTimeFrame { H1, H3, H12, H24, D7, D30, M3, Y1, Y3, Y5 }

extension ChartTimeFrameX on ChartTimeFrame {
  String get label {
    switch (this) {
      case ChartTimeFrame.H1:
        return "1H";
      case ChartTimeFrame.H3:
        return "3H";
      case ChartTimeFrame.H12:
        return "12H";
      case ChartTimeFrame.H24:
        return "24H";
      case ChartTimeFrame.D7:
        return "7D";
      case ChartTimeFrame.D30:
        return "1M";
      case ChartTimeFrame.M3:
        return "3M";
      case ChartTimeFrame.Y1:
        return "1Y";
      case ChartTimeFrame.Y3:
        return "3Y";
      case ChartTimeFrame.Y5:
        return "5Y";
    }
  }
}
