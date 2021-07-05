import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/MyFiles.dart';

import 'components/chart.dart';
import 'components/header.dart';
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
                    children: [
                      FirstRow(),
                      Row(
                        children: [
                          InfoCard(
                            svgUrl: 'assets/icons/Documents.svg',
                            title: 'Documents',
                            subTitle1: '123GB Files',
                            subTitle2: '12GB',
                          )
                        ],
                      )
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

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    this.title,
    this.subTitle1,
    this.subTitle2,
    this.svgUrl,
    this.ratio,
  }) : super(key: key);

  String? title, subTitle1, subTitle2, svgUrl;
  double? ratio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 200,
        height: 180,
        margin: const EdgeInsets.all(defualtPadding),
        padding: const EdgeInsets.all(defualtPadding),
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(13)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(defualtPadding),
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(13)),
                  child: SvgPicture.asset(svgUrl!),
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
              ],
            ),
            Text(title!),
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(3)),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .3,
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subTitle1!,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  subTitle2!,
                  style: TextStyle(color: Colors.white, fontSize: 12),
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
