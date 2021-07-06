import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/MyFiles.dart';

import 'info_card.dart';
import 'storage_details.dart';
import 'table_section.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              TableSection()
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
