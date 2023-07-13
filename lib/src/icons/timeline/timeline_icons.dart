/// Icons for all supported timeline events.
///
/// For a complete list of events, see [TimelineEvents].
class TimelineIcons {
  const TimelineIcons._();

  static const String _pathPrefix = 'timeline/events/';

  // region Kind Owl - x, xx and 1xx
  // ------------------------
  // 0 - 9
  static const String test = '${_pathPrefix}0_test_25';
  static const String criticalHighTemperature = '${_pathPrefix}1_critical_high_temperature_25';
  static const String highTemperature = '${_pathPrefix}2_high_temperature_25';
  static const String lowTemperature = '${_pathPrefix}3_low_temperature_25';
  static const String criticalLowTemperature = '${_pathPrefix}4_critical_low_temperature_25';
  static const String normalTemperature = '${_pathPrefix}5_normal_temperature_25';
  static const String smokeDetected = '${_pathPrefix}6_smoke_detected_25';
  static const String smokeCleared = '${_pathPrefix}7_smoke_cleared_25';
  static const String floodDetected = '${_pathPrefix}8_flood_detected_25';
  static const String floodCleared = '${_pathPrefix}9_flood_cleared_25';

  // 10 - 19
  static const String lowBattery = '${_pathPrefix}10_low_battery_25';
  static const String lowBatterySafe = '${_pathPrefix}11_low_battery_safe_25';
  static const String tamper = '${_pathPrefix}12_tamper_25';
  static const String tamperSafe = '${_pathPrefix}13_tamper_safe_25';
  static const String deviceProblem = '${_pathPrefix}14_device_problem_25';
  static const String deviceOK = '${_pathPrefix}15_device_ok_25';
  static const String motionDetected = '${_pathPrefix}16_motion_detected_25';
  static const String motionOK = '${_pathPrefix}17_motion_ok_25';
  static const String contactOpened = '${_pathPrefix}18_contact_opened_25';
  static const String contactClosed = '${_pathPrefix}19_contact_closed_25';

  // 20 - 29
  static const String fireEscalated = '${_pathPrefix}20_fire_escalated_25';
  static const String fireSuppressedBtn = '${_pathPrefix}21_fire_suppressed_btn_25';
  static const String heatOverheated = '${_pathPrefix}22_heat_overheated_25';
  static const String heatOverheatedOK = '${_pathPrefix}23_heat_overheated_ok_25';
  static const String heatTempRise = '${_pathPrefix}24_heat_temp_rise_25';
  static const String heatTempRiseOK = '${_pathPrefix}25_heat_temp_rise_ok_25';
  static const String heatUnderheated = '${_pathPrefix}26_heat_underheated_25';
  static const String heatUnderheatedOK = '${_pathPrefix}27_heat_underheated_ok_25';
  static const String gasCO = '${_pathPrefix}28_gas_co_25';
  static const String gasCOOK = '${_pathPrefix}29_gas_co_ok_25';

  // 30 - 39
  static const String gasCO2 = '${_pathPrefix}30_gas_co2_25';
  static const String gasCO2OK = '${_pathPrefix}31_gas_co2_ok_25';
  static const String gasCombust = '${_pathPrefix}32_gas_combust_25';
  static const String gasCombustOK = '${_pathPrefix}33_gas_combust_ok_25';
  static const String gasToxic = '${_pathPrefix}34_gas_toxic_25';
  // 35 - Unused
  static const String gasToxicOK = '${_pathPrefix}36_gas_toxic_ok_25';
  static const String gasReplace = '${_pathPrefix}37_gas_replace_25';
  static const String gasReplaceOK = '${_pathPrefix}38_gas_replace_ok_25';
  static const String gasTest = '${_pathPrefix}39_gas_test_25';

  // 40 - 49
  static const String gasTestOK = '${_pathPrefix}40_gas_test_ok_25';
  static const String smokeTest = '${_pathPrefix}41_smoke_test_25';
  static const String smokeTestCleared = '${_pathPrefix}42_smoke_test_cleared_25';
  static const String barrierOpened = '${_pathPrefix}43_barrier_opened_25';
  static const String barrierClosed = '${_pathPrefix}44_barrier_closed_25';
  static const String doorLocked = '${_pathPrefix}45_door_locked_25';
  static const String doorUnlocked = '${_pathPrefix}46_door_unlocked_25';
  static const String lockLatchOpened = '${_pathPrefix}47_lock_latch_opened_25';
  static const String lockLatchClosed = '${_pathPrefix}48_lock_latch_closed_25';
  static const String doorOpened = '${_pathPrefix}49_door_opened_25';

