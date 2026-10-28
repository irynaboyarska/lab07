import 'package:flutter/material.dart';

class V2 extends StatefulWidget {
  const V2({super.key});

  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
  double _topLeft = 0.0;
  double _topRight = 0.0;
  double _bottomLeft = 0.0;
  double _bottomRight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_topLeft),
              topRight: Radius.circular(_topRight),
              bottomLeft: Radius.circular(_bottomLeft),
              bottomRight: Radius.circular(_bottomRight),
            ),
          ),
        ),
        const SizedBox(height: 60),
        Row(
          children: [
            Expanded(
              child: CornerSlider(
                label: 'TL',
                value: _topLeft,
                onChanged: (v) => setState(() => _topLeft = v),
              ),
            ),
            Expanded(
              child: CornerSlider(
                label: 'TR',
                value: _topRight,
                onChanged: (v) => setState(() => _topRight = v),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CornerSlider(
                label: 'BL',
                value: _bottomLeft,
                onChanged: (v) => setState(() => _bottomLeft = v),
              ),
            ),
            Expanded(
              child: CornerSlider(
                label: 'BR',
                value: _bottomRight,
                onChanged: (v) => setState(() => _bottomRight = v),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CornerSlider extends StatelessWidget {
  const CornerSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$label: '),
            Text(
              value.toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(value: value, min: 0, max: 100, onChanged: onChanged),
      ],
    );
  }
}