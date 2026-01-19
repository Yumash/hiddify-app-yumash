import 'dart:convert';
import 'dart:io';

import 'package:hiddify/core/directories/directories_provider.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

/// A SharedPreferences-compatible wrapper that stores data in a JSON file
/// when running in portable mode, otherwise delegates to SharedPreferences.
class PortablePreferences implements SharedPreferences {
  PortablePreferences._(this._data, this._file);

  final Map<String, Object> _data;
  final File? _file;

  static final _logger = Loggy('PortablePreferences');

  /// Creates a PortablePreferences instance.
  /// In portable mode, reads from/writes to preferences.json in portable_data folder.
  /// Otherwise, delegates to standard SharedPreferences.
  static Future<SharedPreferences> getInstance() async {
    final portableDir = getPortableDirectory();

    if (portableDir != null) {
      _logger.info('Using portable preferences in: ${portableDir.path}');
      final file = File(p.join(portableDir.path, 'preferences.json'));
      Map<String, Object> data = {};

      if (file.existsSync()) {
        try {
          final content = await file.readAsString();
          final decoded = jsonDecode(content);
          if (decoded is Map) {
            data = Map<String, Object>.from(decoded);
          }
        } catch (e) {
          _logger.warning('Error reading portable preferences, starting fresh: $e');
        }
      }

      return PortablePreferences._(data, file);
    }

    // Not in portable mode, use standard SharedPreferences
    return SharedPreferences.getInstance();
  }

  Future<void> _save() async {
    if (_file == null) return;
    try {
      final parent = _file.parent;
      if (!parent.existsSync()) {
        await parent.create(recursive: true);
      }
      await _file.writeAsString(jsonEncode(_data));
    } catch (e) {
      _logger.error('Error saving portable preferences: $e');
    }
  }

  @override
  Set<String> getKeys() => _data.keys.toSet();

  @override
  Object? get(String key) => _data[key];

  @override
  bool? getBool(String key) => _data[key] as bool?;

  @override
  int? getInt(String key) => _data[key] as int?;

  @override
  double? getDouble(String key) => _data[key] as double?;

  @override
  String? getString(String key) => _data[key] as String?;

  @override
  List<String>? getStringList(String key) {
    final value = _data[key];
    if (value is List) {
      return value.cast<String>();
    }
    return null;
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    _data[key] = value;
    await _save();
    return true;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    _data[key] = value;
    await _save();
    return true;
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    _data[key] = value;
    await _save();
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    _data[key] = value;
    await _save();
    return true;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    _data[key] = value;
    await _save();
    return true;
  }

  @override
  Future<bool> remove(String key) async {
    _data.remove(key);
    await _save();
    return true;
  }

  @override
  bool containsKey(String key) => _data.containsKey(key);

  @override
  Future<bool> clear() async {
    _data.clear();
    await _save();
    return true;
  }

  @override
  Future<void> reload() async {
    if (_file == null || !_file.existsSync()) return;
    try {
      final content = await _file.readAsString();
      final decoded = jsonDecode(content);
      if (decoded is Map) {
        _data.clear();
        _data.addAll(Map<String, Object>.from(decoded));
      }
    } catch (e) {
      _logger.warning('Error reloading portable preferences: $e');
    }
  }

  @override
  Future<bool> commit() async {
    await _save();
    return true;
  }
}
