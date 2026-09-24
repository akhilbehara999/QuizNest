import 'package:drift/drift.dart';
import 'connection/connection.dart' as impl;

part 'app_database.g.dart';

@DataClassName('QuestionEntry')
class Questions extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text()();
  TextColumn get language => text()();
  TextColumn get ageGroup => text()();
  TextColumn get difficulty => text()();
  TextColumn get questionText => text()();
  TextColumn get optionsJson => text()();
  IntColumn get correctOptionIndex => integer()();
  TextColumn get explanation => text()();
  TextColumn get category => text()();
  TextColumn get source => text()();
  IntColumn get packVersion => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SubjectEntry')
class Subjects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get iconName => text()();
  IntColumn get displayOrder => integer()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('QuestionPackEntry')
class QuestionPacks extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text()();
  IntColumn get version => integer()();
  IntColumn get questionCount => integer()();
  TextColumn get checksum => text().nullable()();
  DateTimeColumn get syncedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('UserProfileEntry')
class UserProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get ageGroup => text()();
  TextColumn get selectedSubjectsJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('QuizSessionEntry')
class QuizSessions extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text()();
  TextColumn get ageGroup => text()();
  IntColumn get totalQuestions => integer()();
  IntColumn get score => integer().withDefault(const Constant(0))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('QuizAnswerEntry')
class QuizAnswers extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  TextColumn get questionId => text()();
  IntColumn get selectedOptionIndex => integer()();
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get answeredAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LearningProgressEntry')
class LearningProgress extends Table {
  TextColumn get subjectId => text()();
  IntColumn get totalAnswered => integer().withDefault(const Constant(0))();
  IntColumn get totalCorrect => integer().withDefault(const Constant(0))();
  RealColumn get accuracy => real().withDefault(const Constant(0.0))();
  DateTimeColumn get lastPlayedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {subjectId};
}

@DataClassName('SyncMetadataEntry')
class SyncMetadata extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [
  Questions,
  Subjects,
  QuestionPacks,
  UserProfiles,
  QuizSessions,
  QuizAnswers,
  LearningProgress,
  SyncMetadata,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? impl.openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
      );
}
