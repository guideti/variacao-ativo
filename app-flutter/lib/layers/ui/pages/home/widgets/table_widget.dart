import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../../../ui.dart';
import '../../../../../commons/validator/validator.dart';

class TableWidget extends StatelessWidget {
  final HomePresenter presenter;

  const TableWidget({required this.presenter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () {
            var list = presenter.tableListRx.toList();
            var loading = presenter.isLoadingRx.value;

            return DataTable(
              columns: _createColumns(),
              rows: loading ? _skeletonRows() : _createRows(list),
            );
          },
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text('Dia'),
      ),
      const DataColumn(
        label: Text('Data'),
      ),
      const DataColumn(
        label: Text('Valor'),
      ),
      const DataColumn(
        label: Text('Variação em relaçào a D-1'),
      ),
      const DataColumn(
        label: Text('Variação em relação a primeira data'),
      ),
    ];
  }

  List<DataRow> _createRows(List<TableViewModel> list) {
    return list
        .mapIndexed(
          (obj, index) => DataRow(cells: [
            DataCell(
              Text("${index + 1}"),
            ),
            DataCell(
              Text(obj.date),
            ),
            DataCell(
              Text(obj.value),
            ),
            DataCell(
              Text(obj.variationInRelationToDMinus1),
            ),
            DataCell(
              Text(obj.variationFromTheFirstDate),
            ),
          ]),
        )
        .toList();
  }

  List<DataRow> _skeletonRows() {
    var line = SkeletonLine(
      style: SkeletonLineStyle(
        randomLength: true,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    var cell = DataCell(
      SizedBox(
        width: 100,
        height: 20,
        child: line,
      ),
      placeholder: true,
    );

    return List.generate(
      presenter.random(),
      (index) => DataRow(
        cells: [
          cell,
          cell,
          cell,
          cell,
          cell,
        ],
      ),
    );
  }
}
