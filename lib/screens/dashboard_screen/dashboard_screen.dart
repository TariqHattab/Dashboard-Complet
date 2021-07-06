import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';

import 'components/header.dart';
import 'components/recent_files.dart';

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
            RecentFiles()
          ],
        ),
      ),
    );
  }
}
