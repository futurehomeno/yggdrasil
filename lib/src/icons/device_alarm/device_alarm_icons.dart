enum DeviceAlarmIconState {
  activ,
  deactiv,
}

class DeviceAlarmIcons {
  const DeviceAlarmIcons._();

  static const String alarmBurglarTamperRemovedCoverActiv = 'device_alarm/alarm_burglar_tamper_removed_cover_activ';
  static const String alarmBurglarTamperRemovedCoverDeactiv = 'device_alarm/alarm_burglar_tamper_removed_cover_deactiv';
  static const String alarmFireSmokeActiv = 'device_alarm/alarm_fire_smoke_activ';
  static const String alarmFireSmokeDeactiv = 'device_alarm/alarm_fire_smoke_deactiv';
  static const String alarmFireSmokeTestActiv = 'device_alarm/alarm_fire_smoke_test_activ';
  static const String alarmFireSmokeTestDeactiv = 'device_alarm/alarm_fire_smoke_test_deactiv';
  static const String alarmGasCO2Activ = 'device_alarm/alarm_gas_CO2_activ';
  static const String alarmGasCO2Deactiv = 'device_alarm/alarm_gas_CO2_deactiv';
  static const String alarmGasCOActiv = 'device_alarm/alarm_gas_CO_activ';
  static const String alarmGasCODeactiv = 'device_alarm/alarm_gas_CO_deactiv';
  static const String alarmGasCombustGasDetectedActiv = 'device_alarm/alarm_gas_combust_gas_detected_activ';
  static const String alarmGasCombustGasDetectedDeactiv = 'device_alarm/alarm_gas_combust_gas_detected_deactiv';
  static const String alarmGasReplaceActiv = 'device_alarm/alarm_gas_replace_activ';
  static const String alarmGasReplaceDeactiv = 'device_alarm/alarm_gas_replace_deactiv';
  static const String alarmGasTestActiv = 'device_alarm/alarm_gas_test_activ';
  static const String alarmGasTestDeactiv = 'device_alarm/alarm_gas_test_deactiv';
  static const String alarmGasToxicGasDetectedActiv = 'device_alarm/alarm_gas_toxic_gas_detected_activ';
  static const String alarmGasToxicGasDetectedDeactiv = 'device_alarm/alarm_gas_toxic_gas_detected_deactiv';
  static const String alarmHeatOverheatActiv = 'device_alarm/alarm_heat_overheat_activ';
  static const String alarmHeatOverheatDeactiv = 'device_alarm/alarm_heat_overheat_deactiv';
  static const String alarmHeatTempRiseActiv = 'device_alarm/alarm_heat_temp_rise_activ';
  static const String alarmHeatTempRiseDeactiv = 'device_alarm/alarm_heat_temp_rise_deactiv';
  static const String alarmPowerACOffActiv = 'device_alarm/alarm_power_ac_off_activ';
  static const String alarmPowerACOffDeactiv = 'device_alarm/alarm_power_ac_off_deactiv';
  static const String alarmPowerACOnActiv = 'device_alarm/alarm_power_ac_on_activ';
  static const String alarmPowerACOnDeactiv = 'device_alarm/alarm_power_ac_on_deactiv';
  static const String alarmPowerOverCurrentActiv = 'device_alarm/alarm_power_over_current_activ';
  static const String alarmPowerOverCurrentDeactiv = 'device_alarm/alarm_power_over_current_deactiv';
  static const String alarmPowerReplaceSoonActiv = 'device_alarm/alarm_power_replace_soon_activ';
  static const String alarmPowerReplaceSoonDeactiv = 'device_alarm/alarm_power_replace_soon_deactiv';
  static const String alarmSystemHWFailureActiv = 'device_alarm/alarm_system_hw_failure_activ';
  static const String alarmSystemHWFailureDeactiv = 'device_alarm/alarm_system_hw_failure_deactiv';
  static const String alarmWaterLeakActiv = 'device_alarm/alarm_water_leak_activ';
  static const String alarmWaterLeakDeactiv = 'device_alarm/alarm_water_leak_deactiv';

