import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class StorageInfoCard extends StatelessWidget {
  StorageInfoCard({
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
      margin: const EdgeInsets.symmetric(vertical: defualtPadding / 2),
      padding: const EdgeInsets.symmetric(
          horizontal: defualtPadding, vertical: defualtPadding / 2),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              svgUrl,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$subTitle Files',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data),
          )
        ],
      ),
    );
  }
}
