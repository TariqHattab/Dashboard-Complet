import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/MyFiles.dart';
import 'package:new_app/responsive.dart';

import 'info_card.dart';
import 'storage_details.dart';
import 'table_section.dart';

class FilesSection extends StatelessWidget {
  const FilesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFilesRow(),
              SizedBox(
                height: defualtPadding,
              ),
              Responsive(
                mobile: InfoCardGridView(
                  crossAxisCount: _size.width < 650 ? 2 : 4,
                  childAspectRatio: _size.width < 650 ? 1.3 : 1,
                ),
                tablet: InfoCardGridView(),
                desktop: InfoCardGridView(
                  childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                ),
              ),
              TableSection(),
              if (Responsive.isMobile(context)) StorageDetails(),
            ],
          ),
        ),
        SizedBox(
          width: defualtPadding,
        ),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.only(
                    right: defualtPadding, bottom: defualtPadding),
                child: StorageDetails()),
          )
      ],
    );
  }
}

class InfoCardGridView extends StatelessWidget {
  const InfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: defualtPadding,
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: defualtPadding),
        itemBuilder: (ctx, index) {
          return InfoCard(
            info: demoMyFiles[index],
          );
        });
  }
}

class MyFilesRow extends StatelessWidget {
  const MyFilesRow({
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
