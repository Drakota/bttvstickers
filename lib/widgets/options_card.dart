import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Option {
  final String assetName;
  final String value;
  final String displayName;

  Option({
    this.assetName,
    this.value,
    this.displayName,
  });
}

class OptionsCard extends StatefulWidget {
  final String fieldName;
  final List<Option> options;
  final int defaultIndex;
  final void Function(Option selectedOption) onChange;

  OptionsCard({
    this.fieldName,
    this.options,
    this.onChange,
    this.defaultIndex = 0,
  });

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.defaultIndex;
  }

  void _handleOnTap() {
    if (_currentIndex + 1 < widget.options.length) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
    if (widget.onChange != null) {
      widget.onChange(widget.options[_currentIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return own.Card(
      child: Row(
        children: [
          SvgPicture.asset(
            widget.options[_currentIndex].assetName,
            height: kNavBarIconHeight,
            color: Theme.of(context).buttonColor,
          ),
          Spacer(
            flex: kIconFieldFlexSpacing,
          ),
          Text(
            "${widget.fieldName}: ${widget.options[_currentIndex].displayName}",
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(flex: 20),
        ],
      ),
      onTap: _handleOnTap,
    );
  }
}