  static const Map<String, String> map = <String, String>{
    'alarm_burglar_tamper_force_open_activ': 'device_alarm/alarm_burglar_tamper_force_open_activ',
    'alarm_burglar_tamper_force_open_deactiv': 'device_alarm/alarm_burglar_tamper_force_open_deactiv',
    'alarm_burglar_tamper_invalid_code_activ': 'device_alarm/alarm_burglar_tamper_invalid_code_activ',
    'alarm_burglar_tamper_invalid_code_deactiv': 'device_alarm/alarm_burglar_tamper_invalid_code_deactiv',
    'alarm_burglar_tamper_removed_cover_activ': 'device_alarm/alarm_burglar_tamper_removed_cover_activ',
    'alarm_burglar_tamper_removed_cover_deactiv': 'device_alarm/alarm_burglar_tamper_removed_cover_deactiv',
    'alarm_fire_smoke_activ': 'device_alarm/alarm_fire_smoke_activ',
    'alarm_fire_smoke_deactiv': 'device_alarm/alarm_fire_smoke_deactiv',
    'alarm_fire_smoke_test_activ': 'device_alarm/alarm_fire_smoke_test_activ',
    'alarm_fire_smoke_test_deactiv': 'device_alarm/alarm_fire_smoke_test_deactiv',
    'alarm_gas_CO2_activ': 'device_alarm/alarm_gas_CO2_activ',
    'alarm_gas_CO2_deactiv': 'device_alarm/alarm_gas_CO2_deactiv',
    'alarm_gas_CO_activ': 'device_alarm/alarm_gas_CO_activ',
    'alarm_gas_CO_deactiv': 'device_alarm/alarm_gas_CO_deactiv',
    'alarm_gas_combust_gas_detected_activ': 'device_alarm/alarm_gas_combust_gas_detected_activ',
    'alarm_gas_combust_gas_detected_deactiv': 'device_alarm/alarm_gas_combust_gas_detected_deactiv',
    'alarm_gas_replace_activ': 'device_alarm/alarm_gas_replace_activ',
    'alarm_gas_replace_deactiv': 'device_alarm/alarm_gas_replace_deactiv',
    'alarm_gas_test_activ': 'device_alarm/alarm_gas_test_activ',
    'alarm_gas_test_deactiv': 'device_alarm/alarm_gas_test_deactiv',
    'alarm_gas_toxic_gas_detected_activ': 'device_alarm/alarm_gas_toxic_gas_detected_activ',
    'alarm_gas_toxic_gas_detected_deactiv': 'device_alarm/alarm_gas_toxic_gas_detected_deactiv',
    'alarm_heat_overheat_activ': 'device_alarm/alarm_heat_overheat_activ',
    'alarm_heat_overheat_deactiv': 'device_alarm/alarm_heat_overheat_deactiv',
    'alarm_heat_temp_rise_activ': 'device_alarm/alarm_heat_temp_rise_activ',
    'alarm_heat_temp_rise_deactiv': 'device_alarm/alarm_heat_temp_rise_deactiv',
    'alarm_power_ac_off_activ': 'device_alarm/alarm_power_ac_off_activ',
    'alarm_power_ac_off_deactiv': 'device_alarm/alarm_power_ac_off_deactiv',
    'alarm_power_ac_on_activ': 'device_alarm/alarm_power_ac_on_activ',
    'alarm_power_ac_on_deactiv': 'device_alarm/alarm_power_ac_on_deactiv',
    'alarm_power_over_current_activ': 'device_alarm/alarm_power_over_current_activ',
    'alarm_power_over_current_deactiv': 'device_alarm/alarm_power_over_current_deactiv',
    'alarm_power_replace_soon_activ': 'device_alarm/alarm_power_replace_soon_activ',
    'alarm_power_replace_soon_deactiv': 'device_alarm/alarm_power_replace_soon_deactiv',
    'alarm_system_hw_failure_activ': 'device_alarm/alarm_system_hw_failure_activ',
    'alarm_system_hw_failure_deactiv': 'device_alarm/alarm_system_hw_failure_deactiv',
    'alarm_water_leak_activ': 'device_alarm/alarm_water_leak_activ',
    'alarm_water_leak_deactiv': 'device_alarm/alarm_water_leak_deactiv',
  };
}