  // 50 - 59
  static const String doorClosed = '${_pathPrefix}50_door_closed_25';
  static const String doorSecured = '${_pathPrefix}51_door_secured_25';
  static const String doorUnsecured = '${_pathPrefix}52_door_unsecured_25';
  // homeModeChanged uses mode icon.
  // deviceMoved uses device icon.
  static const String hubOnline = '${_pathPrefix}55_hub_online_25';
  static const String hubOffline = '${_pathPrefix}56_hub_offline_25';
  // roomAdded uses room icon.
  // roomDeleted uses room icon.
  static const String deviceInclusion = '${_pathPrefix}59_device_inclusion_25';

  // 60 - 69
  // deviceAdded uses device icon.
  static const String deviceExclusion = '${_pathPrefix}61_device_exclusion_25';
  // deviceDeleted uses device icon.
  // deviceRenamed uses device icon.
  static const String temperatureSet = '${_pathPrefix}64_temperature_set_25';
  static const String dimSet = '${_pathPrefix}65_dim_set_25';
  static const String shutterOpened = '${_pathPrefix}66_shutter_opened_25';
  static const String shutterClosed = '${_pathPrefix}67_shutter_closed_25';
  // shutterSet uses shutter icons. See TimelineShutterIcons.
  static const String shortcutSet = '${_pathPrefix}69_shortcut_set_25';

  // 70 - 79
  static const String autolockOn = '${_pathPrefix}70_autolock_on_25';
  static const String autolockOff = '${_pathPrefix}71_autolock_off_25';
  // powerOn uses device icon.
  // powerOff uses device icon.
  static const String customMessage = '${_pathPrefix}74_custom_message_25';
  static const String smokeACOff = '${_pathPrefix}75_smoke_ac_off_25';
  static const String smokeACOn = '${_pathPrefix}76_smoke_ac_on_25';
  static const String smokeACOff60 = '${_pathPrefix}77_smoke_ac_off_60_25';
  static const String smokeACOn60 = '${_pathPrefix}78_smoke_ac_on_60_25';
  static const String smokeTampered6h = '${_pathPrefix}79_smoke_tampered_6h_25';

  // 80 - 89
  static const String smokeTampered6hSafe = '${_pathPrefix}80_smoke_tamper_6h_safe_25';
  static const String smokeContactLost3h = '${_pathPrefix}81_smoke_contact_lost_3h_25';
  static const String smokeContactRestored3h = '${_pathPrefix}82_smoke_contact_restored_3h_25';
  static const String smokeContactLost12h = '${_pathPrefix}83_smoke_contact_lost_13h_25';
  static const String smokeContactRestored12h = '${_pathPrefix}84_smoke_contact_restored_12h_25';
  static const String smokeTampered12h = '${_pathPrefix}85_smoke_tampered_12h_25';
  static const String smokeTampered12hSafe = '${_pathPrefix}86_smoke_tamper_12h_safe_25';
  static const String accessDenied = '${_pathPrefix}87_access_denied_25';
  static const String accessGranted = '${_pathPrefix}88_access_granted_25';
  static const String aliasAdded = '${_pathPrefix}89_alias_added_25';

  // 90 - 99
  static const String aliasDeleted = '${_pathPrefix}90_alias_deleted_25';
  static const String aliasAllDeleted = '${_pathPrefix}91_alias_all_deleted_25';
  static const String aliasLocked = '${_pathPrefix}92_alias_locked_25';
  static const String fireSuppressedCmd = '${_pathPrefix}93_fire_suppressed_cmd_25';
  static const String fireSuppressedSensor = '${_pathPrefix}94_fire_suppressed_sensor_25';
  static const String fireSuppressedApp = '${_pathPrefix}95_fire_suppressed_app_25';
  static const String fireDeescalated = '${_pathPrefix}96_fire_deescalated_25';
  static const String doorSecureModeOn = '${_pathPrefix}97_doors_secured_25';
  static const String doorSecureModeOff = '${_pathPrefix}98_doors_unsecure_25';
  static const String tamperForceOpen = '${_pathPrefix}99_tamper_force_open_25';

