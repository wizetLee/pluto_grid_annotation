import 'package:demo/dummy_data/development.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../widget/pluto_example_button.dart';
import '../../widget/pluto_example_screen.dart';

class ColumnResizingScreen extends StatefulWidget {
  static const routeName = 'feature/column-resizing';

  const ColumnResizingScreen({Key? key}) : super(key: key);

  @override
  _ColumnResizingScreenState createState() => _ColumnResizingScreenState();
}

class _ColumnResizingScreenState extends State<ColumnResizingScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  late final PlutoGridStateManager stateManager;

  void setColumnSizeConfig(PlutoGridColumnSizeConfig config) {
    stateManager.setColumnSizeConfig(config);
  }

  @override
  void initState() {
    super.initState();

    final dummyData = DummyData(10, 30);

    /// 航头
    columns.addAll(dummyData.columns);

    // 底部下面的数据
    rows.addAll(dummyData.rows);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Column resizing',
      topTitle: 'Column resizing',
      topContents: const [
        Text(
          'You can resize the column by dragging the icon to the right of the column.',
        ),
        Text(
          'In autoSize mode, you must select Resize.pushAndPull mode to maintain the overall size when adjusting the column width.',
        ),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/column_resizing_screen.dart',
        ),
      ],
      body: _body(),
    );
  }

  _body() {
    return PlutoGrid(
      columns: columns,
      rows: rows,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
      },
      createHeader: (stateManager) => Container(height: 44, color: Colors.red,), // 常驻的
      // createFooter: (stateManager) => Container(height: 44, color: Colors.red,),// 常驻的
      configuration: const PlutoGridConfiguration(
        columnSize: PlutoGridColumnSizeConfig(
          autoSizeMode: PlutoAutoSizeMode.none,
          resizeMode: PlutoResizeMode.normal,
        ),
      ),
    );
  }
}
