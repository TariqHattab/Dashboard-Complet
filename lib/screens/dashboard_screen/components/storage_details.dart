import 'package:flutter/material.dart';
import 'package:new_app/models/MyFiles.dart';
import 'package:new_app/screens/dashboard_screen/components/storage_info_card.dart';

import '../../../constants.dart';
import 'chart.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.all(defualtPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: defualtPadding,
          ),
          Chart(),
          SizedBox(
            height: defualtPadding,
          ),
          ...demoMyFiles
              .map((e) => StorageInfoCard(
                    title: e.title!,
                    subTitle: e.numOfFiles.toString(),
                    data: e.totalStorage!,
                    svgUrl: e.svgSrc!,
                  ))
              .toList()
        ],
      ),
    );
  }
}