  // 100 - 109
  static const String lockJammed = '${_pathPrefix}100_lock_jammed_25';
  static const String keypadUnblocked = '${_pathPrefix}101_keypad_unblocked_25';
  static const String lockError = '${_pathPrefix}102_lock_error_25';
  static const String manualUnlock = '${_pathPrefix}103_manual_unlock_25';
  static const String manualLock = '${_pathPrefix}104_manual_lock_25';
  // 105 - Unused
  // 106 - Unused
  // 107 - Unused
  // 108 - Unused
  // 109 - Unused
  // endregion

  // region Angry Dog - 3xx
  // ------------------------
  // 300 - 309
  static const String angryDogRifleTestReport = '${_pathPrefix}300_rifle_test_report_25';
  // 301 - Unused
  // 302 - Unused
  // 303 - Unused
  // 304 - Unused
  // 305 - Unused
  // 306 - Unused
  // 307 - Unused
  // 308 - Unused
  // 309 - Unused
  // endregion

  // region MDU App Events - 5xx
  // ------------------------
  // 500 - 509
  static const String mduAppFireConfirmed = '${_pathPrefix}500_mdu_fire_confirmed_25';
  static const String mduAppFireCancelled = '${_pathPrefix}501_mdu_fire_cancelled_25';
  static const String mduAppFireEscalatedCancelled = '${_pathPrefix}502_mdu_fire_escalated_cancelled_25';
  static const String mduAppLowBatterySdco = '${_pathPrefix}503_mdu_low_battery_sdco_25';
  static const String mduAppLowBatteryWls = '${_pathPrefix}504_mdu_low_battery_wls_25';
  // 505 - Unused
  static const String mduAppLowBatterySafeSdco = '${_pathPrefix}506_mdu_low_battery_safe_sdco_25';
  static const String mduAppLowBatterySafeWls = '${_pathPrefix}507_mdu_low_battery_safe_wls_25_25';
  // 508 - Unused
  // 509 - Unused
  // endregion

  // region Vinculum Events - 6xx
  // ------------------------
  // 600 - 609
  static const String vinculumFireActiv = '${_pathPrefix}600_vinculum_fire_activated_25';
  static const String vinculumFireDeactiv = '${_pathPrefix}601_vinculum_fire_deactivated_25';
  static const String vinculumFireEscalatedActiv = '${_pathPrefix}602_vinculum_fire_escalated_25';
  static const String vinculumFireEscalatedDeactiv = '${_pathPrefix}603_vinculum_fire_deescalated_25';
  static const String vinculumFireCanceledByUser = '${_pathPrefix}604_vinculum_fire_cancelled_by_user_25';
  static const String vinculumBlacklistDevice = '${_pathPrefix}605_vinculum_blacklist_device_25';
  static const String vinculumBlacklistDeviceClear = '${_pathPrefix}606_vinculum_blacklist_device_clear_25';
  // 607 - Unused
  // 608 - Unused
  // 609 - Unused
  // endregion

  // region Hub Registry - 7xx
  // ------------------------
  // 700 - 709
  static const String hubRegHubRemoved = '${_pathPrefix}700_hub_reg_hub_removed_25';
  static const String hubRegHubAdded = '${_pathPrefix}701_hub_reg_hub_added_25';
  static const String hubRegHubOnline = '${_pathPrefix}702_hub_reg_hub_online_25';
  static const String hubRegHubOffline = '${_pathPrefix}703_hub_reg_hub_offline_25';
  static const String hubRegHubStateChanged = '${_pathPrefix}704_hub_reg_hub_state_changed_25';
  // 705 - Unused
  // 706 - Unused
  // 707 - Unused
  // 708 - Unused
  // 709 - Unused
  // endregion

  // region Other - 9xx
  // ------------------------
  // 990 - Unused
  // 991 - Unused
  // 992 - Unused
  // 993 - Unused
  // 994 - Unused
  // 995 - Unused
  // 996 - Unused
  static const String fireOnRemoteSite = '${_pathPrefix}997_fire_on_remote_site_25';
  static const String fireOnRemoteSiteOk = '${_pathPrefix}998_fire_on_remote_site_ok_25';
  static const String notificationTest = '${_pathPrefix}999_notification_test_25';
  // endregion

  // region Unknown
  // ------------------------
  static const String unknownEvent = '${_pathPrefix}unknownEvent';
  // endregion
}
