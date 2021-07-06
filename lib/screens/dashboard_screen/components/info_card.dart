import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:new_app/constants.dart';
import 'package:new_app/models/MyFiles.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    this.info,
  }) : super(key: key);
  CloudStorageInfo? info;

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
                      color: info!.color!.withOpacity(.1),
                      borderRadius: BorderRadius.circular(13)),
                  child: SvgPicture.asset(info!.svgSrc!),
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
              ],
            ),
            Text(info!.title!),
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(3)),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: info!.percentage! / 100,
                child: Container(
                  decoration: BoxDecoration(
                      color: info!.color,
                      borderRadius: BorderRadius.circular(3)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${info!.numOfFiles} Files',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  '${info!.totalStorage}',
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
