class DogIcons {
  const DogIcons._();

  static const String _pathPrefix = 'dogs/';

  static const String bone = '${_pathPrefix}bone';
  static const String dead = '${_pathPrefix}dead';
  static const String leash = '${_pathPrefix}leash';
  static const String normal = '${_pathPrefix}normal';
  static const String normalWithoutEyes = '${_pathPrefix}normal_without_eyes';
  static const String sleep = '${_pathPrefix}sleep';
  static const String stars = '${_pathPrefix}stars';
  static const String walking = '${_pathPrefix}walking';

  static const Map<String, String> map = <String, String>{
    'bone': bone,
    'dead': dead,
    'leash': leash,
    'normal': normal,
    'normal_without_eyes': normalWithoutEyes,
    'sleep': sleep,
    'stars': stars,
    'walking': walking,
  };
}
