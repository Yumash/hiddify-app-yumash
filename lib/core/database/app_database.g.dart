// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfileEntriesTable extends ProfileEntries
    with TableInfo<$ProfileEntriesTable, ProfileEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ProfileType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ProfileType>($ProfileEntriesTable.$convertertype);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastUpdateMeta = const VerificationMeta(
    'lastUpdate',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
    'last_update',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Duration?, int> updateInterval =
      GeneratedColumn<int>(
        'update_interval',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<Duration?>(
        $ProfileEntriesTable.$converterupdateIntervaln,
      );
  static const VerificationMeta _uploadMeta = const VerificationMeta('upload');
  @override
  late final GeneratedColumn<int> upload = GeneratedColumn<int>(
    'upload',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _downloadMeta = const VerificationMeta(
    'download',
  );
  @override
  late final GeneratedColumn<int> download = GeneratedColumn<int>(
    'download',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expireMeta = const VerificationMeta('expire');
  @override
  late final GeneratedColumn<DateTime> expire = GeneratedColumn<DateTime>(
    'expire',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _webPageUrlMeta = const VerificationMeta(
    'webPageUrl',
  );
  @override
  late final GeneratedColumn<String> webPageUrl = GeneratedColumn<String>(
    'web_page_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supportUrlMeta = const VerificationMeta(
    'supportUrl',
  );
  @override
  late final GeneratedColumn<String> supportUrl = GeneratedColumn<String>(
    'support_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _testUrlMeta = const VerificationMeta(
    'testUrl',
  );
  @override
  late final GeneratedColumn<String> testUrl = GeneratedColumn<String>(
    'test_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    active,
    name,
    url,
    lastUpdate,
    updateInterval,
    upload,
    download,
    total,
    expire,
    webPageUrl,
    supportUrl,
    testUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('last_update')) {
      context.handle(
        _lastUpdateMeta,
        lastUpdate.isAcceptableOrUnknown(data['last_update']!, _lastUpdateMeta),
      );
    } else if (isInserting) {
      context.missing(_lastUpdateMeta);
    }
    if (data.containsKey('upload')) {
      context.handle(
        _uploadMeta,
        upload.isAcceptableOrUnknown(data['upload']!, _uploadMeta),
      );
    }
    if (data.containsKey('download')) {
      context.handle(
        _downloadMeta,
        download.isAcceptableOrUnknown(data['download']!, _downloadMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    }
    if (data.containsKey('expire')) {
      context.handle(
        _expireMeta,
        expire.isAcceptableOrUnknown(data['expire']!, _expireMeta),
      );
    }
    if (data.containsKey('web_page_url')) {
      context.handle(
        _webPageUrlMeta,
        webPageUrl.isAcceptableOrUnknown(
          data['web_page_url']!,
          _webPageUrlMeta,
        ),
      );
    }
    if (data.containsKey('support_url')) {
      context.handle(
        _supportUrlMeta,
        supportUrl.isAcceptableOrUnknown(data['support_url']!, _supportUrlMeta),
      );
    }
    if (data.containsKey('test_url')) {
      context.handle(
        _testUrlMeta,
        testUrl.isAcceptableOrUnknown(data['test_url']!, _testUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: $ProfileEntriesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      lastUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_update'],
      )!,
      updateInterval: $ProfileEntriesTable.$converterupdateIntervaln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}update_interval'],
        ),
      ),
      upload: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}upload'],
      ),
      download: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}download'],
      ),
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      ),
      expire: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expire'],
      ),
      webPageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}web_page_url'],
      ),
      supportUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}support_url'],
      ),
      testUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_url'],
      ),
    );
  }

  @override
  $ProfileEntriesTable createAlias(String alias) {
    return $ProfileEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ProfileType, String, String> $convertertype =
      const EnumNameConverter<ProfileType>(ProfileType.values);
  static TypeConverter<Duration, int> $converterupdateInterval =
      DurationTypeConverter();
  static TypeConverter<Duration?, int?> $converterupdateIntervaln =
      NullAwareTypeConverter.wrap($converterupdateInterval);
}

