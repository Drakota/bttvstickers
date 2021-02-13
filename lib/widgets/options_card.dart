import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/widgets/card.dart' as own;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Option {
  final String assetName;
  final dynamic value;
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
  final dynamic defaultValue;
  final void Function(Option selectedOption) onChange;

  OptionsCard({
    this.fieldName,
    this.options,
    this.defaultValue,
    this.onChange,
  });

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null) {
      _currentIndex = _findOptionIndex(widget.defaultValue);
    } else {
      _currentIndex = 0;
    }
  }

  int _findOptionIndex(dynamic value) {
    var index = widget.options.indexWhere((option) => option.value == value);

    // If we don't find the option, return the first option
    return index >= 0 ? index : 0;
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
