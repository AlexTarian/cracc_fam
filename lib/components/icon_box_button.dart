import 'package:flutter/material.dart';

class IconBoxButton extends StatelessWidget {
  const IconBoxButton({super.key,
    required this.icon,
    required this.text,
    this.progress = 0.0,
    this.trailingIcon,
    this.trailingColor,
  });

  final IconData icon;
  final String text;
  final double progress;
  final IconData? trailingIcon;
  final Color? trailingColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 65.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
              stops: <double>[progress, progress],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Theme.of(context).primaryColor.withOpacity(0.33),
                Colors.transparent,
              ],
            ),
          ),
          child: const Row(
            children: <Widget>[
              SizedBox(width: 75.0),
              Text(''),
            ],
          ),
        ),
        Container(
          height: 65.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 20.0),
              Flexible(
                flex: 1,
                child: Icon(icon,
                  color: Theme.of(context).primaryColor,
                  size: 40.0,
                ),
              ),
              Flexible(
                flex: 5,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Icon(trailingIcon,
                  color: Theme.of(context).primaryColor,
                  size: 40.0,
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}