import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class WeatherUtils {
  static IconData getWeatherIcon(int code) {
    switch (code) {
      case 0: // Clear sky
        return LucideIcons.sun;
      case 1: // Mainly clear
        return LucideIcons.cloudSun; // More accurate than just 'cloudy'
      case 2: // Partly cloudy
        return LucideIcons.cloudy;
      case 3: // Overcast
        return LucideIcons.cloud; // Distinct icon for overcast

      case 45: // Fog
      case 48: // Depositing rime fog
        return LucideIcons.cloudFog;

      case 51: // Drizzle: Light
      case 53: // Drizzle: Moderate
      case 55: // Drizzle: Dense intensity
        return LucideIcons.cloudDrizzle;
      case 61: // Rain: Slight
      case 63: // Rain: Moderate
      case 65: // Rain: Heavy intensity
        return LucideIcons.cloudRain;
      case 80: // Rain showers: Slight
      case 81: // Rain showers: Moderate
      case 82: // Rain showers: Violent
        return LucideIcons.cloudRainWind; // Implies more dynamic weather

      case 56: // Freezing Drizzle: Light
      case 57: // Freezing Drizzle: Heavy intensity
      case 66: // Freezing Rain: Light
      case 67: // Freezing Rain: Heavy intensity
        return LucideIcons.thermometerSnowflake;
      case 71: // Snow fall: Slight
      case 73: // Snow fall: Moderate
      case 75: // Snow fall: Heavy intensity
        return LucideIcons.cloudSnow;
      case 77: // Snow grains
        return LucideIcons.snowflake;
      case 85: // Snow showers slight
      case 86: // Snow showers heavy
        return LucideIcons.cloudRainWind;

      case 95: // Thunderstorm: Slight or moderate
        return LucideIcons.cloudLightning;
      case 96: // Thunderstorm with slight hail
      case 99: // Thunderstorm with heavy hail
        return LucideIcons.cloudHail;

      default:
        return LucideIcons.triangleAlert;
    }
  }

  static String getWeatherDescription(int code) {
    switch (code) {
      case 0:
        return "Clear Sky";
      case 1:
        return "Mainly Clear";
      case 2:
        return "Partly Cloudy";
      case 3:
        return "Overcast";
      case 45:
        return "Fog";
      case 48:
        return "Rime Fog";
      case 51:
        return "Light Drizzle";
      case 53:
        return "Drizzle";
      case 55:
        return "Heavy Drizzle";
      case 56:
        return "Light Freezing Drizzle";
      case 57:
        return "Heavy Freezing Drizzle";
      case 61:
        return "Light Rain";
      case 63:
        return "Rain";
      case 65:
        return "Heavy Rain";
      case 66:
        return "Light Freezing Rain";
      case 67:
        return "Heavy Freezing Rain";
      case 71:
        return "Light Snow";
      case 73:
        return "Snow";
      case 75:
        return "Heavy Snow";
      case 77:
        return "Snow Grains";
      case 80:
        return "Light Showers";
      case 81:
        return "Showers";
      case 82:
        return "Heavy Showers";
      case 85:
        return "Snow Showers";
      case 86:
        return "Heavy Snow Showers";
      case 95:
        return "Thunderstorm";
      case 96:
        return "Thunderstorm & Hail";
      case 99:
        return "Thunderstorm & Heavy Hail";
      default:
        return "Unknown (Code: $code)";
    }
  }
}
