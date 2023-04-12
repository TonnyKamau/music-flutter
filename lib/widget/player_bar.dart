import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;

  SeekBarData(this.position, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;
  const SeekBar({
    Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);
  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.position.inMinutes}:${widget.position.inSeconds.remainder(60).toString().padLeft(2, '0')}',
          style: const TextStyle(color: Colors.white),
        ),
        Expanded(
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.5),
                trackShape: const RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 4,
                  disabledThumbRadius: 4,
                ),
                overlayColor: Colors.white.withAlpha(32),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 10.0),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.white,
                inactiveTickMarkColor: Colors.white,
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.white,
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              child: Slider(
                  min: 0.0,
                  max: widget.duration.inMilliseconds.toDouble(),
                  value: min(
                    _dragValue ?? widget.position.inMilliseconds.toDouble(),
                    widget.duration.inMilliseconds.toDouble(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _dragValue = value;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(Duration(milliseconds: value.round()));
                    }
                  },
                  onChangeEnd: (value) {
                    _dragValue = null;
                    if (widget.onChangeEnd != null) {
                      widget
                          .onChangeEnd!(Duration(milliseconds: value.round()));
                    }
                  })),
        ),
        Text(
          '${widget.duration.inMinutes}:${widget.duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
