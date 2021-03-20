import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class VersioningCard extends StatefulWidget {
  @override
  _VersioningCardState createState() => _VersioningCardState();
}

class _VersioningCardState extends State<VersioningCard> {
  late Future<PackageInfo> _futurePackageInfo;

  @override
  void initState() {
    super.initState();
    _futurePackageInfo = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futurePackageInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          PackageInfo _packageInfo = snapshot.data as PackageInfo;
          return own.Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$kAppTitle v${_packageInfo.version}",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: kEmoteListSpacing,
                ),
                Text(
                  "Made with 🧡 using Flutter",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
