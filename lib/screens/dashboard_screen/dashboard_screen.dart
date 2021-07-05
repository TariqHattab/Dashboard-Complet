import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/MyFiles.dart';

import 'components/header.dart';

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
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 700,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: defualtPadding,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 700,
                    padding: const EdgeInsets.all(defualtPadding),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Storage Details',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ...demoMyFiles
                            .map((e) => RecentFiles(
                                  title: e.title!,
                                  subTitle: e.numOfFiles.toString(),
                                  data: e.totalStorage!,
                                  svgUrl: e.svgSrc!,
                                ))
                            .toList()
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecentFiles extends StatelessWidget {
  RecentFiles({
    Key? key,
    this.title = 'title',
    this.subTitle = 'subTitle',
    this.svgUrl = 'ss',
    this.data = 'asdf',
  }) : super(key: key);

  final String title, subTitle, svgUrl, data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: defualtPadding / 3),
      padding: const EdgeInsets.symmetric(
          horizontal: defualtPadding, vertical: defualtPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset(
            svgUrl,
            // color: secondaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                subTitle,
                style: TextStyle(color: Colors.white54, fontSize: 12),
              )
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data),
          )
        ],
      ),
    );
  }
}
