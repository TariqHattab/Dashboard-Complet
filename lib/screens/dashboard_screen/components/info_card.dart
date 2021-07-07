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
    return Container(
      padding: const EdgeInsets.all(defualtPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(defualtPadding * .75),
                decoration: BoxDecoration(
                    color: info!.color!.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8)),
                child: SvgPicture.asset(info!.svgSrc!),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white54,
                  ),
                  onPressed: () {})
            ],
          ),
          Text(info!.title!),
          ProgressBar(info: info),
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
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo? info;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: info!.color, borderRadius: BorderRadius.circular(3)),
        ),
      ),
    );
  }
}
