import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

typedef ValueParser<T extends TokenValue> = Result<T> Function(UnresolvedValue unresolvedValue);
typedef ReferenceParser<T extends TokenValue> = Result<T> Function(UnresolvedReference unresolvedReference);
typedef ValueOrReferenceParser<T extends TokenValue> = Result<T> Function(UnresolvedValueOrReference valueOrReference);
