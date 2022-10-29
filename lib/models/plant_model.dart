class Plant {
  final double humidity;

  final double ph;

  final double temperature;

  final double waterLevel;

  Plant(this.waterLevel, this.temperature, this.humidity, this.ph);

  Plant.fromJson(Map<String, dynamic> json)
      : waterLevel = json['water_level'].toDouble(),
        temperature = json['temperature'].toDouble(),
        humidity = json['humidity'].toDouble(),
        ph = json['ph'].toDouble();
}
