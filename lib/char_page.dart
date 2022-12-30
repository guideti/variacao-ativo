// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';

// class ChartPage extends StatefulWidget {
//   const ChartPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _ChartPageState createState() => _ChartPageState();
// }

// class _ChartPageState extends State<ChartPage> {
//   bool isShowGraphic = true;

//   _showGraphic(bool showGraphic) {
//     setState(() => isShowGraphic = showGraphic);
//   }

//   @override
//   void initState() {
//     super.initState();

//     // 150 / 100 * 80% =  120
//     // 120 * 100 / 150 = 80%

//     // 150 / 100 * 80% =  120
//     // 140 * 100 / 150 = 93%

//     //  75 / 100 * 120 = 90(75%) - 120(total)) = 30%
//     //  90 / 100 * 120 = 108(90% - 120(total)) = 12%

//     double percent = 100;
//     List<String> dates = [
//       'Jan',
//       'Fev',
//       'Mar',
//       'Abr',
//     ];
//     List<double> prices = [1.00, 1.10, 1.05, 1.90];

//     final formatCurrency =
//         NumberFormat.simpleCurrency(decimalDigits: 2, name: '');

//     int count = 0;
//     double result = 0.0;
//     double secondResult = 0.0;
//     double nextNumber = 0;

//     for (double i in prices) {
//       final currentNumber = i;

//       if (count > 0) {
//         nextNumber = prices[count - 1];
//         final currentResult = _getPercent(currentNumber, nextNumber);

//         result = (currentResult > percent)
//             ? (currentResult - percent)
//             : (percent - currentResult);

//         // calc first date
//         final currentResultFirstDate = _getPercent(currentNumber, prices[0]);
//         secondResult = (currentResultFirstDate > percent)
//             ? (currentResultFirstDate - percent)
//             : (percent - currentResultFirstDate);
//       }

//       print(
//           'Dia: $count - Data: 10/10/2022 - Valor R\$ ${formatCurrency.format(currentNumber)} - Variação D-1: ${formatCurrency.format(result)}% - Variação primeira data: R\$ ${formatCurrency.format(secondResult)}%');
//       count++;
//     }
//   }

//   double _getPercent(double number, double nextNumber) {
//     return (number * 100 / nextNumber);
//   }

//   List<PricePoint> _bardata() {
//     List<PricePoint> points = [
//       PricePoint(1, 10.0),
//       PricePoint(2, 20.0),
//       PricePoint(3, 25.0)
//     ];
//     return points;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Variação do Ativo'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height * .9,
//         child: Column(
//           children: [
//             // actions
//             SizedBox(
//               width: MediaQuery.of(context).size.width * .7,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                       onPressed: () => _showGraphic(false),
//                       child: const Text('Ver Tabela')),
//                   ElevatedButton(
//                       onPressed: () => _showGraphic(true),
//                       child: const Text('Ver Gráfico'))
//                 ],
//               ),
//             ),

//             // content tables
//             Visibility(
//               visible: !isShowGraphic,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 child: Column(
//                   children: [
//                     Container(
//                       color: Colors.grey[400],
//                       height: 30,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             'Dia',
//                           ),
//                           Text('Data'),
//                           Text('Valor R\$'),
//                           Text('D-1'),
//                           Text('1º Data'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5 * 30,
//                       child: ListView.separated(
//                           itemBuilder: (context, indext) {
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: const [
//                                 Text('2'),
//                                 Text('01/01/2022'),
//                                 Padding(
//                                   padding: EdgeInsets.only(right: 16),
//                                   child: Text('R\$ 1,00'),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(right: 30),
//                                   child: Text('10%'),
//                                 ),
//                                 Text('10%'),
//                               ],
//                             );
//                           },
//                           separatorBuilder: (context, index) {
//                             return const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 5),
//                               child: Divider(
//                                 height: .5,
//                               ),
//                             );
//                           },
//                           itemCount: 5),
//                     )
//                   ],
//                 ),
//               ),
//             ),

//             // graphic
//             Visibility(
//               visible: isShowGraphic,
//               child: SizedBox(
//                   width: 400,
//                   height: 300,
//                   child: LineChart(LineChartData(
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots:
//                               _bardata().map((e) => FlSpot(e.x, e.y)).toList(),
//                           isCurved: false,
//                           dotData: FlDotData(show: false),
//                         ),
//                       ],
//                       titlesData: FlTitlesData(
//                           bottomTitles:
//                               AxisTitles(sideTitles: _bottomTitles))))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// SideTitles get _bottomTitles => SideTitles(
//       showTitles: true,
//       getTitlesWidget: (value, meta) {
//         String text = '';
//         switch (value.toInt()) {
//           case 1:
//             text = 'Jan';
//             break;
//           case 2:
//             text = 'Fev';
//             break;
//           case 3:
//             text = 'Mar';
//             break;
//           case 4:
//             text = 'Abr';
//             break;
//           case 5:
//             text = 'Mai';
//             break;
//           case 6:
//             text = 'Jun';
//             break;
//         }

//         return Text(text);
//       },
//     );

// class PricePoint {
//   double x;
//   double y;
//   PricePoint(this.x, this.y);
// }
