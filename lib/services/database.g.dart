// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NewsTableTable extends NewsTable
    with TableInfo<$NewsTableTable, NewsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_table';
  @override
  VerificationContext validateIntegrity(Insertable<NewsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(attachedDatabase, alias);
  }
}

class NewsTableData extends DataClass implements Insertable<NewsTableData> {
  final int id;
  final String title;
  final String content;
  const NewsTableData(
      {required this.id, required this.title, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    return map;
  }

  NewsTableCompanion toCompanion(bool nullToAbsent) {
    return NewsTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
    );
  }

  factory NewsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
    };
  }

  NewsTableData copyWith({int? id, String? title, String? content}) =>
      NewsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );
  NewsTableData copyWithCompanion(NewsTableCompanion data) {
    return NewsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content);
}

class NewsTableCompanion extends UpdateCompanion<NewsTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  const NewsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
  });
  NewsTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
  })  : title = Value(title),
        content = Value(content);
  static Insertable<NewsTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
    });
  }

  NewsTableCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? content}) {
    return NewsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $AuthorsTable extends Authors with TableInfo<$AuthorsTable, Author> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authors';
  @override
  VerificationContext validateIntegrity(Insertable<Author> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Author map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Author(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
    );
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(attachedDatabase, alias);
  }
}

class Author extends DataClass implements Insertable<Author> {
  final int id;
  final String name;
  final String? email;
  const Author({required this.id, required this.name, this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  AuthorsCompanion toCompanion(bool nullToAbsent) {
    return AuthorsCompanion(
      id: Value(id),
      name: Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory Author.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Author(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
    };
  }

  Author copyWith(
          {int? id,
          String? name,
          Value<String?> email = const Value.absent()}) =>
      Author(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email.present ? email.value : this.email,
      );
  Author copyWithCompanion(AuthorsCompanion data) {
    return Author(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Author &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> email;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
  });
  AuthorsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Author> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    });
  }

  AuthorsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? email}) {
    return AuthorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $SourcesTable extends Sources with TableInfo<$SourcesTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _homePageUrlMeta =
      const VerificationMeta('homePageUrl');
  @override
  late final GeneratedColumn<String> homePageUrl = GeneratedColumn<String>(
      'home_page_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rankingsOprMeta =
      const VerificationMeta('rankingsOpr');
  @override
  late final GeneratedColumn<int> rankingsOpr = GeneratedColumn<int>(
      'rankings_opr', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _locationCountryNameMeta =
      const VerificationMeta('locationCountryName');
  @override
  late final GeneratedColumn<String> locationCountryName =
      GeneratedColumn<String>('location_country_name', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationCountryCodeMeta =
      const VerificationMeta('locationCountryCode');
  @override
  late final GeneratedColumn<String> locationCountryCode =
      GeneratedColumn<String>('location_country_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _faviconMeta =
      const VerificationMeta('favicon');
  @override
  late final GeneratedColumn<String> favicon = GeneratedColumn<String>(
      'favicon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        domain,
        homePageUrl,
        type,
        rankingsOpr,
        locationCountryName,
        locationCountryCode,
        favicon
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  VerificationContext validateIntegrity(Insertable<Source> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    } else if (isInserting) {
      context.missing(_domainMeta);
    }
    if (data.containsKey('home_page_url')) {
      context.handle(
          _homePageUrlMeta,
          homePageUrl.isAcceptableOrUnknown(
              data['home_page_url']!, _homePageUrlMeta));
    } else if (isInserting) {
      context.missing(_homePageUrlMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('rankings_opr')) {
      context.handle(
          _rankingsOprMeta,
          rankingsOpr.isAcceptableOrUnknown(
              data['rankings_opr']!, _rankingsOprMeta));
    }
    if (data.containsKey('location_country_name')) {
      context.handle(
          _locationCountryNameMeta,
          locationCountryName.isAcceptableOrUnknown(
              data['location_country_name']!, _locationCountryNameMeta));
    }
    if (data.containsKey('location_country_code')) {
      context.handle(
          _locationCountryCodeMeta,
          locationCountryCode.isAcceptableOrUnknown(
              data['location_country_code']!, _locationCountryCodeMeta));
    }
    if (data.containsKey('favicon')) {
      context.handle(_faviconMeta,
          favicon.isAcceptableOrUnknown(data['favicon']!, _faviconMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain'])!,
      homePageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}home_page_url'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      rankingsOpr: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rankings_opr']),
      locationCountryName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}location_country_name']),
      locationCountryCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}location_country_code']),
      favicon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}favicon']),
    );
  }

  @override
  $SourcesTable createAlias(String alias) {
    return $SourcesTable(attachedDatabase, alias);
  }
}

class Source extends DataClass implements Insertable<Source> {
  final int id;
  final String domain;
  final String homePageUrl;
  final String type;
  final int? rankingsOpr;
  final String? locationCountryName;
  final String? locationCountryCode;
  final String? favicon;
  const Source(
      {required this.id,
      required this.domain,
      required this.homePageUrl,
      required this.type,
      this.rankingsOpr,
      this.locationCountryName,
      this.locationCountryCode,
      this.favicon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['domain'] = Variable<String>(domain);
    map['home_page_url'] = Variable<String>(homePageUrl);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || rankingsOpr != null) {
      map['rankings_opr'] = Variable<int>(rankingsOpr);
    }
    if (!nullToAbsent || locationCountryName != null) {
      map['location_country_name'] = Variable<String>(locationCountryName);
    }
    if (!nullToAbsent || locationCountryCode != null) {
      map['location_country_code'] = Variable<String>(locationCountryCode);
    }
    if (!nullToAbsent || favicon != null) {
      map['favicon'] = Variable<String>(favicon);
    }
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: Value(id),
      domain: Value(domain),
      homePageUrl: Value(homePageUrl),
      type: Value(type),
      rankingsOpr: rankingsOpr == null && nullToAbsent
          ? const Value.absent()
          : Value(rankingsOpr),
      locationCountryName: locationCountryName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationCountryName),
      locationCountryCode: locationCountryCode == null && nullToAbsent
          ? const Value.absent()
          : Value(locationCountryCode),
      favicon: favicon == null && nullToAbsent
          ? const Value.absent()
          : Value(favicon),
    );
  }

  factory Source.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<int>(json['id']),
      domain: serializer.fromJson<String>(json['domain']),
      homePageUrl: serializer.fromJson<String>(json['homePageUrl']),
      type: serializer.fromJson<String>(json['type']),
      rankingsOpr: serializer.fromJson<int?>(json['rankingsOpr']),
      locationCountryName:
          serializer.fromJson<String?>(json['locationCountryName']),
      locationCountryCode:
          serializer.fromJson<String?>(json['locationCountryCode']),
      favicon: serializer.fromJson<String?>(json['favicon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'domain': serializer.toJson<String>(domain),
      'homePageUrl': serializer.toJson<String>(homePageUrl),
      'type': serializer.toJson<String>(type),
      'rankingsOpr': serializer.toJson<int?>(rankingsOpr),
      'locationCountryName': serializer.toJson<String?>(locationCountryName),
      'locationCountryCode': serializer.toJson<String?>(locationCountryCode),
      'favicon': serializer.toJson<String?>(favicon),
    };
  }

  Source copyWith(
          {int? id,
          String? domain,
          String? homePageUrl,
          String? type,
          Value<int?> rankingsOpr = const Value.absent(),
          Value<String?> locationCountryName = const Value.absent(),
          Value<String?> locationCountryCode = const Value.absent(),
          Value<String?> favicon = const Value.absent()}) =>
      Source(
        id: id ?? this.id,
        domain: domain ?? this.domain,
        homePageUrl: homePageUrl ?? this.homePageUrl,
        type: type ?? this.type,
        rankingsOpr: rankingsOpr.present ? rankingsOpr.value : this.rankingsOpr,
        locationCountryName: locationCountryName.present
            ? locationCountryName.value
            : this.locationCountryName,
        locationCountryCode: locationCountryCode.present
            ? locationCountryCode.value
            : this.locationCountryCode,
        favicon: favicon.present ? favicon.value : this.favicon,
      );
  Source copyWithCompanion(SourcesCompanion data) {
    return Source(
      id: data.id.present ? data.id.value : this.id,
      domain: data.domain.present ? data.domain.value : this.domain,
      homePageUrl:
          data.homePageUrl.present ? data.homePageUrl.value : this.homePageUrl,
      type: data.type.present ? data.type.value : this.type,
      rankingsOpr:
          data.rankingsOpr.present ? data.rankingsOpr.value : this.rankingsOpr,
      locationCountryName: data.locationCountryName.present
          ? data.locationCountryName.value
          : this.locationCountryName,
      locationCountryCode: data.locationCountryCode.present
          ? data.locationCountryCode.value
          : this.locationCountryCode,
      favicon: data.favicon.present ? data.favicon.value : this.favicon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('id: $id, ')
          ..write('domain: $domain, ')
          ..write('homePageUrl: $homePageUrl, ')
          ..write('type: $type, ')
          ..write('rankingsOpr: $rankingsOpr, ')
          ..write('locationCountryName: $locationCountryName, ')
          ..write('locationCountryCode: $locationCountryCode, ')
          ..write('favicon: $favicon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, domain, homePageUrl, type, rankingsOpr,
      locationCountryName, locationCountryCode, favicon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.id == this.id &&
          other.domain == this.domain &&
          other.homePageUrl == this.homePageUrl &&
          other.type == this.type &&
          other.rankingsOpr == this.rankingsOpr &&
          other.locationCountryName == this.locationCountryName &&
          other.locationCountryCode == this.locationCountryCode &&
          other.favicon == this.favicon);
}

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<int> id;
  final Value<String> domain;
  final Value<String> homePageUrl;
  final Value<String> type;
  final Value<int?> rankingsOpr;
  final Value<String?> locationCountryName;
  final Value<String?> locationCountryCode;
  final Value<String?> favicon;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.domain = const Value.absent(),
    this.homePageUrl = const Value.absent(),
    this.type = const Value.absent(),
    this.rankingsOpr = const Value.absent(),
    this.locationCountryName = const Value.absent(),
    this.locationCountryCode = const Value.absent(),
    this.favicon = const Value.absent(),
  });
  SourcesCompanion.insert({
    this.id = const Value.absent(),
    required String domain,
    required String homePageUrl,
    required String type,
    this.rankingsOpr = const Value.absent(),
    this.locationCountryName = const Value.absent(),
    this.locationCountryCode = const Value.absent(),
    this.favicon = const Value.absent(),
  })  : domain = Value(domain),
        homePageUrl = Value(homePageUrl),
        type = Value(type);
  static Insertable<Source> custom({
    Expression<int>? id,
    Expression<String>? domain,
    Expression<String>? homePageUrl,
    Expression<String>? type,
    Expression<int>? rankingsOpr,
    Expression<String>? locationCountryName,
    Expression<String>? locationCountryCode,
    Expression<String>? favicon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (domain != null) 'domain': domain,
      if (homePageUrl != null) 'home_page_url': homePageUrl,
      if (type != null) 'type': type,
      if (rankingsOpr != null) 'rankings_opr': rankingsOpr,
      if (locationCountryName != null)
        'location_country_name': locationCountryName,
      if (locationCountryCode != null)
        'location_country_code': locationCountryCode,
      if (favicon != null) 'favicon': favicon,
    });
  }

  SourcesCompanion copyWith(
      {Value<int>? id,
      Value<String>? domain,
      Value<String>? homePageUrl,
      Value<String>? type,
      Value<int?>? rankingsOpr,
      Value<String?>? locationCountryName,
      Value<String?>? locationCountryCode,
      Value<String?>? favicon}) {
    return SourcesCompanion(
      id: id ?? this.id,
      domain: domain ?? this.domain,
      homePageUrl: homePageUrl ?? this.homePageUrl,
      type: type ?? this.type,
      rankingsOpr: rankingsOpr ?? this.rankingsOpr,
      locationCountryName: locationCountryName ?? this.locationCountryName,
      locationCountryCode: locationCountryCode ?? this.locationCountryCode,
      favicon: favicon ?? this.favicon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (homePageUrl.present) {
      map['home_page_url'] = Variable<String>(homePageUrl.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rankingsOpr.present) {
      map['rankings_opr'] = Variable<int>(rankingsOpr.value);
    }
    if (locationCountryName.present) {
      map['location_country_name'] =
          Variable<String>(locationCountryName.value);
    }
    if (locationCountryCode.present) {
      map['location_country_code'] =
          Variable<String>(locationCountryCode.value);
    }
    if (favicon.present) {
      map['favicon'] = Variable<String>(favicon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesCompanion(')
          ..write('id: $id, ')
          ..write('domain: $domain, ')
          ..write('homePageUrl: $homePageUrl, ')
          ..write('type: $type, ')
          ..write('rankingsOpr: $rankingsOpr, ')
          ..write('locationCountryName: $locationCountryName, ')
          ..write('locationCountryCode: $locationCountryCode, ')
          ..write('favicon: $favicon')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _taxonomyMeta =
      const VerificationMeta('taxonomy');
  @override
  late final GeneratedColumn<String> taxonomy = GeneratedColumn<String>(
      'taxonomy', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, score, taxonomy];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    if (data.containsKey('taxonomy')) {
      context.handle(_taxonomyMeta,
          taxonomy.isAcceptableOrUnknown(data['taxonomy']!, _taxonomyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score']),
      taxonomy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}taxonomy']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final String name;
  final double? score;
  final String? taxonomy;
  const Category(
      {required this.id, required this.name, this.score, this.taxonomy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<double>(score);
    }
    if (!nullToAbsent || taxonomy != null) {
      map['taxonomy'] = Variable<String>(taxonomy);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      taxonomy: taxonomy == null && nullToAbsent
          ? const Value.absent()
          : Value(taxonomy),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      score: serializer.fromJson<double?>(json['score']),
      taxonomy: serializer.fromJson<String?>(json['taxonomy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'score': serializer.toJson<double?>(score),
      'taxonomy': serializer.toJson<String?>(taxonomy),
    };
  }

  Category copyWith(
          {String? id,
          String? name,
          Value<double?> score = const Value.absent(),
          Value<String?> taxonomy = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        score: score.present ? score.value : this.score,
        taxonomy: taxonomy.present ? taxonomy.value : this.taxonomy,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      score: data.score.present ? data.score.value : this.score,
      taxonomy: data.taxonomy.present ? data.taxonomy.value : this.taxonomy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('score: $score, ')
          ..write('taxonomy: $taxonomy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, score, taxonomy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.score == this.score &&
          other.taxonomy == this.taxonomy);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> name;
  final Value<double?> score;
  final Value<String?> taxonomy;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.score = const Value.absent(),
    this.taxonomy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.score = const Value.absent(),
    this.taxonomy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? score,
    Expression<String>? taxonomy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (score != null) 'score': score,
      if (taxonomy != null) 'taxonomy': taxonomy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<double?>? score,
      Value<String?>? taxonomy,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      score: score ?? this.score,
      taxonomy: taxonomy ?? this.taxonomy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (taxonomy.present) {
      map['taxonomy'] = Variable<String>(taxonomy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('score: $score, ')
          ..write('taxonomy: $taxonomy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IndustriesTable extends Industries
    with TableInfo<$IndustriesTable, Industry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndustriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'industries';
  @override
  VerificationContext validateIntegrity(Insertable<Industry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Industry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Industry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $IndustriesTable createAlias(String alias) {
    return $IndustriesTable(attachedDatabase, alias);
  }
}

class Industry extends DataClass implements Insertable<Industry> {
  final int id;
  final String name;
  const Industry({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  IndustriesCompanion toCompanion(bool nullToAbsent) {
    return IndustriesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Industry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Industry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Industry copyWith({int? id, String? name}) => Industry(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Industry copyWithCompanion(IndustriesCompanion data) {
    return Industry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Industry(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Industry && other.id == this.id && other.name == this.name);
}

class IndustriesCompanion extends UpdateCompanion<Industry> {
  final Value<int> id;
  final Value<String> name;
  const IndustriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  IndustriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Industry> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  IndustriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return IndustriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndustriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EntitiesTable extends Entities with TableInfo<$EntitiesTable, Entity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedColumn<String> types = GeneratedColumn<String>(
      'types', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _wikipediaUrlMeta =
      const VerificationMeta('wikipediaUrl');
  @override
  late final GeneratedColumn<String> wikipediaUrl = GeneratedColumn<String>(
      'wikipedia_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _wikidataUrlMeta =
      const VerificationMeta('wikidataUrl');
  @override
  late final GeneratedColumn<String> wikidataUrl = GeneratedColumn<String>(
      'wikidata_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, types, language, frequency, wikipediaUrl, wikidataUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entities';
  @override
  VerificationContext validateIntegrity(Insertable<Entity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('types')) {
      context.handle(
          _typesMeta, types.isAcceptableOrUnknown(data['types']!, _typesMeta));
    } else if (isInserting) {
      context.missing(_typesMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    }
    if (data.containsKey('wikipedia_url')) {
      context.handle(
          _wikipediaUrlMeta,
          wikipediaUrl.isAcceptableOrUnknown(
              data['wikipedia_url']!, _wikipediaUrlMeta));
    }
    if (data.containsKey('wikidata_url')) {
      context.handle(
          _wikidataUrlMeta,
          wikidataUrl.isAcceptableOrUnknown(
              data['wikidata_url']!, _wikidataUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Entity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      types: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}types'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency']),
      wikipediaUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wikipedia_url']),
      wikidataUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wikidata_url']),
    );
  }

  @override
  $EntitiesTable createAlias(String alias) {
    return $EntitiesTable(attachedDatabase, alias);
  }
}

class Entity extends DataClass implements Insertable<Entity> {
  final int id;
  final String name;
  final String types;
  final String? language;
  final int? frequency;
  final String? wikipediaUrl;
  final String? wikidataUrl;
  const Entity(
      {required this.id,
      required this.name,
      required this.types,
      this.language,
      this.frequency,
      this.wikipediaUrl,
      this.wikidataUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['types'] = Variable<String>(types);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<int>(frequency);
    }
    if (!nullToAbsent || wikipediaUrl != null) {
      map['wikipedia_url'] = Variable<String>(wikipediaUrl);
    }
    if (!nullToAbsent || wikidataUrl != null) {
      map['wikidata_url'] = Variable<String>(wikidataUrl);
    }
    return map;
  }

  EntitiesCompanion toCompanion(bool nullToAbsent) {
    return EntitiesCompanion(
      id: Value(id),
      name: Value(name),
      types: Value(types),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
      wikipediaUrl: wikipediaUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(wikipediaUrl),
      wikidataUrl: wikidataUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(wikidataUrl),
    );
  }

  factory Entity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Entity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      types: serializer.fromJson<String>(json['types']),
      language: serializer.fromJson<String?>(json['language']),
      frequency: serializer.fromJson<int?>(json['frequency']),
      wikipediaUrl: serializer.fromJson<String?>(json['wikipediaUrl']),
      wikidataUrl: serializer.fromJson<String?>(json['wikidataUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'types': serializer.toJson<String>(types),
      'language': serializer.toJson<String?>(language),
      'frequency': serializer.toJson<int?>(frequency),
      'wikipediaUrl': serializer.toJson<String?>(wikipediaUrl),
      'wikidataUrl': serializer.toJson<String?>(wikidataUrl),
    };
  }

  Entity copyWith(
          {int? id,
          String? name,
          String? types,
          Value<String?> language = const Value.absent(),
          Value<int?> frequency = const Value.absent(),
          Value<String?> wikipediaUrl = const Value.absent(),
          Value<String?> wikidataUrl = const Value.absent()}) =>
      Entity(
        id: id ?? this.id,
        name: name ?? this.name,
        types: types ?? this.types,
        language: language.present ? language.value : this.language,
        frequency: frequency.present ? frequency.value : this.frequency,
        wikipediaUrl:
            wikipediaUrl.present ? wikipediaUrl.value : this.wikipediaUrl,
        wikidataUrl: wikidataUrl.present ? wikidataUrl.value : this.wikidataUrl,
      );
  Entity copyWithCompanion(EntitiesCompanion data) {
    return Entity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      types: data.types.present ? data.types.value : this.types,
      language: data.language.present ? data.language.value : this.language,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      wikipediaUrl: data.wikipediaUrl.present
          ? data.wikipediaUrl.value
          : this.wikipediaUrl,
      wikidataUrl:
          data.wikidataUrl.present ? data.wikidataUrl.value : this.wikidataUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Entity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('types: $types, ')
          ..write('language: $language, ')
          ..write('frequency: $frequency, ')
          ..write('wikipediaUrl: $wikipediaUrl, ')
          ..write('wikidataUrl: $wikidataUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, types, language, frequency, wikipediaUrl, wikidataUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entity &&
          other.id == this.id &&
          other.name == this.name &&
          other.types == this.types &&
          other.language == this.language &&
          other.frequency == this.frequency &&
          other.wikipediaUrl == this.wikipediaUrl &&
          other.wikidataUrl == this.wikidataUrl);
}

class EntitiesCompanion extends UpdateCompanion<Entity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> types;
  final Value<String?> language;
  final Value<int?> frequency;
  final Value<String?> wikipediaUrl;
  final Value<String?> wikidataUrl;
  const EntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.types = const Value.absent(),
    this.language = const Value.absent(),
    this.frequency = const Value.absent(),
    this.wikipediaUrl = const Value.absent(),
    this.wikidataUrl = const Value.absent(),
  });
  EntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String types,
    this.language = const Value.absent(),
    this.frequency = const Value.absent(),
    this.wikipediaUrl = const Value.absent(),
    this.wikidataUrl = const Value.absent(),
  })  : name = Value(name),
        types = Value(types);
  static Insertable<Entity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? types,
    Expression<String>? language,
    Expression<int>? frequency,
    Expression<String>? wikipediaUrl,
    Expression<String>? wikidataUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (types != null) 'types': types,
      if (language != null) 'language': language,
      if (frequency != null) 'frequency': frequency,
      if (wikipediaUrl != null) 'wikipedia_url': wikipediaUrl,
      if (wikidataUrl != null) 'wikidata_url': wikidataUrl,
    });
  }

  EntitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? types,
      Value<String?>? language,
      Value<int?>? frequency,
      Value<String?>? wikipediaUrl,
      Value<String?>? wikidataUrl}) {
    return EntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      types: types ?? this.types,
      language: language ?? this.language,
      frequency: frequency ?? this.frequency,
      wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
      wikidataUrl: wikidataUrl ?? this.wikidataUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (types.present) {
      map['types'] = Variable<String>(types.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (wikipediaUrl.present) {
      map['wikipedia_url'] = Variable<String>(wikipediaUrl.value);
    }
    if (wikidataUrl.present) {
      map['wikidata_url'] = Variable<String>(wikidataUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('types: $types, ')
          ..write('language: $language, ')
          ..write('frequency: $frequency, ')
          ..write('wikipediaUrl: $wikipediaUrl, ')
          ..write('wikidataUrl: $wikidataUrl')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _hrefMeta = const VerificationMeta('href');
  @override
  late final GeneratedColumn<String> href = GeneratedColumn<String>(
      'href', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
      'published_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
      'author_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES authors (id)'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
      'source_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sources (id)'));
  static const VerificationMeta _sentimentOverallScoreMeta =
      const VerificationMeta('sentimentOverallScore');
  @override
  late final GeneratedColumn<double> sentimentOverallScore =
      GeneratedColumn<double>('sentiment_overall_score', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sentimentOverallPolarityMeta =
      const VerificationMeta('sentimentOverallPolarity');
  @override
  late final GeneratedColumn<String> sentimentOverallPolarity =
      GeneratedColumn<String>('sentiment_overall_polarity', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDuplicateMeta =
      const VerificationMeta('isDuplicate');
  @override
  late final GeneratedColumn<bool> isDuplicate = GeneratedColumn<bool>(
      'is_duplicate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_duplicate" IN (0, 1))'));
  static const VerificationMeta _isPaywallMeta =
      const VerificationMeta('isPaywall');
  @override
  late final GeneratedColumn<bool> isPaywall = GeneratedColumn<bool>(
      'is_paywall', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paywall" IN (0, 1))'));
  static const VerificationMeta _sentencesCountMeta =
      const VerificationMeta('sentencesCount');
  @override
  late final GeneratedColumn<int> sentencesCount = GeneratedColumn<int>(
      'sentences_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _paragraphsCountMeta =
      const VerificationMeta('paragraphsCount');
  @override
  late final GeneratedColumn<int> paragraphsCount = GeneratedColumn<int>(
      'paragraphs_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _wordsCountMeta =
      const VerificationMeta('wordsCount');
  @override
  late final GeneratedColumn<int> wordsCount = GeneratedColumn<int>(
      'words_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _charactersCountMeta =
      const VerificationMeta('charactersCount');
  @override
  late final GeneratedColumn<int> charactersCount = GeneratedColumn<int>(
      'characters_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        href,
        publishedAt,
        title,
        description,
        body,
        language,
        image,
        authorId,
        sourceId,
        sentimentOverallScore,
        sentimentOverallPolarity,
        isDuplicate,
        isPaywall,
        sentencesCount,
        paragraphsCount,
        wordsCount,
        charactersCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('href')) {
      context.handle(
          _hrefMeta, href.isAcceptableOrUnknown(data['href']!, _hrefMeta));
    } else if (isInserting) {
      context.missing(_hrefMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    }
    if (data.containsKey('sentiment_overall_score')) {
      context.handle(
          _sentimentOverallScoreMeta,
          sentimentOverallScore.isAcceptableOrUnknown(
              data['sentiment_overall_score']!, _sentimentOverallScoreMeta));
    }
    if (data.containsKey('sentiment_overall_polarity')) {
      context.handle(
          _sentimentOverallPolarityMeta,
          sentimentOverallPolarity.isAcceptableOrUnknown(
              data['sentiment_overall_polarity']!,
              _sentimentOverallPolarityMeta));
    }
    if (data.containsKey('is_duplicate')) {
      context.handle(
          _isDuplicateMeta,
          isDuplicate.isAcceptableOrUnknown(
              data['is_duplicate']!, _isDuplicateMeta));
    } else if (isInserting) {
      context.missing(_isDuplicateMeta);
    }
    if (data.containsKey('is_paywall')) {
      context.handle(_isPaywallMeta,
          isPaywall.isAcceptableOrUnknown(data['is_paywall']!, _isPaywallMeta));
    } else if (isInserting) {
      context.missing(_isPaywallMeta);
    }
    if (data.containsKey('sentences_count')) {
      context.handle(
          _sentencesCountMeta,
          sentencesCount.isAcceptableOrUnknown(
              data['sentences_count']!, _sentencesCountMeta));
    }
    if (data.containsKey('paragraphs_count')) {
      context.handle(
          _paragraphsCountMeta,
          paragraphsCount.isAcceptableOrUnknown(
              data['paragraphs_count']!, _paragraphsCountMeta));
    }
    if (data.containsKey('words_count')) {
      context.handle(
          _wordsCountMeta,
          wordsCount.isAcceptableOrUnknown(
              data['words_count']!, _wordsCountMeta));
    }
    if (data.containsKey('characters_count')) {
      context.handle(
          _charactersCountMeta,
          charactersCount.isAcceptableOrUnknown(
              data['characters_count']!, _charactersCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Article(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      href: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}href'])!,
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_at'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_id']),
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source_id']),
      sentimentOverallScore: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}sentiment_overall_score']),
      sentimentOverallPolarity: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sentiment_overall_polarity']),
      isDuplicate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_duplicate'])!,
      isPaywall: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paywall'])!,
      sentencesCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sentences_count']),
      paragraphsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paragraphs_count']),
      wordsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}words_count']),
      charactersCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}characters_count']),
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final int id;
  final String href;
  final DateTime publishedAt;
  final String title;
  final String? description;
  final String body;
  final String language;
  final String? image;
  final int? authorId;
  final int? sourceId;
  final double? sentimentOverallScore;
  final String? sentimentOverallPolarity;
  final bool isDuplicate;
  final bool isPaywall;
  final int? sentencesCount;
  final int? paragraphsCount;
  final int? wordsCount;
  final int? charactersCount;
  const Article(
      {required this.id,
      required this.href,
      required this.publishedAt,
      required this.title,
      this.description,
      required this.body,
      required this.language,
      this.image,
      this.authorId,
      this.sourceId,
      this.sentimentOverallScore,
      this.sentimentOverallPolarity,
      required this.isDuplicate,
      required this.isPaywall,
      this.sentencesCount,
      this.paragraphsCount,
      this.wordsCount,
      this.charactersCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['href'] = Variable<String>(href);
    map['published_at'] = Variable<DateTime>(publishedAt);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['body'] = Variable<String>(body);
    map['language'] = Variable<String>(language);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || authorId != null) {
      map['author_id'] = Variable<int>(authorId);
    }
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<int>(sourceId);
    }
    if (!nullToAbsent || sentimentOverallScore != null) {
      map['sentiment_overall_score'] = Variable<double>(sentimentOverallScore);
    }
    if (!nullToAbsent || sentimentOverallPolarity != null) {
      map['sentiment_overall_polarity'] =
          Variable<String>(sentimentOverallPolarity);
    }
    map['is_duplicate'] = Variable<bool>(isDuplicate);
    map['is_paywall'] = Variable<bool>(isPaywall);
    if (!nullToAbsent || sentencesCount != null) {
      map['sentences_count'] = Variable<int>(sentencesCount);
    }
    if (!nullToAbsent || paragraphsCount != null) {
      map['paragraphs_count'] = Variable<int>(paragraphsCount);
    }
    if (!nullToAbsent || wordsCount != null) {
      map['words_count'] = Variable<int>(wordsCount);
    }
    if (!nullToAbsent || charactersCount != null) {
      map['characters_count'] = Variable<int>(charactersCount);
    }
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      href: Value(href),
      publishedAt: Value(publishedAt),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      body: Value(body),
      language: Value(language),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      authorId: authorId == null && nullToAbsent
          ? const Value.absent()
          : Value(authorId),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      sentimentOverallScore: sentimentOverallScore == null && nullToAbsent
          ? const Value.absent()
          : Value(sentimentOverallScore),
      sentimentOverallPolarity: sentimentOverallPolarity == null && nullToAbsent
          ? const Value.absent()
          : Value(sentimentOverallPolarity),
      isDuplicate: Value(isDuplicate),
      isPaywall: Value(isPaywall),
      sentencesCount: sentencesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(sentencesCount),
      paragraphsCount: paragraphsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(paragraphsCount),
      wordsCount: wordsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(wordsCount),
      charactersCount: charactersCount == null && nullToAbsent
          ? const Value.absent()
          : Value(charactersCount),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<int>(json['id']),
      href: serializer.fromJson<String>(json['href']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      body: serializer.fromJson<String>(json['body']),
      language: serializer.fromJson<String>(json['language']),
      image: serializer.fromJson<String?>(json['image']),
      authorId: serializer.fromJson<int?>(json['authorId']),
      sourceId: serializer.fromJson<int?>(json['sourceId']),
      sentimentOverallScore:
          serializer.fromJson<double?>(json['sentimentOverallScore']),
      sentimentOverallPolarity:
          serializer.fromJson<String?>(json['sentimentOverallPolarity']),
      isDuplicate: serializer.fromJson<bool>(json['isDuplicate']),
      isPaywall: serializer.fromJson<bool>(json['isPaywall']),
      sentencesCount: serializer.fromJson<int?>(json['sentencesCount']),
      paragraphsCount: serializer.fromJson<int?>(json['paragraphsCount']),
      wordsCount: serializer.fromJson<int?>(json['wordsCount']),
      charactersCount: serializer.fromJson<int?>(json['charactersCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'href': serializer.toJson<String>(href),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'body': serializer.toJson<String>(body),
      'language': serializer.toJson<String>(language),
      'image': serializer.toJson<String?>(image),
      'authorId': serializer.toJson<int?>(authorId),
      'sourceId': serializer.toJson<int?>(sourceId),
      'sentimentOverallScore':
          serializer.toJson<double?>(sentimentOverallScore),
      'sentimentOverallPolarity':
          serializer.toJson<String?>(sentimentOverallPolarity),
      'isDuplicate': serializer.toJson<bool>(isDuplicate),
      'isPaywall': serializer.toJson<bool>(isPaywall),
      'sentencesCount': serializer.toJson<int?>(sentencesCount),
      'paragraphsCount': serializer.toJson<int?>(paragraphsCount),
      'wordsCount': serializer.toJson<int?>(wordsCount),
      'charactersCount': serializer.toJson<int?>(charactersCount),
    };
  }

  Article copyWith(
          {int? id,
          String? href,
          DateTime? publishedAt,
          String? title,
          Value<String?> description = const Value.absent(),
          String? body,
          String? language,
          Value<String?> image = const Value.absent(),
          Value<int?> authorId = const Value.absent(),
          Value<int?> sourceId = const Value.absent(),
          Value<double?> sentimentOverallScore = const Value.absent(),
          Value<String?> sentimentOverallPolarity = const Value.absent(),
          bool? isDuplicate,
          bool? isPaywall,
          Value<int?> sentencesCount = const Value.absent(),
          Value<int?> paragraphsCount = const Value.absent(),
          Value<int?> wordsCount = const Value.absent(),
          Value<int?> charactersCount = const Value.absent()}) =>
      Article(
        id: id ?? this.id,
        href: href ?? this.href,
        publishedAt: publishedAt ?? this.publishedAt,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        body: body ?? this.body,
        language: language ?? this.language,
        image: image.present ? image.value : this.image,
        authorId: authorId.present ? authorId.value : this.authorId,
        sourceId: sourceId.present ? sourceId.value : this.sourceId,
        sentimentOverallScore: sentimentOverallScore.present
            ? sentimentOverallScore.value
            : this.sentimentOverallScore,
        sentimentOverallPolarity: sentimentOverallPolarity.present
            ? sentimentOverallPolarity.value
            : this.sentimentOverallPolarity,
        isDuplicate: isDuplicate ?? this.isDuplicate,
        isPaywall: isPaywall ?? this.isPaywall,
        sentencesCount:
            sentencesCount.present ? sentencesCount.value : this.sentencesCount,
        paragraphsCount: paragraphsCount.present
            ? paragraphsCount.value
            : this.paragraphsCount,
        wordsCount: wordsCount.present ? wordsCount.value : this.wordsCount,
        charactersCount: charactersCount.present
            ? charactersCount.value
            : this.charactersCount,
      );
  Article copyWithCompanion(ArticlesCompanion data) {
    return Article(
      id: data.id.present ? data.id.value : this.id,
      href: data.href.present ? data.href.value : this.href,
      publishedAt:
          data.publishedAt.present ? data.publishedAt.value : this.publishedAt,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      body: data.body.present ? data.body.value : this.body,
      language: data.language.present ? data.language.value : this.language,
      image: data.image.present ? data.image.value : this.image,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sentimentOverallScore: data.sentimentOverallScore.present
          ? data.sentimentOverallScore.value
          : this.sentimentOverallScore,
      sentimentOverallPolarity: data.sentimentOverallPolarity.present
          ? data.sentimentOverallPolarity.value
          : this.sentimentOverallPolarity,
      isDuplicate:
          data.isDuplicate.present ? data.isDuplicate.value : this.isDuplicate,
      isPaywall: data.isPaywall.present ? data.isPaywall.value : this.isPaywall,
      sentencesCount: data.sentencesCount.present
          ? data.sentencesCount.value
          : this.sentencesCount,
      paragraphsCount: data.paragraphsCount.present
          ? data.paragraphsCount.value
          : this.paragraphsCount,
      wordsCount:
          data.wordsCount.present ? data.wordsCount.value : this.wordsCount,
      charactersCount: data.charactersCount.present
          ? data.charactersCount.value
          : this.charactersCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('href: $href, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('body: $body, ')
          ..write('language: $language, ')
          ..write('image: $image, ')
          ..write('authorId: $authorId, ')
          ..write('sourceId: $sourceId, ')
          ..write('sentimentOverallScore: $sentimentOverallScore, ')
          ..write('sentimentOverallPolarity: $sentimentOverallPolarity, ')
          ..write('isDuplicate: $isDuplicate, ')
          ..write('isPaywall: $isPaywall, ')
          ..write('sentencesCount: $sentencesCount, ')
          ..write('paragraphsCount: $paragraphsCount, ')
          ..write('wordsCount: $wordsCount, ')
          ..write('charactersCount: $charactersCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      href,
      publishedAt,
      title,
      description,
      body,
      language,
      image,
      authorId,
      sourceId,
      sentimentOverallScore,
      sentimentOverallPolarity,
      isDuplicate,
      isPaywall,
      sentencesCount,
      paragraphsCount,
      wordsCount,
      charactersCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.href == this.href &&
          other.publishedAt == this.publishedAt &&
          other.title == this.title &&
          other.description == this.description &&
          other.body == this.body &&
          other.language == this.language &&
          other.image == this.image &&
          other.authorId == this.authorId &&
          other.sourceId == this.sourceId &&
          other.sentimentOverallScore == this.sentimentOverallScore &&
          other.sentimentOverallPolarity == this.sentimentOverallPolarity &&
          other.isDuplicate == this.isDuplicate &&
          other.isPaywall == this.isPaywall &&
          other.sentencesCount == this.sentencesCount &&
          other.paragraphsCount == this.paragraphsCount &&
          other.wordsCount == this.wordsCount &&
          other.charactersCount == this.charactersCount);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> id;
  final Value<String> href;
  final Value<DateTime> publishedAt;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> body;
  final Value<String> language;
  final Value<String?> image;
  final Value<int?> authorId;
  final Value<int?> sourceId;
  final Value<double?> sentimentOverallScore;
  final Value<String?> sentimentOverallPolarity;
  final Value<bool> isDuplicate;
  final Value<bool> isPaywall;
  final Value<int?> sentencesCount;
  final Value<int?> paragraphsCount;
  final Value<int?> wordsCount;
  final Value<int?> charactersCount;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.href = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.body = const Value.absent(),
    this.language = const Value.absent(),
    this.image = const Value.absent(),
    this.authorId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sentimentOverallScore = const Value.absent(),
    this.sentimentOverallPolarity = const Value.absent(),
    this.isDuplicate = const Value.absent(),
    this.isPaywall = const Value.absent(),
    this.sentencesCount = const Value.absent(),
    this.paragraphsCount = const Value.absent(),
    this.wordsCount = const Value.absent(),
    this.charactersCount = const Value.absent(),
  });
  ArticlesCompanion.insert({
    this.id = const Value.absent(),
    required String href,
    required DateTime publishedAt,
    required String title,
    this.description = const Value.absent(),
    required String body,
    required String language,
    this.image = const Value.absent(),
    this.authorId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sentimentOverallScore = const Value.absent(),
    this.sentimentOverallPolarity = const Value.absent(),
    required bool isDuplicate,
    required bool isPaywall,
    this.sentencesCount = const Value.absent(),
    this.paragraphsCount = const Value.absent(),
    this.wordsCount = const Value.absent(),
    this.charactersCount = const Value.absent(),
  })  : href = Value(href),
        publishedAt = Value(publishedAt),
        title = Value(title),
        body = Value(body),
        language = Value(language),
        isDuplicate = Value(isDuplicate),
        isPaywall = Value(isPaywall);
  static Insertable<Article> custom({
    Expression<int>? id,
    Expression<String>? href,
    Expression<DateTime>? publishedAt,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? body,
    Expression<String>? language,
    Expression<String>? image,
    Expression<int>? authorId,
    Expression<int>? sourceId,
    Expression<double>? sentimentOverallScore,
    Expression<String>? sentimentOverallPolarity,
    Expression<bool>? isDuplicate,
    Expression<bool>? isPaywall,
    Expression<int>? sentencesCount,
    Expression<int>? paragraphsCount,
    Expression<int>? wordsCount,
    Expression<int>? charactersCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (href != null) 'href': href,
      if (publishedAt != null) 'published_at': publishedAt,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (body != null) 'body': body,
      if (language != null) 'language': language,
      if (image != null) 'image': image,
      if (authorId != null) 'author_id': authorId,
      if (sourceId != null) 'source_id': sourceId,
      if (sentimentOverallScore != null)
        'sentiment_overall_score': sentimentOverallScore,
      if (sentimentOverallPolarity != null)
        'sentiment_overall_polarity': sentimentOverallPolarity,
      if (isDuplicate != null) 'is_duplicate': isDuplicate,
      if (isPaywall != null) 'is_paywall': isPaywall,
      if (sentencesCount != null) 'sentences_count': sentencesCount,
      if (paragraphsCount != null) 'paragraphs_count': paragraphsCount,
      if (wordsCount != null) 'words_count': wordsCount,
      if (charactersCount != null) 'characters_count': charactersCount,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? id,
      Value<String>? href,
      Value<DateTime>? publishedAt,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? body,
      Value<String>? language,
      Value<String?>? image,
      Value<int?>? authorId,
      Value<int?>? sourceId,
      Value<double?>? sentimentOverallScore,
      Value<String?>? sentimentOverallPolarity,
      Value<bool>? isDuplicate,
      Value<bool>? isPaywall,
      Value<int?>? sentencesCount,
      Value<int?>? paragraphsCount,
      Value<int?>? wordsCount,
      Value<int?>? charactersCount}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      href: href ?? this.href,
      publishedAt: publishedAt ?? this.publishedAt,
      title: title ?? this.title,
      description: description ?? this.description,
      body: body ?? this.body,
      language: language ?? this.language,
      image: image ?? this.image,
      authorId: authorId ?? this.authorId,
      sourceId: sourceId ?? this.sourceId,
      sentimentOverallScore:
          sentimentOverallScore ?? this.sentimentOverallScore,
      sentimentOverallPolarity:
          sentimentOverallPolarity ?? this.sentimentOverallPolarity,
      isDuplicate: isDuplicate ?? this.isDuplicate,
      isPaywall: isPaywall ?? this.isPaywall,
      sentencesCount: sentencesCount ?? this.sentencesCount,
      paragraphsCount: paragraphsCount ?? this.paragraphsCount,
      wordsCount: wordsCount ?? this.wordsCount,
      charactersCount: charactersCount ?? this.charactersCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (href.present) {
      map['href'] = Variable<String>(href.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (sentimentOverallScore.present) {
      map['sentiment_overall_score'] =
          Variable<double>(sentimentOverallScore.value);
    }
    if (sentimentOverallPolarity.present) {
      map['sentiment_overall_polarity'] =
          Variable<String>(sentimentOverallPolarity.value);
    }
    if (isDuplicate.present) {
      map['is_duplicate'] = Variable<bool>(isDuplicate.value);
    }
    if (isPaywall.present) {
      map['is_paywall'] = Variable<bool>(isPaywall.value);
    }
    if (sentencesCount.present) {
      map['sentences_count'] = Variable<int>(sentencesCount.value);
    }
    if (paragraphsCount.present) {
      map['paragraphs_count'] = Variable<int>(paragraphsCount.value);
    }
    if (wordsCount.present) {
      map['words_count'] = Variable<int>(wordsCount.value);
    }
    if (charactersCount.present) {
      map['characters_count'] = Variable<int>(charactersCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('href: $href, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('body: $body, ')
          ..write('language: $language, ')
          ..write('image: $image, ')
          ..write('authorId: $authorId, ')
          ..write('sourceId: $sourceId, ')
          ..write('sentimentOverallScore: $sentimentOverallScore, ')
          ..write('sentimentOverallPolarity: $sentimentOverallPolarity, ')
          ..write('isDuplicate: $isDuplicate, ')
          ..write('isPaywall: $isPaywall, ')
          ..write('sentencesCount: $sentencesCount, ')
          ..write('paragraphsCount: $paragraphsCount, ')
          ..write('wordsCount: $wordsCount, ')
          ..write('charactersCount: $charactersCount')
          ..write(')'))
        .toString();
  }
}

class $MediasTable extends Medias with TableInfo<$MediasTable, Media> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<int> articleId = GeneratedColumn<int>(
      'article_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES articles (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, url, type, format, articleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medias';
  @override
  VerificationContext validateIntegrity(Insertable<Media> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    }
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Media map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Media(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format']),
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}article_id'])!,
    );
  }

  @override
  $MediasTable createAlias(String alias) {
    return $MediasTable(attachedDatabase, alias);
  }
}

class Media extends DataClass implements Insertable<Media> {
  final int id;
  final String url;
  final String type;
  final String? format;
  final int articleId;
  const Media(
      {required this.id,
      required this.url,
      required this.type,
      this.format,
      required this.articleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || format != null) {
      map['format'] = Variable<String>(format);
    }
    map['article_id'] = Variable<int>(articleId);
    return map;
  }

  MediasCompanion toCompanion(bool nullToAbsent) {
    return MediasCompanion(
      id: Value(id),
      url: Value(url),
      type: Value(type),
      format:
          format == null && nullToAbsent ? const Value.absent() : Value(format),
      articleId: Value(articleId),
    );
  }

  factory Media.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Media(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      type: serializer.fromJson<String>(json['type']),
      format: serializer.fromJson<String?>(json['format']),
      articleId: serializer.fromJson<int>(json['articleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'type': serializer.toJson<String>(type),
      'format': serializer.toJson<String?>(format),
      'articleId': serializer.toJson<int>(articleId),
    };
  }

  Media copyWith(
          {int? id,
          String? url,
          String? type,
          Value<String?> format = const Value.absent(),
          int? articleId}) =>
      Media(
        id: id ?? this.id,
        url: url ?? this.url,
        type: type ?? this.type,
        format: format.present ? format.value : this.format,
        articleId: articleId ?? this.articleId,
      );
  Media copyWithCompanion(MediasCompanion data) {
    return Media(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      type: data.type.present ? data.type.value : this.type,
      format: data.format.present ? data.format.value : this.format,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Media(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('format: $format, ')
          ..write('articleId: $articleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, type, format, articleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Media &&
          other.id == this.id &&
          other.url == this.url &&
          other.type == this.type &&
          other.format == this.format &&
          other.articleId == this.articleId);
}

class MediasCompanion extends UpdateCompanion<Media> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> type;
  final Value<String?> format;
  final Value<int> articleId;
  const MediasCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.type = const Value.absent(),
    this.format = const Value.absent(),
    this.articleId = const Value.absent(),
  });
  MediasCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String type,
    this.format = const Value.absent(),
    required int articleId,
  })  : url = Value(url),
        type = Value(type),
        articleId = Value(articleId);
  static Insertable<Media> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? type,
    Expression<String>? format,
    Expression<int>? articleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (type != null) 'type': type,
      if (format != null) 'format': format,
      if (articleId != null) 'article_id': articleId,
    });
  }

  MediasCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? type,
      Value<String?>? format,
      Value<int>? articleId}) {
    return MediasCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      type: type ?? this.type,
      format: format ?? this.format,
      articleId: articleId ?? this.articleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<int>(articleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediasCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('format: $format, ')
          ..write('articleId: $articleId')
          ..write(')'))
        .toString();
  }
}

class $ArticleCategoriesTable extends ArticleCategories
    with TableInfo<$ArticleCategoriesTable, ArticleCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<int> articleId = GeneratedColumn<int>(
      'article_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES articles (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  @override
  List<GeneratedColumn> get $columns => [articleId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'article_categories';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {articleId, categoryId};
  @override
  ArticleCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleCategory(
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}article_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $ArticleCategoriesTable createAlias(String alias) {
    return $ArticleCategoriesTable(attachedDatabase, alias);
  }
}

class ArticleCategory extends DataClass implements Insertable<ArticleCategory> {
  final int articleId;
  final String categoryId;
  const ArticleCategory({required this.articleId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['article_id'] = Variable<int>(articleId);
    map['category_id'] = Variable<String>(categoryId);
    return map;
  }

  ArticleCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ArticleCategoriesCompanion(
      articleId: Value(articleId),
      categoryId: Value(categoryId),
    );
  }

  factory ArticleCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleCategory(
      articleId: serializer.fromJson<int>(json['articleId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'articleId': serializer.toJson<int>(articleId),
      'categoryId': serializer.toJson<String>(categoryId),
    };
  }

  ArticleCategory copyWith({int? articleId, String? categoryId}) =>
      ArticleCategory(
        articleId: articleId ?? this.articleId,
        categoryId: categoryId ?? this.categoryId,
      );
  ArticleCategory copyWithCompanion(ArticleCategoriesCompanion data) {
    return ArticleCategory(
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticleCategory(')
          ..write('articleId: $articleId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(articleId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleCategory &&
          other.articleId == this.articleId &&
          other.categoryId == this.categoryId);
}

class ArticleCategoriesCompanion extends UpdateCompanion<ArticleCategory> {
  final Value<int> articleId;
  final Value<String> categoryId;
  final Value<int> rowid;
  const ArticleCategoriesCompanion({
    this.articleId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticleCategoriesCompanion.insert({
    required int articleId,
    required String categoryId,
    this.rowid = const Value.absent(),
  })  : articleId = Value(articleId),
        categoryId = Value(categoryId);
  static Insertable<ArticleCategory> custom({
    Expression<int>? articleId,
    Expression<String>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (articleId != null) 'article_id': articleId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticleCategoriesCompanion copyWith(
      {Value<int>? articleId, Value<String>? categoryId, Value<int>? rowid}) {
    return ArticleCategoriesCompanion(
      articleId: articleId ?? this.articleId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (articleId.present) {
      map['article_id'] = Variable<int>(articleId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleCategoriesCompanion(')
          ..write('articleId: $articleId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticleIndustriesTable extends ArticleIndustries
    with TableInfo<$ArticleIndustriesTable, ArticleIndustry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleIndustriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<int> articleId = GeneratedColumn<int>(
      'article_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES articles (id)'));
  static const VerificationMeta _industryIdMeta =
      const VerificationMeta('industryId');
  @override
  late final GeneratedColumn<int> industryId = GeneratedColumn<int>(
      'industry_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES industries (id)'));
  @override
  List<GeneratedColumn> get $columns => [articleId, industryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'article_industries';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleIndustry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('industry_id')) {
      context.handle(
          _industryIdMeta,
          industryId.isAcceptableOrUnknown(
              data['industry_id']!, _industryIdMeta));
    } else if (isInserting) {
      context.missing(_industryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {articleId, industryId};
  @override
  ArticleIndustry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleIndustry(
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}article_id'])!,
      industryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}industry_id'])!,
    );
  }

  @override
  $ArticleIndustriesTable createAlias(String alias) {
    return $ArticleIndustriesTable(attachedDatabase, alias);
  }
}

class ArticleIndustry extends DataClass implements Insertable<ArticleIndustry> {
  final int articleId;
  final int industryId;
  const ArticleIndustry({required this.articleId, required this.industryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['article_id'] = Variable<int>(articleId);
    map['industry_id'] = Variable<int>(industryId);
    return map;
  }

  ArticleIndustriesCompanion toCompanion(bool nullToAbsent) {
    return ArticleIndustriesCompanion(
      articleId: Value(articleId),
      industryId: Value(industryId),
    );
  }

  factory ArticleIndustry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleIndustry(
      articleId: serializer.fromJson<int>(json['articleId']),
      industryId: serializer.fromJson<int>(json['industryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'articleId': serializer.toJson<int>(articleId),
      'industryId': serializer.toJson<int>(industryId),
    };
  }

  ArticleIndustry copyWith({int? articleId, int? industryId}) =>
      ArticleIndustry(
        articleId: articleId ?? this.articleId,
        industryId: industryId ?? this.industryId,
      );
  ArticleIndustry copyWithCompanion(ArticleIndustriesCompanion data) {
    return ArticleIndustry(
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      industryId:
          data.industryId.present ? data.industryId.value : this.industryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticleIndustry(')
          ..write('articleId: $articleId, ')
          ..write('industryId: $industryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(articleId, industryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleIndustry &&
          other.articleId == this.articleId &&
          other.industryId == this.industryId);
}

class ArticleIndustriesCompanion extends UpdateCompanion<ArticleIndustry> {
  final Value<int> articleId;
  final Value<int> industryId;
  final Value<int> rowid;
  const ArticleIndustriesCompanion({
    this.articleId = const Value.absent(),
    this.industryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticleIndustriesCompanion.insert({
    required int articleId,
    required int industryId,
    this.rowid = const Value.absent(),
  })  : articleId = Value(articleId),
        industryId = Value(industryId);
  static Insertable<ArticleIndustry> custom({
    Expression<int>? articleId,
    Expression<int>? industryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (articleId != null) 'article_id': articleId,
      if (industryId != null) 'industry_id': industryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticleIndustriesCompanion copyWith(
      {Value<int>? articleId, Value<int>? industryId, Value<int>? rowid}) {
    return ArticleIndustriesCompanion(
      articleId: articleId ?? this.articleId,
      industryId: industryId ?? this.industryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (articleId.present) {
      map['article_id'] = Variable<int>(articleId.value);
    }
    if (industryId.present) {
      map['industry_id'] = Variable<int>(industryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleIndustriesCompanion(')
          ..write('articleId: $articleId, ')
          ..write('industryId: $industryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticleEntitiesTable extends ArticleEntities
    with TableInfo<$ArticleEntitiesTable, ArticleEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<int> articleId = GeneratedColumn<int>(
      'article_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES articles (id)'));
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES entities (id)'));
  @override
  List<GeneratedColumn> get $columns => [articleId, entityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'article_entities';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {articleId, entityId};
  @override
  ArticleEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleEntity(
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}article_id'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entity_id'])!,
    );
  }

  @override
  $ArticleEntitiesTable createAlias(String alias) {
    return $ArticleEntitiesTable(attachedDatabase, alias);
  }
}

class ArticleEntity extends DataClass implements Insertable<ArticleEntity> {
  final int articleId;
  final int entityId;
  const ArticleEntity({required this.articleId, required this.entityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['article_id'] = Variable<int>(articleId);
    map['entity_id'] = Variable<int>(entityId);
    return map;
  }

  ArticleEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ArticleEntitiesCompanion(
      articleId: Value(articleId),
      entityId: Value(entityId),
    );
  }

  factory ArticleEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleEntity(
      articleId: serializer.fromJson<int>(json['articleId']),
      entityId: serializer.fromJson<int>(json['entityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'articleId': serializer.toJson<int>(articleId),
      'entityId': serializer.toJson<int>(entityId),
    };
  }

  ArticleEntity copyWith({int? articleId, int? entityId}) => ArticleEntity(
        articleId: articleId ?? this.articleId,
        entityId: entityId ?? this.entityId,
      );
  ArticleEntity copyWithCompanion(ArticleEntitiesCompanion data) {
    return ArticleEntity(
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticleEntity(')
          ..write('articleId: $articleId, ')
          ..write('entityId: $entityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(articleId, entityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleEntity &&
          other.articleId == this.articleId &&
          other.entityId == this.entityId);
}

class ArticleEntitiesCompanion extends UpdateCompanion<ArticleEntity> {
  final Value<int> articleId;
  final Value<int> entityId;
  final Value<int> rowid;
  const ArticleEntitiesCompanion({
    this.articleId = const Value.absent(),
    this.entityId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticleEntitiesCompanion.insert({
    required int articleId,
    required int entityId,
    this.rowid = const Value.absent(),
  })  : articleId = Value(articleId),
        entityId = Value(entityId);
  static Insertable<ArticleEntity> custom({
    Expression<int>? articleId,
    Expression<int>? entityId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (articleId != null) 'article_id': articleId,
      if (entityId != null) 'entity_id': entityId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticleEntitiesCompanion copyWith(
      {Value<int>? articleId, Value<int>? entityId, Value<int>? rowid}) {
    return ArticleEntitiesCompanion(
      articleId: articleId ?? this.articleId,
      entityId: entityId ?? this.entityId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (articleId.present) {
      map['article_id'] = Variable<int>(articleId.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleEntitiesCompanion(')
          ..write('articleId: $articleId, ')
          ..write('entityId: $entityId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IntegrationControlTable extends IntegrationControl
    with TableInfo<$IntegrationControlTable, IntegrationControlData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntegrationControlTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _lastAutoSyncAtMeta =
      const VerificationMeta('lastAutoSyncAt');
  @override
  late final GeneratedColumn<DateTime> lastAutoSyncAt =
      GeneratedColumn<DateTime>('last_auto_sync_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _responseJsonMeta =
      const VerificationMeta('responseJson');
  @override
  late final GeneratedColumn<String> responseJson = GeneratedColumn<String>(
      'response_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, lastAutoSyncAt, responseJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'integration_control';
  @override
  VerificationContext validateIntegrity(
      Insertable<IntegrationControlData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('last_auto_sync_at')) {
      context.handle(
          _lastAutoSyncAtMeta,
          lastAutoSyncAt.isAcceptableOrUnknown(
              data['last_auto_sync_at']!, _lastAutoSyncAtMeta));
    }
    if (data.containsKey('response_json')) {
      context.handle(
          _responseJsonMeta,
          responseJson.isAcceptableOrUnknown(
              data['response_json']!, _responseJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IntegrationControlData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IntegrationControlData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lastAutoSyncAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_auto_sync_at']),
      responseJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response_json']),
    );
  }

  @override
  $IntegrationControlTable createAlias(String alias) {
    return $IntegrationControlTable(attachedDatabase, alias);
  }
}

class IntegrationControlData extends DataClass
    implements Insertable<IntegrationControlData> {
  final int id;
  final DateTime? lastAutoSyncAt;
  final String? responseJson;
  const IntegrationControlData(
      {required this.id, this.lastAutoSyncAt, this.responseJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || lastAutoSyncAt != null) {
      map['last_auto_sync_at'] = Variable<DateTime>(lastAutoSyncAt);
    }
    if (!nullToAbsent || responseJson != null) {
      map['response_json'] = Variable<String>(responseJson);
    }
    return map;
  }

  IntegrationControlCompanion toCompanion(bool nullToAbsent) {
    return IntegrationControlCompanion(
      id: Value(id),
      lastAutoSyncAt: lastAutoSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAutoSyncAt),
      responseJson: responseJson == null && nullToAbsent
          ? const Value.absent()
          : Value(responseJson),
    );
  }

  factory IntegrationControlData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IntegrationControlData(
      id: serializer.fromJson<int>(json['id']),
      lastAutoSyncAt: serializer.fromJson<DateTime?>(json['lastAutoSyncAt']),
      responseJson: serializer.fromJson<String?>(json['responseJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lastAutoSyncAt': serializer.toJson<DateTime?>(lastAutoSyncAt),
      'responseJson': serializer.toJson<String?>(responseJson),
    };
  }

  IntegrationControlData copyWith(
          {int? id,
          Value<DateTime?> lastAutoSyncAt = const Value.absent(),
          Value<String?> responseJson = const Value.absent()}) =>
      IntegrationControlData(
        id: id ?? this.id,
        lastAutoSyncAt:
            lastAutoSyncAt.present ? lastAutoSyncAt.value : this.lastAutoSyncAt,
        responseJson:
            responseJson.present ? responseJson.value : this.responseJson,
      );
  IntegrationControlData copyWithCompanion(IntegrationControlCompanion data) {
    return IntegrationControlData(
      id: data.id.present ? data.id.value : this.id,
      lastAutoSyncAt: data.lastAutoSyncAt.present
          ? data.lastAutoSyncAt.value
          : this.lastAutoSyncAt,
      responseJson: data.responseJson.present
          ? data.responseJson.value
          : this.responseJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IntegrationControlData(')
          ..write('id: $id, ')
          ..write('lastAutoSyncAt: $lastAutoSyncAt, ')
          ..write('responseJson: $responseJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lastAutoSyncAt, responseJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IntegrationControlData &&
          other.id == this.id &&
          other.lastAutoSyncAt == this.lastAutoSyncAt &&
          other.responseJson == this.responseJson);
}

class IntegrationControlCompanion
    extends UpdateCompanion<IntegrationControlData> {
  final Value<int> id;
  final Value<DateTime?> lastAutoSyncAt;
  final Value<String?> responseJson;
  const IntegrationControlCompanion({
    this.id = const Value.absent(),
    this.lastAutoSyncAt = const Value.absent(),
    this.responseJson = const Value.absent(),
  });
  IntegrationControlCompanion.insert({
    this.id = const Value.absent(),
    this.lastAutoSyncAt = const Value.absent(),
    this.responseJson = const Value.absent(),
  });
  static Insertable<IntegrationControlData> custom({
    Expression<int>? id,
    Expression<DateTime>? lastAutoSyncAt,
    Expression<String>? responseJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastAutoSyncAt != null) 'last_auto_sync_at': lastAutoSyncAt,
      if (responseJson != null) 'response_json': responseJson,
    });
  }

  IntegrationControlCompanion copyWith(
      {Value<int>? id,
      Value<DateTime?>? lastAutoSyncAt,
      Value<String?>? responseJson}) {
    return IntegrationControlCompanion(
      id: id ?? this.id,
      lastAutoSyncAt: lastAutoSyncAt ?? this.lastAutoSyncAt,
      responseJson: responseJson ?? this.responseJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lastAutoSyncAt.present) {
      map['last_auto_sync_at'] = Variable<DateTime>(lastAutoSyncAt.value);
    }
    if (responseJson.present) {
      map['response_json'] = Variable<String>(responseJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntegrationControlCompanion(')
          ..write('id: $id, ')
          ..write('lastAutoSyncAt: $lastAutoSyncAt, ')
          ..write('responseJson: $responseJson')
          ..write(')'))
        .toString();
  }
}

class $SyncLogsTable extends SyncLogs with TableInfo<$SyncLogsTable, SyncLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _articlesProcessedMeta =
      const VerificationMeta('articlesProcessed');
  @override
  late final GeneratedColumn<int> articlesProcessed = GeneratedColumn<int>(
      'articles_processed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _articlesInsertedMeta =
      const VerificationMeta('articlesInserted');
  @override
  late final GeneratedColumn<int> articlesInserted = GeneratedColumn<int>(
      'articles_inserted', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _articlesSkippedMeta =
      const VerificationMeta('articlesSkipped');
  @override
  late final GeneratedColumn<int> articlesSkipped = GeneratedColumn<int>(
      'articles_skipped', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _errorDetailsMeta =
      const VerificationMeta('errorDetails');
  @override
  late final GeneratedColumn<String> errorDetails = GeneratedColumn<String>(
      'error_details', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMsMeta =
      const VerificationMeta('durationMs');
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
      'duration_ms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        timestamp,
        type,
        status,
        message,
        articlesProcessed,
        articlesInserted,
        articlesSkipped,
        errorDetails,
        durationMs
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_logs';
  @override
  VerificationContext validateIntegrity(Insertable<SyncLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('articles_processed')) {
      context.handle(
          _articlesProcessedMeta,
          articlesProcessed.isAcceptableOrUnknown(
              data['articles_processed']!, _articlesProcessedMeta));
    } else if (isInserting) {
      context.missing(_articlesProcessedMeta);
    }
    if (data.containsKey('articles_inserted')) {
      context.handle(
          _articlesInsertedMeta,
          articlesInserted.isAcceptableOrUnknown(
              data['articles_inserted']!, _articlesInsertedMeta));
    } else if (isInserting) {
      context.missing(_articlesInsertedMeta);
    }
    if (data.containsKey('articles_skipped')) {
      context.handle(
          _articlesSkippedMeta,
          articlesSkipped.isAcceptableOrUnknown(
              data['articles_skipped']!, _articlesSkippedMeta));
    } else if (isInserting) {
      context.missing(_articlesSkippedMeta);
    }
    if (data.containsKey('error_details')) {
      context.handle(
          _errorDetailsMeta,
          errorDetails.isAcceptableOrUnknown(
              data['error_details']!, _errorDetailsMeta));
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
          _durationMsMeta,
          durationMs.isAcceptableOrUnknown(
              data['duration_ms']!, _durationMsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      articlesProcessed: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}articles_processed'])!,
      articlesInserted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}articles_inserted'])!,
      articlesSkipped: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}articles_skipped'])!,
      errorDetails: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_details']),
      durationMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_ms']),
    );
  }

  @override
  $SyncLogsTable createAlias(String alias) {
    return $SyncLogsTable(attachedDatabase, alias);
  }
}

class SyncLog extends DataClass implements Insertable<SyncLog> {
  final int id;
  final DateTime timestamp;
  final String type;
  final String status;
  final String message;
  final int articlesProcessed;
  final int articlesInserted;
  final int articlesSkipped;
  final String? errorDetails;
  final int? durationMs;
  const SyncLog(
      {required this.id,
      required this.timestamp,
      required this.type,
      required this.status,
      required this.message,
      required this.articlesProcessed,
      required this.articlesInserted,
      required this.articlesSkipped,
      this.errorDetails,
      this.durationMs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    map['message'] = Variable<String>(message);
    map['articles_processed'] = Variable<int>(articlesProcessed);
    map['articles_inserted'] = Variable<int>(articlesInserted);
    map['articles_skipped'] = Variable<int>(articlesSkipped);
    if (!nullToAbsent || errorDetails != null) {
      map['error_details'] = Variable<String>(errorDetails);
    }
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    return map;
  }

  SyncLogsCompanion toCompanion(bool nullToAbsent) {
    return SyncLogsCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      type: Value(type),
      status: Value(status),
      message: Value(message),
      articlesProcessed: Value(articlesProcessed),
      articlesInserted: Value(articlesInserted),
      articlesSkipped: Value(articlesSkipped),
      errorDetails: errorDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(errorDetails),
      durationMs: durationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMs),
    );
  }

  factory SyncLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncLog(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      message: serializer.fromJson<String>(json['message']),
      articlesProcessed: serializer.fromJson<int>(json['articlesProcessed']),
      articlesInserted: serializer.fromJson<int>(json['articlesInserted']),
      articlesSkipped: serializer.fromJson<int>(json['articlesSkipped']),
      errorDetails: serializer.fromJson<String?>(json['errorDetails']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'message': serializer.toJson<String>(message),
      'articlesProcessed': serializer.toJson<int>(articlesProcessed),
      'articlesInserted': serializer.toJson<int>(articlesInserted),
      'articlesSkipped': serializer.toJson<int>(articlesSkipped),
      'errorDetails': serializer.toJson<String?>(errorDetails),
      'durationMs': serializer.toJson<int?>(durationMs),
    };
  }

  SyncLog copyWith(
          {int? id,
          DateTime? timestamp,
          String? type,
          String? status,
          String? message,
          int? articlesProcessed,
          int? articlesInserted,
          int? articlesSkipped,
          Value<String?> errorDetails = const Value.absent(),
          Value<int?> durationMs = const Value.absent()}) =>
      SyncLog(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type,
        status: status ?? this.status,
        message: message ?? this.message,
        articlesProcessed: articlesProcessed ?? this.articlesProcessed,
        articlesInserted: articlesInserted ?? this.articlesInserted,
        articlesSkipped: articlesSkipped ?? this.articlesSkipped,
        errorDetails:
            errorDetails.present ? errorDetails.value : this.errorDetails,
        durationMs: durationMs.present ? durationMs.value : this.durationMs,
      );
  SyncLog copyWithCompanion(SyncLogsCompanion data) {
    return SyncLog(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      message: data.message.present ? data.message.value : this.message,
      articlesProcessed: data.articlesProcessed.present
          ? data.articlesProcessed.value
          : this.articlesProcessed,
      articlesInserted: data.articlesInserted.present
          ? data.articlesInserted.value
          : this.articlesInserted,
      articlesSkipped: data.articlesSkipped.present
          ? data.articlesSkipped.value
          : this.articlesSkipped,
      errorDetails: data.errorDetails.present
          ? data.errorDetails.value
          : this.errorDetails,
      durationMs:
          data.durationMs.present ? data.durationMs.value : this.durationMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncLog(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('articlesProcessed: $articlesProcessed, ')
          ..write('articlesInserted: $articlesInserted, ')
          ..write('articlesSkipped: $articlesSkipped, ')
          ..write('errorDetails: $errorDetails, ')
          ..write('durationMs: $durationMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      timestamp,
      type,
      status,
      message,
      articlesProcessed,
      articlesInserted,
      articlesSkipped,
      errorDetails,
      durationMs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncLog &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.type == this.type &&
          other.status == this.status &&
          other.message == this.message &&
          other.articlesProcessed == this.articlesProcessed &&
          other.articlesInserted == this.articlesInserted &&
          other.articlesSkipped == this.articlesSkipped &&
          other.errorDetails == this.errorDetails &&
          other.durationMs == this.durationMs);
}

class SyncLogsCompanion extends UpdateCompanion<SyncLog> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> type;
  final Value<String> status;
  final Value<String> message;
  final Value<int> articlesProcessed;
  final Value<int> articlesInserted;
  final Value<int> articlesSkipped;
  final Value<String?> errorDetails;
  final Value<int?> durationMs;
  const SyncLogsCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.message = const Value.absent(),
    this.articlesProcessed = const Value.absent(),
    this.articlesInserted = const Value.absent(),
    this.articlesSkipped = const Value.absent(),
    this.errorDetails = const Value.absent(),
    this.durationMs = const Value.absent(),
  });
  SyncLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String type,
    required String status,
    required String message,
    required int articlesProcessed,
    required int articlesInserted,
    required int articlesSkipped,
    this.errorDetails = const Value.absent(),
    this.durationMs = const Value.absent(),
  })  : timestamp = Value(timestamp),
        type = Value(type),
        status = Value(status),
        message = Value(message),
        articlesProcessed = Value(articlesProcessed),
        articlesInserted = Value(articlesInserted),
        articlesSkipped = Value(articlesSkipped);
  static Insertable<SyncLog> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? type,
    Expression<String>? status,
    Expression<String>? message,
    Expression<int>? articlesProcessed,
    Expression<int>? articlesInserted,
    Expression<int>? articlesSkipped,
    Expression<String>? errorDetails,
    Expression<int>? durationMs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (message != null) 'message': message,
      if (articlesProcessed != null) 'articles_processed': articlesProcessed,
      if (articlesInserted != null) 'articles_inserted': articlesInserted,
      if (articlesSkipped != null) 'articles_skipped': articlesSkipped,
      if (errorDetails != null) 'error_details': errorDetails,
      if (durationMs != null) 'duration_ms': durationMs,
    });
  }

  SyncLogsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<String>? type,
      Value<String>? status,
      Value<String>? message,
      Value<int>? articlesProcessed,
      Value<int>? articlesInserted,
      Value<int>? articlesSkipped,
      Value<String?>? errorDetails,
      Value<int?>? durationMs}) {
    return SyncLogsCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      status: status ?? this.status,
      message: message ?? this.message,
      articlesProcessed: articlesProcessed ?? this.articlesProcessed,
      articlesInserted: articlesInserted ?? this.articlesInserted,
      articlesSkipped: articlesSkipped ?? this.articlesSkipped,
      errorDetails: errorDetails ?? this.errorDetails,
      durationMs: durationMs ?? this.durationMs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (articlesProcessed.present) {
      map['articles_processed'] = Variable<int>(articlesProcessed.value);
    }
    if (articlesInserted.present) {
      map['articles_inserted'] = Variable<int>(articlesInserted.value);
    }
    if (articlesSkipped.present) {
      map['articles_skipped'] = Variable<int>(articlesSkipped.value);
    }
    if (errorDetails.present) {
      map['error_details'] = Variable<String>(errorDetails.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncLogsCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('articlesProcessed: $articlesProcessed, ')
          ..write('articlesInserted: $articlesInserted, ')
          ..write('articlesSkipped: $articlesSkipped, ')
          ..write('errorDetails: $errorDetails, ')
          ..write('durationMs: $durationMs')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NewsTableTable newsTable = $NewsTableTable(this);
  late final $AuthorsTable authors = $AuthorsTable(this);
  late final $SourcesTable sources = $SourcesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $IndustriesTable industries = $IndustriesTable(this);
  late final $EntitiesTable entities = $EntitiesTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $MediasTable medias = $MediasTable(this);
  late final $ArticleCategoriesTable articleCategories =
      $ArticleCategoriesTable(this);
  late final $ArticleIndustriesTable articleIndustries =
      $ArticleIndustriesTable(this);
  late final $ArticleEntitiesTable articleEntities =
      $ArticleEntitiesTable(this);
  late final $IntegrationControlTable integrationControl =
      $IntegrationControlTable(this);
  late final $SyncLogsTable syncLogs = $SyncLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        newsTable,
        authors,
        sources,
        categories,
        industries,
        entities,
        articles,
        medias,
        articleCategories,
        articleIndustries,
        articleEntities,
        integrationControl,
        syncLogs
      ];
}

typedef $$NewsTableTableCreateCompanionBuilder = NewsTableCompanion Function({
  Value<int> id,
  required String title,
  required String content,
});
typedef $$NewsTableTableUpdateCompanionBuilder = NewsTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
});

class $$NewsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));
}

class $$NewsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));
}

class $$NewsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$NewsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NewsTableTable,
    NewsTableData,
    $$NewsTableTableFilterComposer,
    $$NewsTableTableOrderingComposer,
    $$NewsTableTableAnnotationComposer,
    $$NewsTableTableCreateCompanionBuilder,
    $$NewsTableTableUpdateCompanionBuilder,
    (
      NewsTableData,
      BaseReferences<_$AppDatabase, $NewsTableTable, NewsTableData>
    ),
    NewsTableData,
    PrefetchHooks Function()> {
  $$NewsTableTableTableManager(_$AppDatabase db, $NewsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
          }) =>
              NewsTableCompanion(
            id: id,
            title: title,
            content: content,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
          }) =>
              NewsTableCompanion.insert(
            id: id,
            title: title,
            content: content,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NewsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NewsTableTable,
    NewsTableData,
    $$NewsTableTableFilterComposer,
    $$NewsTableTableOrderingComposer,
    $$NewsTableTableAnnotationComposer,
    $$NewsTableTableCreateCompanionBuilder,
    $$NewsTableTableUpdateCompanionBuilder,
    (
      NewsTableData,
      BaseReferences<_$AppDatabase, $NewsTableTable, NewsTableData>
    ),
    NewsTableData,
    PrefetchHooks Function()>;
typedef $$AuthorsTableCreateCompanionBuilder = AuthorsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> email,
});
typedef $$AuthorsTableUpdateCompanionBuilder = AuthorsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> email,
});

final class $$AuthorsTableReferences
    extends BaseReferences<_$AppDatabase, $AuthorsTable, Author> {
  $$AuthorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArticlesTable, List<Article>> _articlesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.articles,
          aliasName: $_aliasNameGenerator(db.authors.id, db.articles.authorId));

  $$ArticlesTableProcessedTableManager get articlesRefs {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.authorId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_articlesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  Expression<bool> articlesRefs(
      Expression<bool> Function($$ArticlesTableFilterComposer f) f) {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.authorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
}

class $$AuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  Expression<T> articlesRefs<T extends Object>(
      Expression<T> Function($$ArticlesTableAnnotationComposer a) f) {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.authorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AuthorsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuthorsTable,
    Author,
    $$AuthorsTableFilterComposer,
    $$AuthorsTableOrderingComposer,
    $$AuthorsTableAnnotationComposer,
    $$AuthorsTableCreateCompanionBuilder,
    $$AuthorsTableUpdateCompanionBuilder,
    (Author, $$AuthorsTableReferences),
    Author,
    PrefetchHooks Function({bool articlesRefs})> {
  $$AuthorsTableTableManager(_$AppDatabase db, $AuthorsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> email = const Value.absent(),
          }) =>
              AuthorsCompanion(
            id: id,
            name: name,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> email = const Value.absent(),
          }) =>
              AuthorsCompanion.insert(
            id: id,
            name: name,
            email: email,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AuthorsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({articlesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (articlesRefs) db.articles],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articlesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$AuthorsTableReferences._articlesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AuthorsTableReferences(db, table, p0)
                                .articlesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.authorId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AuthorsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuthorsTable,
    Author,
    $$AuthorsTableFilterComposer,
    $$AuthorsTableOrderingComposer,
    $$AuthorsTableAnnotationComposer,
    $$AuthorsTableCreateCompanionBuilder,
    $$AuthorsTableUpdateCompanionBuilder,
    (Author, $$AuthorsTableReferences),
    Author,
    PrefetchHooks Function({bool articlesRefs})>;
typedef $$SourcesTableCreateCompanionBuilder = SourcesCompanion Function({
  Value<int> id,
  required String domain,
  required String homePageUrl,
  required String type,
  Value<int?> rankingsOpr,
  Value<String?> locationCountryName,
  Value<String?> locationCountryCode,
  Value<String?> favicon,
});
typedef $$SourcesTableUpdateCompanionBuilder = SourcesCompanion Function({
  Value<int> id,
  Value<String> domain,
  Value<String> homePageUrl,
  Value<String> type,
  Value<int?> rankingsOpr,
  Value<String?> locationCountryName,
  Value<String?> locationCountryCode,
  Value<String?> favicon,
});

final class $$SourcesTableReferences
    extends BaseReferences<_$AppDatabase, $SourcesTable, Source> {
  $$SourcesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArticlesTable, List<Article>> _articlesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.articles,
          aliasName: $_aliasNameGenerator(db.sources.id, db.articles.sourceId));

  $$ArticlesTableProcessedTableManager get articlesRefs {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.sourceId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_articlesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SourcesTableFilterComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get homePageUrl => $composableBuilder(
      column: $table.homePageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rankingsOpr => $composableBuilder(
      column: $table.rankingsOpr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationCountryName => $composableBuilder(
      column: $table.locationCountryName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationCountryCode => $composableBuilder(
      column: $table.locationCountryCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get favicon => $composableBuilder(
      column: $table.favicon, builder: (column) => ColumnFilters(column));

  Expression<bool> articlesRefs(
      Expression<bool> Function($$ArticlesTableFilterComposer f) f) {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.sourceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get homePageUrl => $composableBuilder(
      column: $table.homePageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rankingsOpr => $composableBuilder(
      column: $table.rankingsOpr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationCountryName => $composableBuilder(
      column: $table.locationCountryName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationCountryCode => $composableBuilder(
      column: $table.locationCountryCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get favicon => $composableBuilder(
      column: $table.favicon, builder: (column) => ColumnOrderings(column));
}

class $$SourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<String> get homePageUrl => $composableBuilder(
      column: $table.homePageUrl, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get rankingsOpr => $composableBuilder(
      column: $table.rankingsOpr, builder: (column) => column);

  GeneratedColumn<String> get locationCountryName => $composableBuilder(
      column: $table.locationCountryName, builder: (column) => column);

  GeneratedColumn<String> get locationCountryCode => $composableBuilder(
      column: $table.locationCountryCode, builder: (column) => column);

  GeneratedColumn<String> get favicon =>
      $composableBuilder(column: $table.favicon, builder: (column) => column);

  Expression<T> articlesRefs<T extends Object>(
      Expression<T> Function($$ArticlesTableAnnotationComposer a) f) {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.sourceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SourcesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SourcesTable,
    Source,
    $$SourcesTableFilterComposer,
    $$SourcesTableOrderingComposer,
    $$SourcesTableAnnotationComposer,
    $$SourcesTableCreateCompanionBuilder,
    $$SourcesTableUpdateCompanionBuilder,
    (Source, $$SourcesTableReferences),
    Source,
    PrefetchHooks Function({bool articlesRefs})> {
  $$SourcesTableTableManager(_$AppDatabase db, $SourcesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> domain = const Value.absent(),
            Value<String> homePageUrl = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int?> rankingsOpr = const Value.absent(),
            Value<String?> locationCountryName = const Value.absent(),
            Value<String?> locationCountryCode = const Value.absent(),
            Value<String?> favicon = const Value.absent(),
          }) =>
              SourcesCompanion(
            id: id,
            domain: domain,
            homePageUrl: homePageUrl,
            type: type,
            rankingsOpr: rankingsOpr,
            locationCountryName: locationCountryName,
            locationCountryCode: locationCountryCode,
            favicon: favicon,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String domain,
            required String homePageUrl,
            required String type,
            Value<int?> rankingsOpr = const Value.absent(),
            Value<String?> locationCountryName = const Value.absent(),
            Value<String?> locationCountryCode = const Value.absent(),
            Value<String?> favicon = const Value.absent(),
          }) =>
              SourcesCompanion.insert(
            id: id,
            domain: domain,
            homePageUrl: homePageUrl,
            type: type,
            rankingsOpr: rankingsOpr,
            locationCountryName: locationCountryName,
            locationCountryCode: locationCountryCode,
            favicon: favicon,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SourcesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({articlesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (articlesRefs) db.articles],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articlesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SourcesTableReferences._articlesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SourcesTableReferences(db, table, p0)
                                .articlesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.sourceId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SourcesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SourcesTable,
    Source,
    $$SourcesTableFilterComposer,
    $$SourcesTableOrderingComposer,
    $$SourcesTableAnnotationComposer,
    $$SourcesTableCreateCompanionBuilder,
    $$SourcesTableUpdateCompanionBuilder,
    (Source, $$SourcesTableReferences),
    Source,
    PrefetchHooks Function({bool articlesRefs})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  required String name,
  Value<double?> score,
  Value<String?> taxonomy,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<double?> score,
  Value<String?> taxonomy,
  Value<int> rowid,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArticleCategoriesTable, List<ArticleCategory>>
      _articleCategoriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleCategories,
              aliasName: $_aliasNameGenerator(
                  db.categories.id, db.articleCategories.categoryId));

  $$ArticleCategoriesTableProcessedTableManager get articleCategoriesRefs {
    final manager =
        $$ArticleCategoriesTableTableManager($_db, $_db.articleCategories)
            .filter((f) => f.categoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_articleCategoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taxonomy => $composableBuilder(
      column: $table.taxonomy, builder: (column) => ColumnFilters(column));

  Expression<bool> articleCategoriesRefs(
      Expression<bool> Function($$ArticleCategoriesTableFilterComposer f) f) {
    final $$ArticleCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleCategories,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.articleCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taxonomy => $composableBuilder(
      column: $table.taxonomy, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get taxonomy =>
      $composableBuilder(column: $table.taxonomy, builder: (column) => column);

  Expression<T> articleCategoriesRefs<T extends Object>(
      Expression<T> Function($$ArticleCategoriesTableAnnotationComposer a) f) {
    final $$ArticleCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.articleCategories,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ArticleCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.articleCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool articleCategoriesRefs})> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double?> score = const Value.absent(),
            Value<String?> taxonomy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            score: score,
            taxonomy: taxonomy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<double?> score = const Value.absent(),
            Value<String?> taxonomy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            score: score,
            taxonomy: taxonomy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleCategoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (articleCategoriesRefs) db.articleCategories
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articleCategoriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._articleCategoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .articleCategoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool articleCategoriesRefs})>;
typedef $$IndustriesTableCreateCompanionBuilder = IndustriesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$IndustriesTableUpdateCompanionBuilder = IndustriesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$IndustriesTableReferences
    extends BaseReferences<_$AppDatabase, $IndustriesTable, Industry> {
  $$IndustriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArticleIndustriesTable, List<ArticleIndustry>>
      _articleIndustriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleIndustries,
              aliasName: $_aliasNameGenerator(
                  db.industries.id, db.articleIndustries.industryId));

  $$ArticleIndustriesTableProcessedTableManager get articleIndustriesRefs {
    final manager =
        $$ArticleIndustriesTableTableManager($_db, $_db.articleIndustries)
            .filter((f) => f.industryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_articleIndustriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$IndustriesTableFilterComposer
    extends Composer<_$AppDatabase, $IndustriesTable> {
  $$IndustriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> articleIndustriesRefs(
      Expression<bool> Function($$ArticleIndustriesTableFilterComposer f) f) {
    final $$ArticleIndustriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleIndustries,
        getReferencedColumn: (t) => t.industryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleIndustriesTableFilterComposer(
              $db: $db,
              $table: $db.articleIndustries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IndustriesTableOrderingComposer
    extends Composer<_$AppDatabase, $IndustriesTable> {
  $$IndustriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$IndustriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IndustriesTable> {
  $$IndustriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> articleIndustriesRefs<T extends Object>(
      Expression<T> Function($$ArticleIndustriesTableAnnotationComposer a) f) {
    final $$ArticleIndustriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.articleIndustries,
            getReferencedColumn: (t) => t.industryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ArticleIndustriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.articleIndustries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$IndustriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IndustriesTable,
    Industry,
    $$IndustriesTableFilterComposer,
    $$IndustriesTableOrderingComposer,
    $$IndustriesTableAnnotationComposer,
    $$IndustriesTableCreateCompanionBuilder,
    $$IndustriesTableUpdateCompanionBuilder,
    (Industry, $$IndustriesTableReferences),
    Industry,
    PrefetchHooks Function({bool articleIndustriesRefs})> {
  $$IndustriesTableTableManager(_$AppDatabase db, $IndustriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IndustriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IndustriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IndustriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              IndustriesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              IndustriesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IndustriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleIndustriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (articleIndustriesRefs) db.articleIndustries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articleIndustriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$IndustriesTableReferences
                            ._articleIndustriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IndustriesTableReferences(db, table, p0)
                                .articleIndustriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.industryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$IndustriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IndustriesTable,
    Industry,
    $$IndustriesTableFilterComposer,
    $$IndustriesTableOrderingComposer,
    $$IndustriesTableAnnotationComposer,
    $$IndustriesTableCreateCompanionBuilder,
    $$IndustriesTableUpdateCompanionBuilder,
    (Industry, $$IndustriesTableReferences),
    Industry,
    PrefetchHooks Function({bool articleIndustriesRefs})>;
typedef $$EntitiesTableCreateCompanionBuilder = EntitiesCompanion Function({
  Value<int> id,
  required String name,
  required String types,
  Value<String?> language,
  Value<int?> frequency,
  Value<String?> wikipediaUrl,
  Value<String?> wikidataUrl,
});
typedef $$EntitiesTableUpdateCompanionBuilder = EntitiesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> types,
  Value<String?> language,
  Value<int?> frequency,
  Value<String?> wikipediaUrl,
  Value<String?> wikidataUrl,
});

final class $$EntitiesTableReferences
    extends BaseReferences<_$AppDatabase, $EntitiesTable, Entity> {
  $$EntitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArticleEntitiesTable, List<ArticleEntity>>
      _articleEntitiesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleEntities,
              aliasName: $_aliasNameGenerator(
                  db.entities.id, db.articleEntities.entityId));

  $$ArticleEntitiesTableProcessedTableManager get articleEntitiesRefs {
    final manager =
        $$ArticleEntitiesTableTableManager($_db, $_db.articleEntities)
            .filter((f) => f.entityId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_articleEntitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$EntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $EntitiesTable> {
  $$EntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get types => $composableBuilder(
      column: $table.types, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wikipediaUrl => $composableBuilder(
      column: $table.wikipediaUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wikidataUrl => $composableBuilder(
      column: $table.wikidataUrl, builder: (column) => ColumnFilters(column));

  Expression<bool> articleEntitiesRefs(
      Expression<bool> Function($$ArticleEntitiesTableFilterComposer f) f) {
    final $$ArticleEntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleEntities,
        getReferencedColumn: (t) => t.entityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleEntitiesTableFilterComposer(
              $db: $db,
              $table: $db.articleEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $EntitiesTable> {
  $$EntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get types => $composableBuilder(
      column: $table.types, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wikipediaUrl => $composableBuilder(
      column: $table.wikipediaUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wikidataUrl => $composableBuilder(
      column: $table.wikidataUrl, builder: (column) => ColumnOrderings(column));
}

class $$EntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntitiesTable> {
  $$EntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get types =>
      $composableBuilder(column: $table.types, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get wikipediaUrl => $composableBuilder(
      column: $table.wikipediaUrl, builder: (column) => column);

  GeneratedColumn<String> get wikidataUrl => $composableBuilder(
      column: $table.wikidataUrl, builder: (column) => column);

  Expression<T> articleEntitiesRefs<T extends Object>(
      Expression<T> Function($$ArticleEntitiesTableAnnotationComposer a) f) {
    final $$ArticleEntitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleEntities,
        getReferencedColumn: (t) => t.entityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleEntitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.articleEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EntitiesTable,
    Entity,
    $$EntitiesTableFilterComposer,
    $$EntitiesTableOrderingComposer,
    $$EntitiesTableAnnotationComposer,
    $$EntitiesTableCreateCompanionBuilder,
    $$EntitiesTableUpdateCompanionBuilder,
    (Entity, $$EntitiesTableReferences),
    Entity,
    PrefetchHooks Function({bool articleEntitiesRefs})> {
  $$EntitiesTableTableManager(_$AppDatabase db, $EntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> types = const Value.absent(),
            Value<String?> language = const Value.absent(),
            Value<int?> frequency = const Value.absent(),
            Value<String?> wikipediaUrl = const Value.absent(),
            Value<String?> wikidataUrl = const Value.absent(),
          }) =>
              EntitiesCompanion(
            id: id,
            name: name,
            types: types,
            language: language,
            frequency: frequency,
            wikipediaUrl: wikipediaUrl,
            wikidataUrl: wikidataUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String types,
            Value<String?> language = const Value.absent(),
            Value<int?> frequency = const Value.absent(),
            Value<String?> wikipediaUrl = const Value.absent(),
            Value<String?> wikidataUrl = const Value.absent(),
          }) =>
              EntitiesCompanion.insert(
            id: id,
            name: name,
            types: types,
            language: language,
            frequency: frequency,
            wikipediaUrl: wikipediaUrl,
            wikidataUrl: wikidataUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$EntitiesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({articleEntitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (articleEntitiesRefs) db.articleEntities
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articleEntitiesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$EntitiesTableReferences
                            ._articleEntitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EntitiesTableReferences(db, table, p0)
                                .articleEntitiesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.entityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$EntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EntitiesTable,
    Entity,
    $$EntitiesTableFilterComposer,
    $$EntitiesTableOrderingComposer,
    $$EntitiesTableAnnotationComposer,
    $$EntitiesTableCreateCompanionBuilder,
    $$EntitiesTableUpdateCompanionBuilder,
    (Entity, $$EntitiesTableReferences),
    Entity,
    PrefetchHooks Function({bool articleEntitiesRefs})>;
typedef $$ArticlesTableCreateCompanionBuilder = ArticlesCompanion Function({
  Value<int> id,
  required String href,
  required DateTime publishedAt,
  required String title,
  Value<String?> description,
  required String body,
  required String language,
  Value<String?> image,
  Value<int?> authorId,
  Value<int?> sourceId,
  Value<double?> sentimentOverallScore,
  Value<String?> sentimentOverallPolarity,
  required bool isDuplicate,
  required bool isPaywall,
  Value<int?> sentencesCount,
  Value<int?> paragraphsCount,
  Value<int?> wordsCount,
  Value<int?> charactersCount,
});
typedef $$ArticlesTableUpdateCompanionBuilder = ArticlesCompanion Function({
  Value<int> id,
  Value<String> href,
  Value<DateTime> publishedAt,
  Value<String> title,
  Value<String?> description,
  Value<String> body,
  Value<String> language,
  Value<String?> image,
  Value<int?> authorId,
  Value<int?> sourceId,
  Value<double?> sentimentOverallScore,
  Value<String?> sentimentOverallPolarity,
  Value<bool> isDuplicate,
  Value<bool> isPaywall,
  Value<int?> sentencesCount,
  Value<int?> paragraphsCount,
  Value<int?> wordsCount,
  Value<int?> charactersCount,
});

final class $$ArticlesTableReferences
    extends BaseReferences<_$AppDatabase, $ArticlesTable, Article> {
  $$ArticlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuthorsTable _authorIdTable(_$AppDatabase db) => db.authors
      .createAlias($_aliasNameGenerator(db.articles.authorId, db.authors.id));

  $$AuthorsTableProcessedTableManager? get authorId {
    if ($_item.authorId == null) return null;
    final manager = $$AuthorsTableTableManager($_db, $_db.authors)
        .filter((f) => f.id($_item.authorId!));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SourcesTable _sourceIdTable(_$AppDatabase db) => db.sources
      .createAlias($_aliasNameGenerator(db.articles.sourceId, db.sources.id));

  $$SourcesTableProcessedTableManager? get sourceId {
    if ($_item.sourceId == null) return null;
    final manager = $$SourcesTableTableManager($_db, $_db.sources)
        .filter((f) => f.id($_item.sourceId!));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$MediasTable, List<Media>> _mediasRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.medias,
          aliasName: $_aliasNameGenerator(db.articles.id, db.medias.articleId));

  $$MediasTableProcessedTableManager get mediasRefs {
    final manager = $$MediasTableTableManager($_db, $_db.medias)
        .filter((f) => f.articleId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_mediasRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ArticleCategoriesTable, List<ArticleCategory>>
      _articleCategoriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleCategories,
              aliasName: $_aliasNameGenerator(
                  db.articles.id, db.articleCategories.articleId));

  $$ArticleCategoriesTableProcessedTableManager get articleCategoriesRefs {
    final manager =
        $$ArticleCategoriesTableTableManager($_db, $_db.articleCategories)
            .filter((f) => f.articleId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_articleCategoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ArticleIndustriesTable, List<ArticleIndustry>>
      _articleIndustriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleIndustries,
              aliasName: $_aliasNameGenerator(
                  db.articles.id, db.articleIndustries.articleId));

  $$ArticleIndustriesTableProcessedTableManager get articleIndustriesRefs {
    final manager =
        $$ArticleIndustriesTableTableManager($_db, $_db.articleIndustries)
            .filter((f) => f.articleId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_articleIndustriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ArticleEntitiesTable, List<ArticleEntity>>
      _articleEntitiesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.articleEntities,
              aliasName: $_aliasNameGenerator(
                  db.articles.id, db.articleEntities.articleId));

  $$ArticleEntitiesTableProcessedTableManager get articleEntitiesRefs {
    final manager =
        $$ArticleEntitiesTableTableManager($_db, $_db.articleEntities)
            .filter((f) => f.articleId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_articleEntitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ArticlesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get href => $composableBuilder(
      column: $table.href, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sentimentOverallScore => $composableBuilder(
      column: $table.sentimentOverallScore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sentimentOverallPolarity => $composableBuilder(
      column: $table.sentimentOverallPolarity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDuplicate => $composableBuilder(
      column: $table.isDuplicate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPaywall => $composableBuilder(
      column: $table.isPaywall, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sentencesCount => $composableBuilder(
      column: $table.sentencesCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get paragraphsCount => $composableBuilder(
      column: $table.paragraphsCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wordsCount => $composableBuilder(
      column: $table.wordsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get charactersCount => $composableBuilder(
      column: $table.charactersCount,
      builder: (column) => ColumnFilters(column));

  $$AuthorsTableFilterComposer get authorId {
    final $$AuthorsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.authorId,
        referencedTable: $db.authors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AuthorsTableFilterComposer(
              $db: $db,
              $table: $db.authors,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SourcesTableFilterComposer get sourceId {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SourcesTableFilterComposer(
              $db: $db,
              $table: $db.sources,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> mediasRefs(
      Expression<bool> Function($$MediasTableFilterComposer f) f) {
    final $$MediasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medias,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediasTableFilterComposer(
              $db: $db,
              $table: $db.medias,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> articleCategoriesRefs(
      Expression<bool> Function($$ArticleCategoriesTableFilterComposer f) f) {
    final $$ArticleCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleCategories,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.articleCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> articleIndustriesRefs(
      Expression<bool> Function($$ArticleIndustriesTableFilterComposer f) f) {
    final $$ArticleIndustriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleIndustries,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleIndustriesTableFilterComposer(
              $db: $db,
              $table: $db.articleIndustries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> articleEntitiesRefs(
      Expression<bool> Function($$ArticleEntitiesTableFilterComposer f) f) {
    final $$ArticleEntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleEntities,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleEntitiesTableFilterComposer(
              $db: $db,
              $table: $db.articleEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ArticlesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get href => $composableBuilder(
      column: $table.href, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sentimentOverallScore => $composableBuilder(
      column: $table.sentimentOverallScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sentimentOverallPolarity => $composableBuilder(
      column: $table.sentimentOverallPolarity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDuplicate => $composableBuilder(
      column: $table.isDuplicate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPaywall => $composableBuilder(
      column: $table.isPaywall, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sentencesCount => $composableBuilder(
      column: $table.sentencesCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get paragraphsCount => $composableBuilder(
      column: $table.paragraphsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wordsCount => $composableBuilder(
      column: $table.wordsCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get charactersCount => $composableBuilder(
      column: $table.charactersCount,
      builder: (column) => ColumnOrderings(column));

  $$AuthorsTableOrderingComposer get authorId {
    final $$AuthorsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.authorId,
        referencedTable: $db.authors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AuthorsTableOrderingComposer(
              $db: $db,
              $table: $db.authors,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SourcesTableOrderingComposer get sourceId {
    final $$SourcesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SourcesTableOrderingComposer(
              $db: $db,
              $table: $db.sources,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get href =>
      $composableBuilder(column: $table.href, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<double> get sentimentOverallScore => $composableBuilder(
      column: $table.sentimentOverallScore, builder: (column) => column);

  GeneratedColumn<String> get sentimentOverallPolarity => $composableBuilder(
      column: $table.sentimentOverallPolarity, builder: (column) => column);

  GeneratedColumn<bool> get isDuplicate => $composableBuilder(
      column: $table.isDuplicate, builder: (column) => column);

  GeneratedColumn<bool> get isPaywall =>
      $composableBuilder(column: $table.isPaywall, builder: (column) => column);

  GeneratedColumn<int> get sentencesCount => $composableBuilder(
      column: $table.sentencesCount, builder: (column) => column);

  GeneratedColumn<int> get paragraphsCount => $composableBuilder(
      column: $table.paragraphsCount, builder: (column) => column);

  GeneratedColumn<int> get wordsCount => $composableBuilder(
      column: $table.wordsCount, builder: (column) => column);

  GeneratedColumn<int> get charactersCount => $composableBuilder(
      column: $table.charactersCount, builder: (column) => column);

  $$AuthorsTableAnnotationComposer get authorId {
    final $$AuthorsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.authorId,
        referencedTable: $db.authors,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AuthorsTableAnnotationComposer(
              $db: $db,
              $table: $db.authors,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SourcesTableAnnotationComposer get sourceId {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SourcesTableAnnotationComposer(
              $db: $db,
              $table: $db.sources,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> mediasRefs<T extends Object>(
      Expression<T> Function($$MediasTableAnnotationComposer a) f) {
    final $$MediasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medias,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediasTableAnnotationComposer(
              $db: $db,
              $table: $db.medias,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> articleCategoriesRefs<T extends Object>(
      Expression<T> Function($$ArticleCategoriesTableAnnotationComposer a) f) {
    final $$ArticleCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.articleCategories,
            getReferencedColumn: (t) => t.articleId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ArticleCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.articleCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> articleIndustriesRefs<T extends Object>(
      Expression<T> Function($$ArticleIndustriesTableAnnotationComposer a) f) {
    final $$ArticleIndustriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.articleIndustries,
            getReferencedColumn: (t) => t.articleId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ArticleIndustriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.articleIndustries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> articleEntitiesRefs<T extends Object>(
      Expression<T> Function($$ArticleEntitiesTableAnnotationComposer a) f) {
    final $$ArticleEntitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleEntities,
        getReferencedColumn: (t) => t.articleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleEntitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.articleEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ArticlesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticlesTable,
    Article,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableAnnotationComposer,
    $$ArticlesTableCreateCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder,
    (Article, $$ArticlesTableReferences),
    Article,
    PrefetchHooks Function(
        {bool authorId,
        bool sourceId,
        bool mediasRefs,
        bool articleCategoriesRefs,
        bool articleIndustriesRefs,
        bool articleEntitiesRefs})> {
  $$ArticlesTableTableManager(_$AppDatabase db, $ArticlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> href = const Value.absent(),
            Value<DateTime> publishedAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int?> authorId = const Value.absent(),
            Value<int?> sourceId = const Value.absent(),
            Value<double?> sentimentOverallScore = const Value.absent(),
            Value<String?> sentimentOverallPolarity = const Value.absent(),
            Value<bool> isDuplicate = const Value.absent(),
            Value<bool> isPaywall = const Value.absent(),
            Value<int?> sentencesCount = const Value.absent(),
            Value<int?> paragraphsCount = const Value.absent(),
            Value<int?> wordsCount = const Value.absent(),
            Value<int?> charactersCount = const Value.absent(),
          }) =>
              ArticlesCompanion(
            id: id,
            href: href,
            publishedAt: publishedAt,
            title: title,
            description: description,
            body: body,
            language: language,
            image: image,
            authorId: authorId,
            sourceId: sourceId,
            sentimentOverallScore: sentimentOverallScore,
            sentimentOverallPolarity: sentimentOverallPolarity,
            isDuplicate: isDuplicate,
            isPaywall: isPaywall,
            sentencesCount: sentencesCount,
            paragraphsCount: paragraphsCount,
            wordsCount: wordsCount,
            charactersCount: charactersCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String href,
            required DateTime publishedAt,
            required String title,
            Value<String?> description = const Value.absent(),
            required String body,
            required String language,
            Value<String?> image = const Value.absent(),
            Value<int?> authorId = const Value.absent(),
            Value<int?> sourceId = const Value.absent(),
            Value<double?> sentimentOverallScore = const Value.absent(),
            Value<String?> sentimentOverallPolarity = const Value.absent(),
            required bool isDuplicate,
            required bool isPaywall,
            Value<int?> sentencesCount = const Value.absent(),
            Value<int?> paragraphsCount = const Value.absent(),
            Value<int?> wordsCount = const Value.absent(),
            Value<int?> charactersCount = const Value.absent(),
          }) =>
              ArticlesCompanion.insert(
            id: id,
            href: href,
            publishedAt: publishedAt,
            title: title,
            description: description,
            body: body,
            language: language,
            image: image,
            authorId: authorId,
            sourceId: sourceId,
            sentimentOverallScore: sentimentOverallScore,
            sentimentOverallPolarity: sentimentOverallPolarity,
            isDuplicate: isDuplicate,
            isPaywall: isPaywall,
            sentencesCount: sentencesCount,
            paragraphsCount: paragraphsCount,
            wordsCount: wordsCount,
            charactersCount: charactersCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ArticlesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {authorId = false,
              sourceId = false,
              mediasRefs = false,
              articleCategoriesRefs = false,
              articleIndustriesRefs = false,
              articleEntitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (mediasRefs) db.medias,
                if (articleCategoriesRefs) db.articleCategories,
                if (articleIndustriesRefs) db.articleIndustries,
                if (articleEntitiesRefs) db.articleEntities
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (authorId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.authorId,
                    referencedTable:
                        $$ArticlesTableReferences._authorIdTable(db),
                    referencedColumn:
                        $$ArticlesTableReferences._authorIdTable(db).id,
                  ) as T;
                }
                if (sourceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sourceId,
                    referencedTable:
                        $$ArticlesTableReferences._sourceIdTable(db),
                    referencedColumn:
                        $$ArticlesTableReferences._sourceIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mediasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ArticlesTableReferences._mediasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ArticlesTableReferences(db, table, p0).mediasRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.articleId == item.id),
                        typedResults: items),
                  if (articleCategoriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ArticlesTableReferences
                            ._articleCategoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ArticlesTableReferences(db, table, p0)
                                .articleCategoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.articleId == item.id),
                        typedResults: items),
                  if (articleIndustriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ArticlesTableReferences
                            ._articleIndustriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ArticlesTableReferences(db, table, p0)
                                .articleIndustriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.articleId == item.id),
                        typedResults: items),
                  if (articleEntitiesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ArticlesTableReferences
                            ._articleEntitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ArticlesTableReferences(db, table, p0)
                                .articleEntitiesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.articleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ArticlesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticlesTable,
    Article,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableAnnotationComposer,
    $$ArticlesTableCreateCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder,
    (Article, $$ArticlesTableReferences),
    Article,
    PrefetchHooks Function(
        {bool authorId,
        bool sourceId,
        bool mediasRefs,
        bool articleCategoriesRefs,
        bool articleIndustriesRefs,
        bool articleEntitiesRefs})>;
typedef $$MediasTableCreateCompanionBuilder = MediasCompanion Function({
  Value<int> id,
  required String url,
  required String type,
  Value<String?> format,
  required int articleId,
});
typedef $$MediasTableUpdateCompanionBuilder = MediasCompanion Function({
  Value<int> id,
  Value<String> url,
  Value<String> type,
  Value<String?> format,
  Value<int> articleId,
});

final class $$MediasTableReferences
    extends BaseReferences<_$AppDatabase, $MediasTable, Media> {
  $$MediasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArticlesTable _articleIdTable(_$AppDatabase db) => db.articles
      .createAlias($_aliasNameGenerator(db.medias.articleId, db.articles.id));

  $$ArticlesTableProcessedTableManager get articleId {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.id($_item.articleId));
    final item = $_typedResult.readTableOrNull(_articleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MediasTableFilterComposer
    extends Composer<_$AppDatabase, $MediasTable> {
  $$MediasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnFilters(column));

  $$ArticlesTableFilterComposer get articleId {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediasTableOrderingComposer
    extends Composer<_$AppDatabase, $MediasTable> {
  $$MediasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  $$ArticlesTableOrderingComposer get articleId {
    final $$ArticlesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableOrderingComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediasTable> {
  $$MediasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  $$ArticlesTableAnnotationComposer get articleId {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MediasTable,
    Media,
    $$MediasTableFilterComposer,
    $$MediasTableOrderingComposer,
    $$MediasTableAnnotationComposer,
    $$MediasTableCreateCompanionBuilder,
    $$MediasTableUpdateCompanionBuilder,
    (Media, $$MediasTableReferences),
    Media,
    PrefetchHooks Function({bool articleId})> {
  $$MediasTableTableManager(_$AppDatabase db, $MediasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> format = const Value.absent(),
            Value<int> articleId = const Value.absent(),
          }) =>
              MediasCompanion(
            id: id,
            url: url,
            type: type,
            format: format,
            articleId: articleId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String url,
            required String type,
            Value<String?> format = const Value.absent(),
            required int articleId,
          }) =>
              MediasCompanion.insert(
            id: id,
            url: url,
            type: type,
            format: format,
            articleId: articleId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$MediasTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({articleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (articleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.articleId,
                    referencedTable:
                        $$MediasTableReferences._articleIdTable(db),
                    referencedColumn:
                        $$MediasTableReferences._articleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MediasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MediasTable,
    Media,
    $$MediasTableFilterComposer,
    $$MediasTableOrderingComposer,
    $$MediasTableAnnotationComposer,
    $$MediasTableCreateCompanionBuilder,
    $$MediasTableUpdateCompanionBuilder,
    (Media, $$MediasTableReferences),
    Media,
    PrefetchHooks Function({bool articleId})>;
typedef $$ArticleCategoriesTableCreateCompanionBuilder
    = ArticleCategoriesCompanion Function({
  required int articleId,
  required String categoryId,
  Value<int> rowid,
});
typedef $$ArticleCategoriesTableUpdateCompanionBuilder
    = ArticleCategoriesCompanion Function({
  Value<int> articleId,
  Value<String> categoryId,
  Value<int> rowid,
});

final class $$ArticleCategoriesTableReferences extends BaseReferences<
    _$AppDatabase, $ArticleCategoriesTable, ArticleCategory> {
  $$ArticleCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ArticlesTable _articleIdTable(_$AppDatabase db) =>
      db.articles.createAlias(
          $_aliasNameGenerator(db.articleCategories.articleId, db.articles.id));

  $$ArticlesTableProcessedTableManager get articleId {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.id($_item.articleId));
    final item = $_typedResult.readTableOrNull(_articleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.articleCategories.categoryId, db.categories.id));

  $$CategoriesTableProcessedTableManager get categoryId {
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id($_item.categoryId));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ArticleCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticleCategoriesTable> {
  $$ArticleCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableFilterComposer get articleId {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticleCategoriesTable> {
  $$ArticleCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableOrderingComposer get articleId {
    final $$ArticlesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableOrderingComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticleCategoriesTable> {
  $$ArticleCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableAnnotationComposer get articleId {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticleCategoriesTable,
    ArticleCategory,
    $$ArticleCategoriesTableFilterComposer,
    $$ArticleCategoriesTableOrderingComposer,
    $$ArticleCategoriesTableAnnotationComposer,
    $$ArticleCategoriesTableCreateCompanionBuilder,
    $$ArticleCategoriesTableUpdateCompanionBuilder,
    (ArticleCategory, $$ArticleCategoriesTableReferences),
    ArticleCategory,
    PrefetchHooks Function({bool articleId, bool categoryId})> {
  $$ArticleCategoriesTableTableManager(
      _$AppDatabase db, $ArticleCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticleCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticleCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticleCategoriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> articleId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleCategoriesCompanion(
            articleId: articleId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int articleId,
            required String categoryId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleCategoriesCompanion.insert(
            articleId: articleId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ArticleCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (articleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.articleId,
                    referencedTable:
                        $$ArticleCategoriesTableReferences._articleIdTable(db),
                    referencedColumn: $$ArticleCategoriesTableReferences
                        ._articleIdTable(db)
                        .id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ArticleCategoriesTableReferences._categoryIdTable(db),
                    referencedColumn: $$ArticleCategoriesTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ArticleCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticleCategoriesTable,
    ArticleCategory,
    $$ArticleCategoriesTableFilterComposer,
    $$ArticleCategoriesTableOrderingComposer,
    $$ArticleCategoriesTableAnnotationComposer,
    $$ArticleCategoriesTableCreateCompanionBuilder,
    $$ArticleCategoriesTableUpdateCompanionBuilder,
    (ArticleCategory, $$ArticleCategoriesTableReferences),
    ArticleCategory,
    PrefetchHooks Function({bool articleId, bool categoryId})>;
typedef $$ArticleIndustriesTableCreateCompanionBuilder
    = ArticleIndustriesCompanion Function({
  required int articleId,
  required int industryId,
  Value<int> rowid,
});
typedef $$ArticleIndustriesTableUpdateCompanionBuilder
    = ArticleIndustriesCompanion Function({
  Value<int> articleId,
  Value<int> industryId,
  Value<int> rowid,
});

final class $$ArticleIndustriesTableReferences extends BaseReferences<
    _$AppDatabase, $ArticleIndustriesTable, ArticleIndustry> {
  $$ArticleIndustriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ArticlesTable _articleIdTable(_$AppDatabase db) =>
      db.articles.createAlias(
          $_aliasNameGenerator(db.articleIndustries.articleId, db.articles.id));

  $$ArticlesTableProcessedTableManager get articleId {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.id($_item.articleId));
    final item = $_typedResult.readTableOrNull(_articleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $IndustriesTable _industryIdTable(_$AppDatabase db) =>
      db.industries.createAlias($_aliasNameGenerator(
          db.articleIndustries.industryId, db.industries.id));

  $$IndustriesTableProcessedTableManager get industryId {
    final manager = $$IndustriesTableTableManager($_db, $_db.industries)
        .filter((f) => f.id($_item.industryId));
    final item = $_typedResult.readTableOrNull(_industryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ArticleIndustriesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticleIndustriesTable> {
  $$ArticleIndustriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableFilterComposer get articleId {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IndustriesTableFilterComposer get industryId {
    final $$IndustriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.industryId,
        referencedTable: $db.industries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IndustriesTableFilterComposer(
              $db: $db,
              $table: $db.industries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleIndustriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticleIndustriesTable> {
  $$ArticleIndustriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableOrderingComposer get articleId {
    final $$ArticlesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableOrderingComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IndustriesTableOrderingComposer get industryId {
    final $$IndustriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.industryId,
        referencedTable: $db.industries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IndustriesTableOrderingComposer(
              $db: $db,
              $table: $db.industries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleIndustriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticleIndustriesTable> {
  $$ArticleIndustriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableAnnotationComposer get articleId {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IndustriesTableAnnotationComposer get industryId {
    final $$IndustriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.industryId,
        referencedTable: $db.industries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IndustriesTableAnnotationComposer(
              $db: $db,
              $table: $db.industries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleIndustriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticleIndustriesTable,
    ArticleIndustry,
    $$ArticleIndustriesTableFilterComposer,
    $$ArticleIndustriesTableOrderingComposer,
    $$ArticleIndustriesTableAnnotationComposer,
    $$ArticleIndustriesTableCreateCompanionBuilder,
    $$ArticleIndustriesTableUpdateCompanionBuilder,
    (ArticleIndustry, $$ArticleIndustriesTableReferences),
    ArticleIndustry,
    PrefetchHooks Function({bool articleId, bool industryId})> {
  $$ArticleIndustriesTableTableManager(
      _$AppDatabase db, $ArticleIndustriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticleIndustriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticleIndustriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticleIndustriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> articleId = const Value.absent(),
            Value<int> industryId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleIndustriesCompanion(
            articleId: articleId,
            industryId: industryId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int articleId,
            required int industryId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleIndustriesCompanion.insert(
            articleId: articleId,
            industryId: industryId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ArticleIndustriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleId = false, industryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (articleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.articleId,
                    referencedTable:
                        $$ArticleIndustriesTableReferences._articleIdTable(db),
                    referencedColumn: $$ArticleIndustriesTableReferences
                        ._articleIdTable(db)
                        .id,
                  ) as T;
                }
                if (industryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.industryId,
                    referencedTable:
                        $$ArticleIndustriesTableReferences._industryIdTable(db),
                    referencedColumn: $$ArticleIndustriesTableReferences
                        ._industryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ArticleIndustriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticleIndustriesTable,
    ArticleIndustry,
    $$ArticleIndustriesTableFilterComposer,
    $$ArticleIndustriesTableOrderingComposer,
    $$ArticleIndustriesTableAnnotationComposer,
    $$ArticleIndustriesTableCreateCompanionBuilder,
    $$ArticleIndustriesTableUpdateCompanionBuilder,
    (ArticleIndustry, $$ArticleIndustriesTableReferences),
    ArticleIndustry,
    PrefetchHooks Function({bool articleId, bool industryId})>;
typedef $$ArticleEntitiesTableCreateCompanionBuilder = ArticleEntitiesCompanion
    Function({
  required int articleId,
  required int entityId,
  Value<int> rowid,
});
typedef $$ArticleEntitiesTableUpdateCompanionBuilder = ArticleEntitiesCompanion
    Function({
  Value<int> articleId,
  Value<int> entityId,
  Value<int> rowid,
});

final class $$ArticleEntitiesTableReferences extends BaseReferences<
    _$AppDatabase, $ArticleEntitiesTable, ArticleEntity> {
  $$ArticleEntitiesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ArticlesTable _articleIdTable(_$AppDatabase db) =>
      db.articles.createAlias(
          $_aliasNameGenerator(db.articleEntities.articleId, db.articles.id));

  $$ArticlesTableProcessedTableManager get articleId {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles)
        .filter((f) => f.id($_item.articleId));
    final item = $_typedResult.readTableOrNull(_articleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $EntitiesTable _entityIdTable(_$AppDatabase db) =>
      db.entities.createAlias(
          $_aliasNameGenerator(db.articleEntities.entityId, db.entities.id));

  $$EntitiesTableProcessedTableManager get entityId {
    final manager = $$EntitiesTableTableManager($_db, $_db.entities)
        .filter((f) => f.id($_item.entityId));
    final item = $_typedResult.readTableOrNull(_entityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ArticleEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticleEntitiesTable> {
  $$ArticleEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableFilterComposer get articleId {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableFilterComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EntitiesTableFilterComposer get entityId {
    final $$EntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entityId,
        referencedTable: $db.entities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EntitiesTableFilterComposer(
              $db: $db,
              $table: $db.entities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticleEntitiesTable> {
  $$ArticleEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableOrderingComposer get articleId {
    final $$ArticlesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableOrderingComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EntitiesTableOrderingComposer get entityId {
    final $$EntitiesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entityId,
        referencedTable: $db.entities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EntitiesTableOrderingComposer(
              $db: $db,
              $table: $db.entities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticleEntitiesTable> {
  $$ArticleEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArticlesTableAnnotationComposer get articleId {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.articleId,
        referencedTable: $db.articles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticlesTableAnnotationComposer(
              $db: $db,
              $table: $db.articles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EntitiesTableAnnotationComposer get entityId {
    final $$EntitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entityId,
        referencedTable: $db.entities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EntitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.entities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticleEntitiesTable,
    ArticleEntity,
    $$ArticleEntitiesTableFilterComposer,
    $$ArticleEntitiesTableOrderingComposer,
    $$ArticleEntitiesTableAnnotationComposer,
    $$ArticleEntitiesTableCreateCompanionBuilder,
    $$ArticleEntitiesTableUpdateCompanionBuilder,
    (ArticleEntity, $$ArticleEntitiesTableReferences),
    ArticleEntity,
    PrefetchHooks Function({bool articleId, bool entityId})> {
  $$ArticleEntitiesTableTableManager(
      _$AppDatabase db, $ArticleEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticleEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticleEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticleEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> articleId = const Value.absent(),
            Value<int> entityId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleEntitiesCompanion(
            articleId: articleId,
            entityId: entityId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int articleId,
            required int entityId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleEntitiesCompanion.insert(
            articleId: articleId,
            entityId: entityId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ArticleEntitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleId = false, entityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (articleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.articleId,
                    referencedTable:
                        $$ArticleEntitiesTableReferences._articleIdTable(db),
                    referencedColumn:
                        $$ArticleEntitiesTableReferences._articleIdTable(db).id,
                  ) as T;
                }
                if (entityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.entityId,
                    referencedTable:
                        $$ArticleEntitiesTableReferences._entityIdTable(db),
                    referencedColumn:
                        $$ArticleEntitiesTableReferences._entityIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ArticleEntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticleEntitiesTable,
    ArticleEntity,
    $$ArticleEntitiesTableFilterComposer,
    $$ArticleEntitiesTableOrderingComposer,
    $$ArticleEntitiesTableAnnotationComposer,
    $$ArticleEntitiesTableCreateCompanionBuilder,
    $$ArticleEntitiesTableUpdateCompanionBuilder,
    (ArticleEntity, $$ArticleEntitiesTableReferences),
    ArticleEntity,
    PrefetchHooks Function({bool articleId, bool entityId})>;
typedef $$IntegrationControlTableCreateCompanionBuilder
    = IntegrationControlCompanion Function({
  Value<int> id,
  Value<DateTime?> lastAutoSyncAt,
  Value<String?> responseJson,
});
typedef $$IntegrationControlTableUpdateCompanionBuilder
    = IntegrationControlCompanion Function({
  Value<int> id,
  Value<DateTime?> lastAutoSyncAt,
  Value<String?> responseJson,
});

class $$IntegrationControlTableFilterComposer
    extends Composer<_$AppDatabase, $IntegrationControlTable> {
  $$IntegrationControlTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAutoSyncAt => $composableBuilder(
      column: $table.lastAutoSyncAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get responseJson => $composableBuilder(
      column: $table.responseJson, builder: (column) => ColumnFilters(column));
}

class $$IntegrationControlTableOrderingComposer
    extends Composer<_$AppDatabase, $IntegrationControlTable> {
  $$IntegrationControlTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAutoSyncAt => $composableBuilder(
      column: $table.lastAutoSyncAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get responseJson => $composableBuilder(
      column: $table.responseJson,
      builder: (column) => ColumnOrderings(column));
}

class $$IntegrationControlTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntegrationControlTable> {
  $$IntegrationControlTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAutoSyncAt => $composableBuilder(
      column: $table.lastAutoSyncAt, builder: (column) => column);

  GeneratedColumn<String> get responseJson => $composableBuilder(
      column: $table.responseJson, builder: (column) => column);
}

class $$IntegrationControlTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IntegrationControlTable,
    IntegrationControlData,
    $$IntegrationControlTableFilterComposer,
    $$IntegrationControlTableOrderingComposer,
    $$IntegrationControlTableAnnotationComposer,
    $$IntegrationControlTableCreateCompanionBuilder,
    $$IntegrationControlTableUpdateCompanionBuilder,
    (
      IntegrationControlData,
      BaseReferences<_$AppDatabase, $IntegrationControlTable,
          IntegrationControlData>
    ),
    IntegrationControlData,
    PrefetchHooks Function()> {
  $$IntegrationControlTableTableManager(
      _$AppDatabase db, $IntegrationControlTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntegrationControlTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntegrationControlTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntegrationControlTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime?> lastAutoSyncAt = const Value.absent(),
            Value<String?> responseJson = const Value.absent(),
          }) =>
              IntegrationControlCompanion(
            id: id,
            lastAutoSyncAt: lastAutoSyncAt,
            responseJson: responseJson,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime?> lastAutoSyncAt = const Value.absent(),
            Value<String?> responseJson = const Value.absent(),
          }) =>
              IntegrationControlCompanion.insert(
            id: id,
            lastAutoSyncAt: lastAutoSyncAt,
            responseJson: responseJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IntegrationControlTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IntegrationControlTable,
    IntegrationControlData,
    $$IntegrationControlTableFilterComposer,
    $$IntegrationControlTableOrderingComposer,
    $$IntegrationControlTableAnnotationComposer,
    $$IntegrationControlTableCreateCompanionBuilder,
    $$IntegrationControlTableUpdateCompanionBuilder,
    (
      IntegrationControlData,
      BaseReferences<_$AppDatabase, $IntegrationControlTable,
          IntegrationControlData>
    ),
    IntegrationControlData,
    PrefetchHooks Function()>;
typedef $$SyncLogsTableCreateCompanionBuilder = SyncLogsCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required String type,
  required String status,
  required String message,
  required int articlesProcessed,
  required int articlesInserted,
  required int articlesSkipped,
  Value<String?> errorDetails,
  Value<int?> durationMs,
});
typedef $$SyncLogsTableUpdateCompanionBuilder = SyncLogsCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<String> type,
  Value<String> status,
  Value<String> message,
  Value<int> articlesProcessed,
  Value<int> articlesInserted,
  Value<int> articlesSkipped,
  Value<String?> errorDetails,
  Value<int?> durationMs,
});

class $$SyncLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncLogsTable> {
  $$SyncLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get articlesProcessed => $composableBuilder(
      column: $table.articlesProcessed,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get articlesInserted => $composableBuilder(
      column: $table.articlesInserted,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get articlesSkipped => $composableBuilder(
      column: $table.articlesSkipped,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorDetails => $composableBuilder(
      column: $table.errorDetails, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => ColumnFilters(column));
}

class $$SyncLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncLogsTable> {
  $$SyncLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get articlesProcessed => $composableBuilder(
      column: $table.articlesProcessed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get articlesInserted => $composableBuilder(
      column: $table.articlesInserted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get articlesSkipped => $composableBuilder(
      column: $table.articlesSkipped,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorDetails => $composableBuilder(
      column: $table.errorDetails,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => ColumnOrderings(column));
}

class $$SyncLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncLogsTable> {
  $$SyncLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<int> get articlesProcessed => $composableBuilder(
      column: $table.articlesProcessed, builder: (column) => column);

  GeneratedColumn<int> get articlesInserted => $composableBuilder(
      column: $table.articlesInserted, builder: (column) => column);

  GeneratedColumn<int> get articlesSkipped => $composableBuilder(
      column: $table.articlesSkipped, builder: (column) => column);

  GeneratedColumn<String> get errorDetails => $composableBuilder(
      column: $table.errorDetails, builder: (column) => column);

  GeneratedColumn<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => column);
}

class $$SyncLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncLogsTable,
    SyncLog,
    $$SyncLogsTableFilterComposer,
    $$SyncLogsTableOrderingComposer,
    $$SyncLogsTableAnnotationComposer,
    $$SyncLogsTableCreateCompanionBuilder,
    $$SyncLogsTableUpdateCompanionBuilder,
    (SyncLog, BaseReferences<_$AppDatabase, $SyncLogsTable, SyncLog>),
    SyncLog,
    PrefetchHooks Function()> {
  $$SyncLogsTableTableManager(_$AppDatabase db, $SyncLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<int> articlesProcessed = const Value.absent(),
            Value<int> articlesInserted = const Value.absent(),
            Value<int> articlesSkipped = const Value.absent(),
            Value<String?> errorDetails = const Value.absent(),
            Value<int?> durationMs = const Value.absent(),
          }) =>
              SyncLogsCompanion(
            id: id,
            timestamp: timestamp,
            type: type,
            status: status,
            message: message,
            articlesProcessed: articlesProcessed,
            articlesInserted: articlesInserted,
            articlesSkipped: articlesSkipped,
            errorDetails: errorDetails,
            durationMs: durationMs,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required String type,
            required String status,
            required String message,
            required int articlesProcessed,
            required int articlesInserted,
            required int articlesSkipped,
            Value<String?> errorDetails = const Value.absent(),
            Value<int?> durationMs = const Value.absent(),
          }) =>
              SyncLogsCompanion.insert(
            id: id,
            timestamp: timestamp,
            type: type,
            status: status,
            message: message,
            articlesProcessed: articlesProcessed,
            articlesInserted: articlesInserted,
            articlesSkipped: articlesSkipped,
            errorDetails: errorDetails,
            durationMs: durationMs,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncLogsTable,
    SyncLog,
    $$SyncLogsTableFilterComposer,
    $$SyncLogsTableOrderingComposer,
    $$SyncLogsTableAnnotationComposer,
    $$SyncLogsTableCreateCompanionBuilder,
    $$SyncLogsTableUpdateCompanionBuilder,
    (SyncLog, BaseReferences<_$AppDatabase, $SyncLogsTable, SyncLog>),
    SyncLog,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NewsTableTableTableManager get newsTable =>
      $$NewsTableTableTableManager(_db, _db.newsTable);
  $$AuthorsTableTableManager get authors =>
      $$AuthorsTableTableManager(_db, _db.authors);
  $$SourcesTableTableManager get sources =>
      $$SourcesTableTableManager(_db, _db.sources);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$IndustriesTableTableManager get industries =>
      $$IndustriesTableTableManager(_db, _db.industries);
  $$EntitiesTableTableManager get entities =>
      $$EntitiesTableTableManager(_db, _db.entities);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
  $$MediasTableTableManager get medias =>
      $$MediasTableTableManager(_db, _db.medias);
  $$ArticleCategoriesTableTableManager get articleCategories =>
      $$ArticleCategoriesTableTableManager(_db, _db.articleCategories);
  $$ArticleIndustriesTableTableManager get articleIndustries =>
      $$ArticleIndustriesTableTableManager(_db, _db.articleIndustries);
  $$ArticleEntitiesTableTableManager get articleEntities =>
      $$ArticleEntitiesTableTableManager(_db, _db.articleEntities);
  $$IntegrationControlTableTableManager get integrationControl =>
      $$IntegrationControlTableTableManager(_db, _db.integrationControl);
  $$SyncLogsTableTableManager get syncLogs =>
      $$SyncLogsTableTableManager(_db, _db.syncLogs);
}