class ProfileEntry extends DataClass implements Insertable<ProfileEntry> {
  final String id;
  final ProfileType type;
  final bool active;
  final String name;
  final String? url;
  final DateTime lastUpdate;
  final Duration? updateInterval;
  final int? upload;
  final int? download;
  final int? total;
  final DateTime? expire;
  final String? webPageUrl;
  final String? supportUrl;
  final String? testUrl;
  const ProfileEntry({
    required this.id,
    required this.type,
    required this.active,
    required this.name,
    this.url,
    required this.lastUpdate,
    this.updateInterval,
    this.upload,
    this.download,
    this.total,
    this.expire,
    this.webPageUrl,
    this.supportUrl,
    this.testUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['type'] = Variable<String>(
        $ProfileEntriesTable.$convertertype.toSql(type),
      );
    }
    map['active'] = Variable<bool>(active);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['last_update'] = Variable<DateTime>(lastUpdate);
    if (!nullToAbsent || updateInterval != null) {
      map['update_interval'] = Variable<int>(
        $ProfileEntriesTable.$converterupdateIntervaln.toSql(updateInterval),
      );
    }
    if (!nullToAbsent || upload != null) {
      map['upload'] = Variable<int>(upload);
    }
    if (!nullToAbsent || download != null) {
      map['download'] = Variable<int>(download);
    }
    if (!nullToAbsent || total != null) {
      map['total'] = Variable<int>(total);
    }
    if (!nullToAbsent || expire != null) {
      map['expire'] = Variable<DateTime>(expire);
    }
    if (!nullToAbsent || webPageUrl != null) {
      map['web_page_url'] = Variable<String>(webPageUrl);
    }
    if (!nullToAbsent || supportUrl != null) {
      map['support_url'] = Variable<String>(supportUrl);
    }
    if (!nullToAbsent || testUrl != null) {
      map['test_url'] = Variable<String>(testUrl);
    }
    return map;
  }

  ProfileEntriesCompanion toCompanion(bool nullToAbsent) {
    return ProfileEntriesCompanion(
      id: Value(id),
      type: Value(type),
      active: Value(active),
      name: Value(name),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      lastUpdate: Value(lastUpdate),
      updateInterval: updateInterval == null && nullToAbsent
          ? const Value.absent()
          : Value(updateInterval),
      upload: upload == null && nullToAbsent
          ? const Value.absent()
          : Value(upload),
      download: download == null && nullToAbsent
          ? const Value.absent()
          : Value(download),
      total: total == null && nullToAbsent
          ? const Value.absent()
          : Value(total),
      expire: expire == null && nullToAbsent
          ? const Value.absent()
          : Value(expire),
      webPageUrl: webPageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(webPageUrl),
      supportUrl: supportUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(supportUrl),
      testUrl: testUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(testUrl),
    );
  }

