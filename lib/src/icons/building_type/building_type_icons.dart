enum BuildingTypeIconSize {
  s,
  m,
  l,
}

class BuildingTypeIcons {
  const BuildingTypeIcons._();

  static const String _pathPrefix = 'building_type/';

  static const String apartmentL = '${_pathPrefix}apartment_l';
  static const String apartmentM = '${_pathPrefix}apartment_m';
  static const String apartmentS = '${_pathPrefix}apartment_s';
  static const String holidayHomeL = '${_pathPrefix}holiday_home_l';
  static const String holidayHomeM = '${_pathPrefix}holiday_home_m';
  static const String holidayHomeS = '${_pathPrefix}holiday_home_s';
  static const String houseL = '${_pathPrefix}house_l';
  static const String houseM = '${_pathPrefix}house_m';
  static const String houseS = '${_pathPrefix}house_s';
  static const String officeL = '${_pathPrefix}office_l';
  static const String officeM = '${_pathPrefix}office_m';
  static const String officeS = '${_pathPrefix}office_s';

  static String getApartmentIcon(BuildingTypeIconSize buildingTypeIconSize) {
    switch (buildingTypeIconSize) {
      case BuildingTypeIconSize.s:
        return apartmentS;

      case BuildingTypeIconSize.m:
        return apartmentM;

      case BuildingTypeIconSize.l:
        return apartmentL;
    }
  }

  static String getHolidayHomeIcon(BuildingTypeIconSize buildingTypeIconSize) {
    switch (buildingTypeIconSize) {
      case BuildingTypeIconSize.s:
        return holidayHomeS;

      case BuildingTypeIconSize.m:
        return holidayHomeM;

      case BuildingTypeIconSize.l:
        return holidayHomeL;
    }
  }

  static String getHouseIcon(BuildingTypeIconSize buildingTypeIconSize) {
    switch (buildingTypeIconSize) {
      case BuildingTypeIconSize.s:
        return houseS;

      case BuildingTypeIconSize.m:
        return houseM;

      case BuildingTypeIconSize.l:
        return houseL;
    }
  }

  static String getOfficeIcon(BuildingTypeIconSize buildingTypeIconSize) {
    switch (buildingTypeIconSize) {
      case BuildingTypeIconSize.s:
        return officeS;

      case BuildingTypeIconSize.m:
        return officeM;

      case BuildingTypeIconSize.l:
        return officeL;
    }
  }
}
