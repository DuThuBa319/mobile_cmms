// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../domain/entities/temperature_entity.dart';
import '../../../../../generated/assets.dart';
import '../../../../theme/app_text_theme.dart';

class ExampleWeatherCell extends StatefulWidget {
  final TemperatureEntity? temperatureEntity;
  const ExampleWeatherCell({
    Key? key,
    this.temperatureEntity,
  }) : super(key: key);

  @override
  State<ExampleWeatherCell> createState() => _ExampleWeatherCellState();
}

class _ExampleWeatherCellState extends State<ExampleWeatherCell> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final temperature = widget.temperatureEntity?.temperature.toString();
    final humid = widget.temperatureEntity?.humidity.toString();
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.temperatureEntity?.temperatureColor ?? Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                widget.temperatureEntity?.dateDisplay ?? '--',
                style: AppTextTheme.title4,
              ),
              Row(
                children: [
                  Text(
                    widget.temperatureEntity?.weatherTitle ?? '--',
                    style: AppTextTheme.body3,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    widget.temperatureEntity?.weatherIcon ?? Assets.icSunny,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 5,
            children: [
              Text(
                'Nhiệt độ: $temperature',
                style: AppTextTheme.body3,
              ),
              Text(
                'Độ ẩm: $humid',
                style: AppTextTheme.body3,
              ),
              Text(
                widget.temperatureEntity?.temperatureTitle ?? '--',
                style: AppTextTheme.body3.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