  factory ProfileEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileEntry(
      id: serializer.fromJson<String>(json['id']),
      type: $ProfileEntriesTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      active: serializer.fromJson<bool>(json['active']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String?>(json['url']),
      lastUpdate: serializer.fromJson<DateTime>(json['lastUpdate']),
      updateInterval: serializer.fromJson<Duration?>(json['updateInterval']),
      upload: serializer.fromJson<int?>(json['upload']),
      download: serializer.fromJson<int?>(json['download']),
      total: serializer.fromJson<int?>(json['total']),
      expire: serializer.fromJson<DateTime?>(json['expire']),
      webPageUrl: serializer.fromJson<String?>(json['webPageUrl']),
      supportUrl: serializer.fromJson<String?>(json['supportUrl']),
      testUrl: serializer.fromJson<String?>(json['testUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(
        $ProfileEntriesTable.$convertertype.toJson(type),
      ),
      'active': serializer.toJson<bool>(active),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String?>(url),
      'lastUpdate': serializer.toJson<DateTime>(lastUpdate),
      'updateInterval': serializer.toJson<Duration?>(updateInterval),
      'upload': serializer.toJson<int?>(upload),
      'download': serializer.toJson<int?>(download),
      'total': serializer.toJson<int?>(total),
      'expire': serializer.toJson<DateTime?>(expire),
      'webPageUrl': serializer.toJson<String?>(webPageUrl),
      'supportUrl': serializer.toJson<String?>(supportUrl),
      'testUrl': serializer.toJson<String?>(testUrl),
    };
  }

  ProfileEntry copyWith({
    String? id,
    ProfileType? type,
    bool? active,
    String? name,
    Value<String?> url = const Value.absent(),
    DateTime? lastUpdate,
    Value<Duration?> updateInterval = const Value.absent(),
    Value<int?> upload = const Value.absent(),
    Value<int?> download = const Value.absent(),
    Value<int?> total = const Value.absent(),
    Value<DateTime?> expire = const Value.absent(),
    Value<String?> webPageUrl = const Value.absent(),
    Value<String?> supportUrl = const Value.absent(),
    Value<String?> testUrl = const Value.absent(),
  }) => ProfileEntry(
    id: id ?? this.id,
    type: type ?? this.type,
    active: active ?? this.active,
    name: name ?? this.name,
    url: url.present ? url.value : this.url,
    lastUpdate: lastUpdate ?? this.lastUpdate,
    updateInterval: updateInterval.present
        ? updateInterval.value
        : this.updateInterval,
    upload: upload.present ? upload.value : this.upload,
    download: download.present ? download.value : this.download,
    total: total.present ? total.value : this.total,
    expire: expire.present ? expire.value : this.expire,
    webPageUrl: webPageUrl.present ? webPageUrl.value : this.webPageUrl,
    supportUrl: supportUrl.present ? supportUrl.value : this.supportUrl,
    testUrl: testUrl.present ? testUrl.value : this.testUrl,
  );
  ProfileEntry copyWithCompanion(ProfileEntriesCompanion data) {
    return ProfileEntry(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      active: data.active.present ? data.active.value : this.active,
      name: data.name.present ? data.name.value : this.name,
      url: data.url.present ? data.url.value : this.url,
      lastUpdate: data.lastUpdate.present
          ? data.lastUpdate.value
          : this.lastUpdate,
      updateInterval: data.updateInterval.present
          ? data.updateInterval.value
          : this.updateInterval,
      upload: data.upload.present ? data.upload.value : this.upload,
      download: data.download.present ? data.download.value : this.download,
      total: data.total.present ? data.total.value : this.total,
      expire: data.expire.present ? data.expire.value : this.expire,
      webPageUrl: data.webPageUrl.present
          ? data.webPageUrl.value
          : this.webPageUrl,
      supportUrl: data.supportUrl.present
          ? data.supportUrl.value
          : this.supportUrl,
      testUrl: data.testUrl.present ? data.testUrl.value : this.testUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileEntry(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('updateInterval: $updateInterval, ')
          ..write('upload: $upload, ')
          ..write('download: $download, ')
          ..write('total: $total, ')
          ..write('expire: $expire, ')
          ..write('webPageUrl: $webPageUrl, ')
          ..write('supportUrl: $supportUrl, ')
          ..write('testUrl: $testUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    active,
    name,
    url,
    lastUpdate,
    updateInterval,
    upload,
    download,
    total,
    expire,
    webPageUrl,
    supportUrl,
    testUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileEntry &&
          other.id == this.id &&
          other.type == this.type &&
          other.active == this.active &&
          other.name == this.name &&
          other.url == this.url &&
          other.lastUpdate == this.lastUpdate &&
          other.updateInterval == this.updateInterval &&
          other.upload == this.upload &&
          other.download == this.download &&
          other.total == this.total &&
          other.expire == this.expire &&
          other.webPageUrl == this.webPageUrl &&
          other.supportUrl == this.supportUrl &&
          other.testUrl == this.testUrl);
}

class ProfileEntriesCompanion extends UpdateCompanion<ProfileEntry> {
  final Value<String> id;
  final Value<ProfileType> type;
  final Value<bool> active;
  final Value<String> name;
  final Value<String?> url;
  final Value<DateTime> lastUpdate;
  final Value<Duration?> updateInterval;
  final Value<int?> upload;
  final Value<int?> download;
  final Value<int?> total;
  final Value<DateTime?> expire;
  final Value<String?> webPageUrl;
  final Value<String?> supportUrl;
  final Value<String?> testUrl;
  final Value<int> rowid;
  const ProfileEntriesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.active = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.updateInterval = const Value.absent(),
    this.upload = const Value.absent(),
    this.download = const Value.absent(),
    this.total = const Value.absent(),
    this.expire = const Value.absent(),
    this.webPageUrl = const Value.absent(),
    this.supportUrl = const Value.absent(),
    this.testUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfileEntriesCompanion.insert({
    required String id,
    required ProfileType type,
    required bool active,
    required String name,
    this.url = const Value.absent(),
    required DateTime lastUpdate,
    this.updateInterval = const Value.absent(),
    this.upload = const Value.absent(),
    this.download = const Value.absent(),
    this.total = const Value.absent(),
    this.expire = const Value.absent(),
    this.webPageUrl = const Value.absent(),
    this.supportUrl = const Value.absent(),
    this.testUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       active = Value(active),
       name = Value(name),
       lastUpdate = Value(lastUpdate);
  static Insertable<ProfileEntry> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<bool>? active,
    Expression<String>? name,
    Expression<String>? url,
    Expression<DateTime>? lastUpdate,
    Expression<int>? updateInterval,
    Expression<int>? upload,
    Expression<int>? download,
    Expression<int>? total,
    Expression<DateTime>? expire,
    Expression<String>? webPageUrl,
    Expression<String>? supportUrl,
    Expression<String>? testUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (active != null) 'active': active,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (updateInterval != null) 'update_interval': updateInterval,
      if (upload != null) 'upload': upload,
      if (download != null) 'download': download,
      if (total != null) 'total': total,
      if (expire != null) 'expire': expire,
      if (webPageUrl != null) 'web_page_url': webPageUrl,
      if (supportUrl != null) 'support_url': supportUrl,
      if (testUrl != null) 'test_url': testUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfileEntriesCompanion copyWith({
    Value<String>? id,
    Value<ProfileType>? type,
    Value<bool>? active,
    Value<String>? name,
    Value<String?>? url,
    Value<DateTime>? lastUpdate,
    Value<Duration?>? updateInterval,
    Value<int?>? upload,
    Value<int?>? download,
    Value<int?>? total,
    Value<DateTime?>? expire,
    Value<String?>? webPageUrl,
    Value<String?>? supportUrl,
    Value<String?>? testUrl,
    Value<int>? rowid,
  }) {
    return ProfileEntriesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      active: active ?? this.active,
      name: name ?? this.name,
      url: url ?? this.url,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      updateInterval: updateInterval ?? this.updateInterval,
      upload: upload ?? this.upload,
      download: download ?? this.download,
      total: total ?? this.total,
      expire: expire ?? this.expire,
      webPageUrl: webPageUrl ?? this.webPageUrl,
      supportUrl: supportUrl ?? this.supportUrl,
      testUrl: testUrl ?? this.testUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ProfileEntriesTable.$convertertype.toSql(type.value),
      );
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (updateInterval.present) {
      map['update_interval'] = Variable<int>(
        $ProfileEntriesTable.$converterupdateIntervaln.toSql(
          updateInterval.value,
        ),
      );
    }
    if (upload.present) {
      map['upload'] = Variable<int>(upload.value);
    }
    if (download.present) {
      map['download'] = Variable<int>(download.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (expire.present) {
      map['expire'] = Variable<DateTime>(expire.value);
    }
    if (webPageUrl.present) {
      map['web_page_url'] = Variable<String>(webPageUrl.value);
    }
    if (supportUrl.present) {
      map['support_url'] = Variable<String>(supportUrl.value);
    }
    if (testUrl.present) {
      map['test_url'] = Variable<String>(testUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileEntriesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('updateInterval: $updateInterval, ')
          ..write('upload: $upload, ')
          ..write('download: $download, ')
          ..write('total: $total, ')
          ..write('expire: $expire, ')
          ..write('webPageUrl: $webPageUrl, ')
          ..write('supportUrl: $supportUrl, ')
          ..write('testUrl: $testUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfileEntriesTable profileEntries = $ProfileEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [profileEntries];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$ProfileEntriesTableCreateCompanionBuilder =
    ProfileEntriesCompanion Function({
      required String id,
      required ProfileType type,
      required bool active,
      required String name,
      Value<String?> url,
      required DateTime lastUpdate,
      Value<Duration?> updateInterval,
      Value<int?> upload,
      Value<int?> download,
      Value<int?> total,
      Value<DateTime?> expire,
      Value<String?> webPageUrl,
      Value<String?> supportUrl,
      Value<String?> testUrl,
      Value<int> rowid,
    });
typedef $$ProfileEntriesTableUpdateCompanionBuilder =
    ProfileEntriesCompanion Function({
      Value<String> id,
      Value<ProfileType> type,
      Value<bool> active,
      Value<String> name,
      Value<String?> url,
      Value<DateTime> lastUpdate,
      Value<Duration?> updateInterval,
      Value<int?> upload,
      Value<int?> download,
      Value<int?> total,
      Value<DateTime?> expire,
      Value<String?> webPageUrl,
      Value<String?> supportUrl,
      Value<String?> testUrl,
      Value<int> rowid,
    });

class $$ProfileEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileEntriesTable> {
  $$ProfileEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ProfileType, ProfileType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Duration?, Duration, int> get updateInterval =>
      $composableBuilder(
        column: $table.updateInterval,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get upload => $composableBuilder(
    column: $table.upload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get download => $composableBuilder(
    column: $table.download,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expire => $composableBuilder(
    column: $table.expire,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get webPageUrl => $composableBuilder(
    column: $table.webPageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supportUrl => $composableBuilder(
    column: $table.supportUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testUrl => $composableBuilder(
    column: $table.testUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfileEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileEntriesTable> {
  $$ProfileEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updateInterval => $composableBuilder(
    column: $table.updateInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get upload => $composableBuilder(
    column: $table.upload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get download => $composableBuilder(
    column: $table.download,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expire => $composableBuilder(
    column: $table.expire,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get webPageUrl => $composableBuilder(
    column: $table.webPageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supportUrl => $composableBuilder(
    column: $table.supportUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testUrl => $composableBuilder(
    column: $table.testUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfileEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileEntriesTable> {
  $$ProfileEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProfileType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
    column: $table.lastUpdate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Duration?, int> get updateInterval =>
      $composableBuilder(
        column: $table.updateInterval,
        builder: (column) => column,
      );

  GeneratedColumn<int> get upload =>
      $composableBuilder(column: $table.upload, builder: (column) => column);

  GeneratedColumn<int> get download =>
      $composableBuilder(column: $table.download, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<DateTime> get expire =>
      $composableBuilder(column: $table.expire, builder: (column) => column);

  GeneratedColumn<String> get webPageUrl => $composableBuilder(
    column: $table.webPageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supportUrl => $composableBuilder(
    column: $table.supportUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get testUrl =>
      $composableBuilder(column: $table.testUrl, builder: (column) => column);
}

class $$ProfileEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfileEntriesTable,
          ProfileEntry,
          $$ProfileEntriesTableFilterComposer,
          $$ProfileEntriesTableOrderingComposer,
          $$ProfileEntriesTableAnnotationComposer,
          $$ProfileEntriesTableCreateCompanionBuilder,
          $$ProfileEntriesTableUpdateCompanionBuilder,
          (
            ProfileEntry,
            BaseReferences<_$AppDatabase, $ProfileEntriesTable, ProfileEntry>,
          ),
          ProfileEntry,
          PrefetchHooks Function()
        > {
  $$ProfileEntriesTableTableManager(
    _$AppDatabase db,
    $ProfileEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<ProfileType> type = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> lastUpdate = const Value.absent(),
                Value<Duration?> updateInterval = const Value.absent(),
                Value<int?> upload = const Value.absent(),
                Value<int?> download = const Value.absent(),
                Value<int?> total = const Value.absent(),
                Value<DateTime?> expire = const Value.absent(),
                Value<String?> webPageUrl = const Value.absent(),
                Value<String?> supportUrl = const Value.absent(),
                Value<String?> testUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileEntriesCompanion(
                id: id,
                type: type,
                active: active,
                name: name,
                url: url,
                lastUpdate: lastUpdate,
                updateInterval: updateInterval,
                upload: upload,
                download: download,
                total: total,
                expire: expire,
                webPageUrl: webPageUrl,
                supportUrl: supportUrl,
                testUrl: testUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required ProfileType type,
                required bool active,
                required String name,
                Value<String?> url = const Value.absent(),
                required DateTime lastUpdate,
                Value<Duration?> updateInterval = const Value.absent(),
                Value<int?> upload = const Value.absent(),
                Value<int?> download = const Value.absent(),
                Value<int?> total = const Value.absent(),
                Value<DateTime?> expire = const Value.absent(),
                Value<String?> webPageUrl = const Value.absent(),
                Value<String?> supportUrl = const Value.absent(),
                Value<String?> testUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfileEntriesCompanion.insert(
                id: id,
                type: type,
                active: active,
                name: name,
                url: url,
                lastUpdate: lastUpdate,
                updateInterval: updateInterval,
                upload: upload,
                download: download,
                total: total,
                expire: expire,
                webPageUrl: webPageUrl,
                supportUrl: supportUrl,
                testUrl: testUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfileEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfileEntriesTable,
      ProfileEntry,
      $$ProfileEntriesTableFilterComposer,
      $$ProfileEntriesTableOrderingComposer,
      $$ProfileEntriesTableAnnotationComposer,
      $$ProfileEntriesTableCreateCompanionBuilder,
      $$ProfileEntriesTableUpdateCompanionBuilder,
      (
        ProfileEntry,
        BaseReferences<_$AppDatabase, $ProfileEntriesTable, ProfileEntry>,
      ),
      ProfileEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfileEntriesTableTableManager get profileEntries =>
      $$ProfileEntriesTableTableManager(_db, _db.profileEntries);
}
