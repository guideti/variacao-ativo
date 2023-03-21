import '../../../../../commons/commons.dart';
import '../../../domain/domain.dart';

class ChartModelRemote {
  final String symbol;
  final List<int> timestamp;
  final List<double> open;

  ChartModelRemote({
    required this.symbol,
    required this.timestamp,
    required this.open,
  });

  factory ChartModelRemote.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['result', 'error'])) {
      throw const OtherRequestException(0, 'Dados invalidos');
    }

    if (json['result'] == null) {
      throw const OtherRequestException(0, 'Dados invalidos');
    }

    if ((json['result'] as List).isEmpty) {
      throw const OtherRequestException(0, 'Dados invalidos');
    }

    var result = json['result'][0];

    if ((result["indicators"]["quote"] as List).isEmpty) {
      throw const OtherRequestException(0, 'Dados invalidos');
    }

    var chart = ChartModelRemote(
      symbol: result["meta"]["symbol"],
      timestamp: (result["timestamp"] as List).map((e) => e as int).toList(),
      open: (result["indicators"]["quote"][0]["open"] as List).map((e) => double.parse("${e ?? 0.0}")).toList(),
    );

    if (chart.open.length != chart.timestamp.length) {
      throw const OtherRequestException(0, 'Dados invalidos');
    }

    return chart;
  }

  ChartEntity toEntity() => ChartEntity(
        symbol: symbol,
        timestamp: timestamp
            .map(
              (time) => DateTime.fromMillisecondsSinceEpoch(time * 1000),
            )
            .toList(),
        open: open,
      );
}
