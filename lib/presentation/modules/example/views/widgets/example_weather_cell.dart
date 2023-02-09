// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../domain/entities/weather_entity.dart';
import '../../../../../generated/assets.dart';
import '../../../../theme/app_text_theme.dart';

class ExampleWeatherCell extends StatefulWidget {
  final WeatherEntity? weatherEntity;
  const ExampleWeatherCell({
    Key? key,
    this.weatherEntity,
  }) : super(key: key);

  @override
  State<ExampleWeatherCell> createState() => _ExampleWeatherCellState();
}

class _ExampleWeatherCellState extends State<ExampleWeatherCell> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.weatherEntity?.weatherColor ?? Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.weatherEntity?.dateDisplay ?? '--',
            style: AppTextTheme.title4,
          ),
          Text(
            widget.weatherEntity?.weatherTitle ?? '--',
            style: AppTextTheme.body3,
          ),
          Image.asset(
            widget.weatherEntity?.weatherIcon ?? Assets.icSunny,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }
}
