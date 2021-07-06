import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/MyFiles.dart';
import 'package:new_app/models/RecentFile.dart';

import 'components/chart.dart';
import 'components/header.dart';
import 'components/info_card.dart';
import 'components/storage_details.dart';
import 'components/storage_info_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defualtPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Header(),
            SizedBox(
              height: defualtPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FirstRow(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: demoMyFiles
                            .map((e) => InfoCard(
                                  info: e,
                                ))
                            .toList(),
                      ),
                      LayoutBuilder(builder: (ctx, constraints) {
                        print(constraints.maxHeight);
                        return Container(
                          // height: 300,
                          width: constraints.maxWidth,
                          // height: constraints.maxHeight,\
                          padding: const EdgeInsets.all(defualtPadding),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Recent Files',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              DataTable(
                                columnSpacing: 200,
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    ' File Name',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    '   Date',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    '   Size',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  )),
                                ],
                                rows: demoRecentFiles
                                    .map(
                                      (e) => DataRow(
                                        cells: [
                                          DataCell(
                                            Row(
                                              children: [
                                                SvgPicture.asset(e.icon!),
                                                SizedBox(
                                                  width: defualtPadding,
                                                ),
                                                Text(e.title!)
                                              ],
                                            ),
                                          ),
                                          DataCell(
                                            Text(e.date!),
                                          ),
                                          DataCell(
                                            Text(e.size!),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  width: defualtPadding,
                ),
                Expanded(
                  flex: 2,
                  child: StorageDetails(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'My Files',
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
            vertical: defualtPadding,
            horizontal: defualtPadding,
          )),
          icon: Icon(Icons.add),
          label: Text('Add New '),
          onPressed: () {},
        )
      ],
    );
  }
}
