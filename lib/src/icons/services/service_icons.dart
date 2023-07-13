class ServiceIcons {
  const ServiceIcons._();

  static const String _pathPrefix = 'services/';

  static const String alarmAppliance = '${_pathPrefix}alarm_appliance';
  static const String alarmBurglar = '${_pathPrefix}alarm_burglar';
  static const String alarmEmergency = '${_pathPrefix}alarm_emergency';
  static const String alarmGas = '${_pathPrefix}alarm_gas';
  static const String alarmHealth = '${_pathPrefix}alarm_health';
  static const String alarmLock = '${_pathPrefix}alarm_lock';
  static const String alarmOverheat = '${_pathPrefix}alarm_overheat';
  static const String alarmPower = '${_pathPrefix}alarm_power';
  static const String alarmSiren = '${_pathPrefix}alarm_siren';
  static const String alarmSystem = '${_pathPrefix}alarm_system';
  static const String alarmTime = '${_pathPrefix}alarm_time';
  static const String alarmUnderheat = '${_pathPrefix}alarm_underheat';
  static const String alarmWater = '${_pathPrefix}alarm_water';
  static const String alarmWaterValve = '${_pathPrefix}alarm_water_valve';
  static const String alarmWeather = '${_pathPrefix}alarm_weather';
  static const String alarmFire = '${_pathPrefix}alarm_fire';
  static const String batteryLow = '${_pathPrefix}batteryLow';
  static const String batteryOK = '${_pathPrefix}batteryOK';
  static const String meterElec = '${_pathPrefix}meter_elec';
  static const String sensorAccelX = '${_pathPrefix}sensor_accelx';
  static const String sensorAccelY = '${_pathPrefix}sensor_accely';
  static const String sensorAccelZ = '${_pathPrefix}sensor_accelz';
  static const String sensorAirflow = '${_pathPrefix}sensor_airflow';
  static const String sensorAnglepos = '${_pathPrefix}sensor_anglepos';
  static const String sensorAtmo = '${_pathPrefix}sensor_atmo';
  static const String sensorBaro = '${_pathPrefix}sensor_baro';
  static const String sensorCo = '${_pathPrefix}sensor_co';
  static const String sensorCo2 = '${_pathPrefix}sensor_co2';
  static const String sensorContact = '${_pathPrefix}sensor_contact';
  static const String sensorCurrent = '${_pathPrefix}sensor_current';
  static const String sensorDew = '${_pathPrefix}sensor_dew';
  static const String sensorDirect = '${_pathPrefix}sensor_direct';
  static const String sensorDistance = '${_pathPrefix}sensor_distance';
  static const String sensorElresist = '${_pathPrefix}sensor_elresist';
  static const String sensorFreq = '${_pathPrefix}sensor_freq';
  static const String sensorGp = '${_pathPrefix}sensor_gp';
  static const String sensorHumid = '${_pathPrefix}sensor_humid';
  static const String sensorLumin = '${_pathPrefix}sensor_lumin';
  static const String sensorMoist = '${_pathPrefix}sensor_moist';
  static const String sensorPower = '${_pathPrefix}sensor_power';
  static const String sensorRain = '${_pathPrefix}sensor_rain';
  static const String sensorRotation = '${_pathPrefix}sensor_rotation';
  static const String sensorSeismicInt = '${_pathPrefix}sensor_seismicint';
  static const String sensorSeismicMag = '${_pathPrefix}sensor_seismicmag';
  static const String sensorSolarRad = '${_pathPrefix}sensor_solarrad';
  static const String sensorTank = '${_pathPrefix}sensor_tank';
  static const String sensorTideLvl = '${_pathPrefix}sensor_tidelvl';
  static const String sensorVeloc = '${_pathPrefix}sensor_veloc';
  static const String sensorVoltage = '${_pathPrefix}sensor_voltage';
  static const String sensorWatflow = '${_pathPrefix}sensor_watflow';
  static const String sensorWatPressure = '${_pathPrefix}sensor_watpressure';
  static const String sensorWeight = '${_pathPrefix}sensor_weight';
  static const String sensorGust = '${_pathPrefix}sensor_gust';
  static const String sensorNoise = '${_pathPrefix}sensor_noise';
  static const String sensorPresenceDetected = '${_pathPrefix}sensor_presence_detected';
  static const String sensorPresenceNoPresence = '${_pathPrefix}sensor_presence_no_presence';
  static const String sensorTemp = '${_pathPrefix}sensor_temp';
  static const String sensorTempHigh = '${_pathPrefix}sensor_temp_high';
  static const String sensorTempLow = '${_pathPrefix}sensor_temp_low';
  static const String sensorUVHigh = '${_pathPrefix}sensor_uv_high';
  static const String sensorUVNormal = '${_pathPrefix}sensor_uv_normal';
  static const String sensorWind = '${_pathPrefix}sensor_wind';
  static const String unknown = '${_pathPrefix}unknown';

  static const Map<String, String> entities = <String, String>{
    'alarm_appliance': alarmAppliance,
    'alarm_burglar': alarmBurglar,
    'alarm_emergency': alarmEmergency,
    'alarm_fire': alarmFire,
    'alarm_gas': alarmGas,
    'alarm_health': alarmHealth,
    'alarm_heat': alarmOverheat,
    'alarm_lock': alarmLock,
    'alarm_power': alarmPower,
    'alarm_siren': alarmSiren,
    'alarm_system': alarmSystem,
    'alarm_time': alarmTime,
    'alarm_water': alarmWater,
    'alarm_water_valve': alarmWaterValve,
    'alarm_weather': alarmWeather,
    'battery': batteryLow,
    'meter_elec': meterElec,
    'sensor_accelx': sensorAccelX,
    'sensor_accely': sensorAccelY,
    'sensor_accelz': sensorAccelZ,
    'sensor_airflow': sensorAirflow,
    'sensor_anglepos': sensorAnglepos,
    'sensor_atmo': sensorAtmo,
    'sensor_baro': sensorBaro,
    'sensor_co': sensorCo,
    'sensor_co2': sensorCo2,
    'sensor_contact': sensorContact,
    'sensor_current': sensorCurrent,
    'sensor_dew': sensorDew,
    'sensor_direct': sensorDirect,
    'sensor_distance': sensorDistance,
    'sensor_elresist': sensorElresist,
    'sensor_freq': sensorFreq,
    'sensor_gp': sensorGp,
    'sensor_gust': sensorGust,
    'sensor_humid': sensorHumid,
    'sensor_lumin': sensorLumin,
    'sensor_moist': sensorMoist,
    'sensor_noise': sensorNoise,
    'sensor_power': sensorPower,
    'sensor_presence': sensorPresenceDetected,
    'sensor_rain': sensorRain,
    'sensor_rotation': sensorRotation,
    'sensor_seismicint': sensorSeismicInt,
    'sensor_seismicmag': sensorSeismicMag,
    'sensor_solarrad': sensorSolarRad,
    'sensor_tank': sensorTank,
    'sensor_temp': sensorTemp,
    'sensor_tidelvl': sensorTideLvl,
    'sensor_uv': sensorUVHigh,
    'sensor_veloc': sensorVeloc,
    'sensor_voltage': sensorVoltage,
    'sensor_watflow': sensorWatflow,
    'sensor_watpressure': sensorWatPressure,
    'sensor_weight': sensorWeight,
    'sensor_wind': sensorWind,
  };
}
