import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/RecentFile.dart';

class TableSection extends StatelessWidget {
  const TableSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defualtPadding,
              horizontalMargin: 0,
              columns: [
                DataColumn(
                    label: Text(
                  ' File Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                )),
                DataColumn(
                    label: Text(
                  '   Date',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                )),
                DataColumn(
                    label: Text(
                  '   Size',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                )),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow recentFileRow(RecentFile e) {
    return DataRow(
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
    );
  }
}
