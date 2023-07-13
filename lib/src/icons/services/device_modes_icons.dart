class DeviceModesIcons {
  const DeviceModesIcons._();

  static const String _pathPrefix = 'services/device_modes/';

  static const String off = '${_pathPrefix}mode_off';
  static const String heat = '${_pathPrefix}mode_heat';
  static const String cool = '${_pathPrefix}mode_cool';
  static const String auto = '${_pathPrefix}mode_auto';
  static const String auxHeat = '${_pathPrefix}mode_aux_heat';
  static const String resume = '${_pathPrefix}mode_resume';
  static const String fan = '${_pathPrefix}mode_fan';
  static const String furnace = '${_pathPrefix}mode_furnace';
  static const String dryAir = '${_pathPrefix}mode_dry_air';
  static const String moistAir = '${_pathPrefix}mode_moist_air';
  static const String autoChangeover = '${_pathPrefix}mode_aut_changeover';
  static const String energyHeat = '${_pathPrefix}mode_energy_heat';
  static const String energyCool = '${_pathPrefix}mode_energy_cool';
  static const String away = '${_pathPrefix}mode_away';

  static const Map<String, String> entities = <String, String>{
    'off': off,
    'heat': heat,
    'cool': cool,
    'auto': auto,
    'aux_heat': auxHeat,
    'resume': resume,
    'fan': fan,
    'furnace': furnace,
    'dry_air': dryAir,
    'moist_air': moistAir,
    'auto_changeover': autoChangeover,
    'energy_heat': energyHeat,
    'energy_cool': energyCool,
    'away': away,
  };
}
