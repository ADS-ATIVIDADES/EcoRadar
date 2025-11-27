import 'package:drift/drift.dart';

// Authors table
class Authors extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Sources table
class Sources extends Table {
  IntColumn get id => integer()();
  TextColumn get domain => text()();
  TextColumn get homePageUrl => text()();
  TextColumn get type => text()();
  IntColumn get rankingsOpr => integer().nullable()();
  TextColumn get locationCountryName => text().nullable()();
  TextColumn get locationCountryCode => text().nullable()();
  TextColumn get favicon => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Categories table
class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get score => real().nullable()();
  TextColumn get taxonomy => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Industries table
class Industries extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Entities table
class Entities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get types => text()();
  TextColumn get language => text().nullable()();
  IntColumn get frequency => integer().nullable()();
  TextColumn get wikipediaUrl => text().nullable()();
  TextColumn get wikidataUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Medias table
class Medias extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get url => text()();
  TextColumn get type => text()();
  TextColumn get format => text().nullable()();
  IntColumn get articleId => integer().references(Articles, #id)();
}

// Articles table
class Articles extends Table {
  IntColumn get id => integer()();
  TextColumn get href => text()();
  DateTimeColumn get publishedAt => dateTime()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get body => text()();
  TextColumn get language => text()();
  TextColumn get image => text().nullable()();
  IntColumn get authorId => integer().nullable().references(Authors, #id)();
  IntColumn get sourceId => integer().nullable().references(Sources, #id)();
  RealColumn get sentimentOverallScore => real().nullable()();
  TextColumn get sentimentOverallPolarity => text().nullable()();
  BoolColumn get isDuplicate => boolean()();
  BoolColumn get isPaywall => boolean()();
  IntColumn get sentencesCount => integer().nullable()();
  IntColumn get paragraphsCount => integer().nullable()();
  IntColumn get wordsCount => integer().nullable()();
  IntColumn get charactersCount => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Junction tables for many-to-many relationships
class ArticleCategories extends Table {
  IntColumn get articleId => integer().references(Articles, #id)();
  TextColumn get categoryId => text().references(Categories, #id)();

  @override
  Set<Column> get primaryKey => {articleId, categoryId};
}

class ArticleIndustries extends Table {
  IntColumn get articleId => integer().references(Articles, #id)();
  IntColumn get industryId => integer().references(Industries, #id)();

  @override
  Set<Column> get primaryKey => {articleId, industryId};
}

class ArticleEntities extends Table {
  IntColumn get articleId => integer().references(Articles, #id)();
  IntColumn get entityId => integer().references(Entities, #id)();

  @override
  Set<Column> get primaryKey => {articleId, entityId};
}

// Integration control table
class IntegrationControl extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get lastAutoSyncAt => dateTime().nullable()();
  TextColumn get responseJson => text().nullable()();
}

// Sync logs table for detailed logging
class SyncLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get type => text()(); // 'auto' or 'manual'
  TextColumn get status => text()(); // 'success', 'error', 'partial'
  TextColumn get message => text()();
  IntColumn get articlesProcessed => integer()();
  IntColumn get articlesInserted => integer()();
  IntColumn get articlesSkipped => integer()();
  TextColumn get errorDetails => text().nullable()();
  IntColumn get durationMs =>
      integer().nullable()(); // Duration in milliseconds
}

// Legacy table for migration
class NewsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
}
