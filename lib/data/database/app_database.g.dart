// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, QuestionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageGroupMeta = const VerificationMeta(
    'ageGroup',
  );
  @override
  late final GeneratedColumn<String> ageGroup = GeneratedColumn<String>(
    'age_group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionTextMeta = const VerificationMeta(
    'questionText',
  );
  @override
  late final GeneratedColumn<String> questionText = GeneratedColumn<String>(
    'question_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _optionsJsonMeta = const VerificationMeta(
    'optionsJson',
  );
  @override
  late final GeneratedColumn<String> optionsJson = GeneratedColumn<String>(
    'options_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctOptionIndexMeta =
      const VerificationMeta('correctOptionIndex');
  @override
  late final GeneratedColumn<int> correctOptionIndex = GeneratedColumn<int>(
    'correct_option_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packVersionMeta = const VerificationMeta(
    'packVersion',
  );
  @override
  late final GeneratedColumn<int> packVersion = GeneratedColumn<int>(
    'pack_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    language,
    ageGroup,
    difficulty,
    questionText,
    optionsJson,
    correctOptionIndex,
    explanation,
    category,
    source,
    packVersion,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('age_group')) {
      context.handle(
        _ageGroupMeta,
        ageGroup.isAcceptableOrUnknown(data['age_group']!, _ageGroupMeta),
      );
    } else if (isInserting) {
      context.missing(_ageGroupMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('question_text')) {
      context.handle(
        _questionTextMeta,
        questionText.isAcceptableOrUnknown(
          data['question_text']!,
          _questionTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_questionTextMeta);
    }
    if (data.containsKey('options_json')) {
      context.handle(
        _optionsJsonMeta,
        optionsJson.isAcceptableOrUnknown(
          data['options_json']!,
          _optionsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_optionsJsonMeta);
    }
    if (data.containsKey('correct_option_index')) {
      context.handle(
        _correctOptionIndexMeta,
        correctOptionIndex.isAcceptableOrUnknown(
          data['correct_option_index']!,
          _correctOptionIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctOptionIndexMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('pack_version')) {
      context.handle(
        _packVersionMeta,
        packVersion.isAcceptableOrUnknown(
          data['pack_version']!,
          _packVersionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      ageGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_group'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      questionText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_text'],
      )!,
      optionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}options_json'],
      )!,
      correctOptionIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}correct_option_index'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      packVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pack_version'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class QuestionEntry extends DataClass implements Insertable<QuestionEntry> {
  final String id;
  final String subjectId;
  final String language;
  final String ageGroup;
  final String difficulty;
  final String questionText;
  final String optionsJson;
  final int correctOptionIndex;
  final String explanation;
  final String category;
  final String source;
  final int packVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  const QuestionEntry({
    required this.id,
    required this.subjectId,
    required this.language,
    required this.ageGroup,
    required this.difficulty,
    required this.questionText,
    required this.optionsJson,
    required this.correctOptionIndex,
    required this.explanation,
    required this.category,
    required this.source,
    required this.packVersion,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['language'] = Variable<String>(language);
    map['age_group'] = Variable<String>(ageGroup);
    map['difficulty'] = Variable<String>(difficulty);
    map['question_text'] = Variable<String>(questionText);
    map['options_json'] = Variable<String>(optionsJson);
    map['correct_option_index'] = Variable<int>(correctOptionIndex);
    map['explanation'] = Variable<String>(explanation);
    map['category'] = Variable<String>(category);
    map['source'] = Variable<String>(source);
    map['pack_version'] = Variable<int>(packVersion);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      language: Value(language),
      ageGroup: Value(ageGroup),
      difficulty: Value(difficulty),
      questionText: Value(questionText),
      optionsJson: Value(optionsJson),
      correctOptionIndex: Value(correctOptionIndex),
      explanation: Value(explanation),
      category: Value(category),
      source: Value(source),
      packVersion: Value(packVersion),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory QuestionEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionEntry(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      language: serializer.fromJson<String>(json['language']),
      ageGroup: serializer.fromJson<String>(json['ageGroup']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      questionText: serializer.fromJson<String>(json['questionText']),
      optionsJson: serializer.fromJson<String>(json['optionsJson']),
      correctOptionIndex: serializer.fromJson<int>(json['correctOptionIndex']),
      explanation: serializer.fromJson<String>(json['explanation']),
      category: serializer.fromJson<String>(json['category']),
      source: serializer.fromJson<String>(json['source']),
      packVersion: serializer.fromJson<int>(json['packVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'language': serializer.toJson<String>(language),
      'ageGroup': serializer.toJson<String>(ageGroup),
      'difficulty': serializer.toJson<String>(difficulty),
      'questionText': serializer.toJson<String>(questionText),
      'optionsJson': serializer.toJson<String>(optionsJson),
      'correctOptionIndex': serializer.toJson<int>(correctOptionIndex),
      'explanation': serializer.toJson<String>(explanation),
      'category': serializer.toJson<String>(category),
      'source': serializer.toJson<String>(source),
      'packVersion': serializer.toJson<int>(packVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  QuestionEntry copyWith({
    String? id,
    String? subjectId,
    String? language,
    String? ageGroup,
    String? difficulty,
    String? questionText,
    String? optionsJson,
    int? correctOptionIndex,
    String? explanation,
    String? category,
    String? source,
    int? packVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => QuestionEntry(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    language: language ?? this.language,
    ageGroup: ageGroup ?? this.ageGroup,
    difficulty: difficulty ?? this.difficulty,
    questionText: questionText ?? this.questionText,
    optionsJson: optionsJson ?? this.optionsJson,
    correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
    explanation: explanation ?? this.explanation,
    category: category ?? this.category,
    source: source ?? this.source,
    packVersion: packVersion ?? this.packVersion,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  QuestionEntry copyWithCompanion(QuestionsCompanion data) {
    return QuestionEntry(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      language: data.language.present ? data.language.value : this.language,
      ageGroup: data.ageGroup.present ? data.ageGroup.value : this.ageGroup,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      questionText: data.questionText.present
          ? data.questionText.value
          : this.questionText,
      optionsJson: data.optionsJson.present
          ? data.optionsJson.value
          : this.optionsJson,
      correctOptionIndex: data.correctOptionIndex.present
          ? data.correctOptionIndex.value
          : this.correctOptionIndex,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      category: data.category.present ? data.category.value : this.category,
      source: data.source.present ? data.source.value : this.source,
      packVersion: data.packVersion.present
          ? data.packVersion.value
          : this.packVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionEntry(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('language: $language, ')
          ..write('ageGroup: $ageGroup, ')
          ..write('difficulty: $difficulty, ')
          ..write('questionText: $questionText, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctOptionIndex: $correctOptionIndex, ')
          ..write('explanation: $explanation, ')
          ..write('category: $category, ')
          ..write('source: $source, ')
          ..write('packVersion: $packVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    language,
    ageGroup,
    difficulty,
    questionText,
    optionsJson,
    correctOptionIndex,
    explanation,
    category,
    source,
    packVersion,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionEntry &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.language == this.language &&
          other.ageGroup == this.ageGroup &&
          other.difficulty == this.difficulty &&
          other.questionText == this.questionText &&
          other.optionsJson == this.optionsJson &&
          other.correctOptionIndex == this.correctOptionIndex &&
          other.explanation == this.explanation &&
          other.category == this.category &&
          other.source == this.source &&
          other.packVersion == this.packVersion &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuestionsCompanion extends UpdateCompanion<QuestionEntry> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<String> language;
  final Value<String> ageGroup;
  final Value<String> difficulty;
  final Value<String> questionText;
  final Value<String> optionsJson;
  final Value<int> correctOptionIndex;
  final Value<String> explanation;
  final Value<String> category;
  final Value<String> source;
  final Value<int> packVersion;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.language = const Value.absent(),
    this.ageGroup = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.questionText = const Value.absent(),
    this.optionsJson = const Value.absent(),
    this.correctOptionIndex = const Value.absent(),
    this.explanation = const Value.absent(),
    this.category = const Value.absent(),
    this.source = const Value.absent(),
    this.packVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionsCompanion.insert({
    required String id,
    required String subjectId,
    required String language,
    required String ageGroup,
    required String difficulty,
    required String questionText,
    required String optionsJson,
    required int correctOptionIndex,
    required String explanation,
    required String category,
    required String source,
    this.packVersion = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       language = Value(language),
       ageGroup = Value(ageGroup),
       difficulty = Value(difficulty),
       questionText = Value(questionText),
       optionsJson = Value(optionsJson),
       correctOptionIndex = Value(correctOptionIndex),
       explanation = Value(explanation),
       category = Value(category),
       source = Value(source),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<QuestionEntry> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<String>? language,
    Expression<String>? ageGroup,
    Expression<String>? difficulty,
    Expression<String>? questionText,
    Expression<String>? optionsJson,
    Expression<int>? correctOptionIndex,
    Expression<String>? explanation,
    Expression<String>? category,
    Expression<String>? source,
    Expression<int>? packVersion,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (language != null) 'language': language,
      if (ageGroup != null) 'age_group': ageGroup,
      if (difficulty != null) 'difficulty': difficulty,
      if (questionText != null) 'question_text': questionText,
      if (optionsJson != null) 'options_json': optionsJson,
      if (correctOptionIndex != null)
        'correct_option_index': correctOptionIndex,
      if (explanation != null) 'explanation': explanation,
      if (category != null) 'category': category,
      if (source != null) 'source': source,
      if (packVersion != null) 'pack_version': packVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionsCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<String>? language,
    Value<String>? ageGroup,
    Value<String>? difficulty,
    Value<String>? questionText,
    Value<String>? optionsJson,
    Value<int>? correctOptionIndex,
    Value<String>? explanation,
    Value<String>? category,
    Value<String>? source,
    Value<int>? packVersion,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return QuestionsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      language: language ?? this.language,
      ageGroup: ageGroup ?? this.ageGroup,
      difficulty: difficulty ?? this.difficulty,
      questionText: questionText ?? this.questionText,
      optionsJson: optionsJson ?? this.optionsJson,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
      category: category ?? this.category,
      source: source ?? this.source,
      packVersion: packVersion ?? this.packVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (ageGroup.present) {
      map['age_group'] = Variable<String>(ageGroup.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (questionText.present) {
      map['question_text'] = Variable<String>(questionText.value);
    }
    if (optionsJson.present) {
      map['options_json'] = Variable<String>(optionsJson.value);
    }
    if (correctOptionIndex.present) {
      map['correct_option_index'] = Variable<int>(correctOptionIndex.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (packVersion.present) {
      map['pack_version'] = Variable<int>(packVersion.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('language: $language, ')
          ..write('ageGroup: $ageGroup, ')
          ..write('difficulty: $difficulty, ')
          ..write('questionText: $questionText, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctOptionIndex: $correctOptionIndex, ')
          ..write('explanation: $explanation, ')
          ..write('category: $category, ')
          ..write('source: $source, ')
          ..write('packVersion: $packVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects
    with TableInfo<$SubjectsTable, SubjectEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconNameMeta = const VerificationMeta(
    'iconName',
  );
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
    'icon_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    iconName,
    displayOrder,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubjectEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(
        _iconNameMeta,
        iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta),
      );
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayOrderMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_name'],
      )!,
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class SubjectEntry extends DataClass implements Insertable<SubjectEntry> {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final int displayOrder;
  final bool isActive;
  const SubjectEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.displayOrder,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon_name'] = Variable<String>(iconName);
    map['display_order'] = Variable<int>(displayOrder);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      iconName: Value(iconName),
      displayOrder: Value(displayOrder),
      isActive: Value(isActive),
    );
  }

  factory SubjectEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectEntry(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      iconName: serializer.fromJson<String>(json['iconName']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'iconName': serializer.toJson<String>(iconName),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  SubjectEntry copyWith({
    String? id,
    String? name,
    String? description,
    String? iconName,
    int? displayOrder,
    bool? isActive,
  }) => SubjectEntry(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    iconName: iconName ?? this.iconName,
    displayOrder: displayOrder ?? this.displayOrder,
    isActive: isActive ?? this.isActive,
  );
  SubjectEntry copyWithCompanion(SubjectsCompanion data) {
    return SubjectEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, iconName, displayOrder, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconName == this.iconName &&
          other.displayOrder == this.displayOrder &&
          other.isActive == this.isActive);
}

class SubjectsCompanion extends UpdateCompanion<SubjectEntry> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> iconName;
  final Value<int> displayOrder;
  final Value<bool> isActive;
  final Value<int> rowid;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconName = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String iconName,
    required int displayOrder,
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       iconName = Value(iconName),
       displayOrder = Value(displayOrder);
  static Insertable<SubjectEntry> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconName,
    Expression<int>? displayOrder,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconName != null) 'icon_name': iconName,
      if (displayOrder != null) 'display_order': displayOrder,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? iconName,
    Value<int>? displayOrder,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionPacksTable extends QuestionPacks
    with TableInfo<$QuestionPacksTable, QuestionPackEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionPacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionCountMeta = const VerificationMeta(
    'questionCount',
  );
  @override
  late final GeneratedColumn<int> questionCount = GeneratedColumn<int>(
    'question_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checksumMeta = const VerificationMeta(
    'checksum',
  );
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
    'checksum',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    version,
    questionCount,
    checksum,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_packs';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionPackEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('question_count')) {
      context.handle(
        _questionCountMeta,
        questionCount.isAcceptableOrUnknown(
          data['question_count']!,
          _questionCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_questionCountMeta);
    }
    if (data.containsKey('checksum')) {
      context.handle(
        _checksumMeta,
        checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta),
      );
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionPackEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionPackEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      questionCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_count'],
      )!,
      checksum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum'],
      ),
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $QuestionPacksTable createAlias(String alias) {
    return $QuestionPacksTable(attachedDatabase, alias);
  }
}

class QuestionPackEntry extends DataClass
    implements Insertable<QuestionPackEntry> {
  final String id;
  final String subjectId;
  final int version;
  final int questionCount;
  final String? checksum;
  final DateTime syncedAt;
  const QuestionPackEntry({
    required this.id,
    required this.subjectId,
    required this.version,
    required this.questionCount,
    this.checksum,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['version'] = Variable<int>(version);
    map['question_count'] = Variable<int>(questionCount);
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  QuestionPacksCompanion toCompanion(bool nullToAbsent) {
    return QuestionPacksCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      version: Value(version),
      questionCount: Value(questionCount),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      syncedAt: Value(syncedAt),
    );
  }

  factory QuestionPackEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionPackEntry(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      version: serializer.fromJson<int>(json['version']),
      questionCount: serializer.fromJson<int>(json['questionCount']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'version': serializer.toJson<int>(version),
      'questionCount': serializer.toJson<int>(questionCount),
      'checksum': serializer.toJson<String?>(checksum),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  QuestionPackEntry copyWith({
    String? id,
    String? subjectId,
    int? version,
    int? questionCount,
    Value<String?> checksum = const Value.absent(),
    DateTime? syncedAt,
  }) => QuestionPackEntry(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    version: version ?? this.version,
    questionCount: questionCount ?? this.questionCount,
    checksum: checksum.present ? checksum.value : this.checksum,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  QuestionPackEntry copyWithCompanion(QuestionPacksCompanion data) {
    return QuestionPackEntry(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      version: data.version.present ? data.version.value : this.version,
      questionCount: data.questionCount.present
          ? data.questionCount.value
          : this.questionCount,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionPackEntry(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('version: $version, ')
          ..write('questionCount: $questionCount, ')
          ..write('checksum: $checksum, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, subjectId, version, questionCount, checksum, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionPackEntry &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.version == this.version &&
          other.questionCount == this.questionCount &&
          other.checksum == this.checksum &&
          other.syncedAt == this.syncedAt);
}

class QuestionPacksCompanion extends UpdateCompanion<QuestionPackEntry> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<int> version;
  final Value<int> questionCount;
  final Value<String?> checksum;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const QuestionPacksCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.version = const Value.absent(),
    this.questionCount = const Value.absent(),
    this.checksum = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionPacksCompanion.insert({
    required String id,
    required String subjectId,
    required int version,
    required int questionCount,
    this.checksum = const Value.absent(),
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       version = Value(version),
       questionCount = Value(questionCount),
       syncedAt = Value(syncedAt);
  static Insertable<QuestionPackEntry> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<int>? version,
    Expression<int>? questionCount,
    Expression<String>? checksum,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (version != null) 'version': version,
      if (questionCount != null) 'question_count': questionCount,
      if (checksum != null) 'checksum': checksum,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionPacksCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<int>? version,
    Value<int>? questionCount,
    Value<String?>? checksum,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return QuestionPacksCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      version: version ?? this.version,
      questionCount: questionCount ?? this.questionCount,
      checksum: checksum ?? this.checksum,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (questionCount.present) {
      map['question_count'] = Variable<int>(questionCount.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionPacksCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('version: $version, ')
          ..write('questionCount: $questionCount, ')
          ..write('checksum: $checksum, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfileEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageGroupMeta = const VerificationMeta(
    'ageGroup',
  );
  @override
  late final GeneratedColumn<String> ageGroup = GeneratedColumn<String>(
    'age_group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedSubjectsJsonMeta =
      const VerificationMeta('selectedSubjectsJson');
  @override
  late final GeneratedColumn<String> selectedSubjectsJson =
      GeneratedColumn<String>(
        'selected_subjects_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    ageGroup,
    selectedSubjectsJson,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age_group')) {
      context.handle(
        _ageGroupMeta,
        ageGroup.isAcceptableOrUnknown(data['age_group']!, _ageGroupMeta),
      );
    } else if (isInserting) {
      context.missing(_ageGroupMeta);
    }
    if (data.containsKey('selected_subjects_json')) {
      context.handle(
        _selectedSubjectsJsonMeta,
        selectedSubjectsJson.isAcceptableOrUnknown(
          data['selected_subjects_json']!,
          _selectedSubjectsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedSubjectsJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      ageGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_group'],
      )!,
      selectedSubjectsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_subjects_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfileEntry extends DataClass
    implements Insertable<UserProfileEntry> {
  final String id;
  final String name;
  final String ageGroup;
  final String selectedSubjectsJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserProfileEntry({
    required this.id,
    required this.name,
    required this.ageGroup,
    required this.selectedSubjectsJson,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['age_group'] = Variable<String>(ageGroup);
    map['selected_subjects_json'] = Variable<String>(selectedSubjectsJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      name: Value(name),
      ageGroup: Value(ageGroup),
      selectedSubjectsJson: Value(selectedSubjectsJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfileEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileEntry(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ageGroup: serializer.fromJson<String>(json['ageGroup']),
      selectedSubjectsJson: serializer.fromJson<String>(
        json['selectedSubjectsJson'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'ageGroup': serializer.toJson<String>(ageGroup),
      'selectedSubjectsJson': serializer.toJson<String>(selectedSubjectsJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfileEntry copyWith({
    String? id,
    String? name,
    String? ageGroup,
    String? selectedSubjectsJson,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserProfileEntry(
    id: id ?? this.id,
    name: name ?? this.name,
    ageGroup: ageGroup ?? this.ageGroup,
    selectedSubjectsJson: selectedSubjectsJson ?? this.selectedSubjectsJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserProfileEntry copyWithCompanion(UserProfilesCompanion data) {
    return UserProfileEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ageGroup: data.ageGroup.present ? data.ageGroup.value : this.ageGroup,
      selectedSubjectsJson: data.selectedSubjectsJson.present
          ? data.selectedSubjectsJson.value
          : this.selectedSubjectsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ageGroup: $ageGroup, ')
          ..write('selectedSubjectsJson: $selectedSubjectsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    ageGroup,
    selectedSubjectsJson,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.ageGroup == this.ageGroup &&
          other.selectedSubjectsJson == this.selectedSubjectsJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfileEntry> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> ageGroup;
  final Value<String> selectedSubjectsJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ageGroup = const Value.absent(),
    this.selectedSubjectsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String id,
    required String name,
    required String ageGroup,
    required String selectedSubjectsJson,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       ageGroup = Value(ageGroup),
       selectedSubjectsJson = Value(selectedSubjectsJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<UserProfileEntry> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? ageGroup,
    Expression<String>? selectedSubjectsJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ageGroup != null) 'age_group': ageGroup,
      if (selectedSubjectsJson != null)
        'selected_subjects_json': selectedSubjectsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? ageGroup,
    Value<String>? selectedSubjectsJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ageGroup: ageGroup ?? this.ageGroup,
      selectedSubjectsJson: selectedSubjectsJson ?? this.selectedSubjectsJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (ageGroup.present) {
      map['age_group'] = Variable<String>(ageGroup.value);
    }
    if (selectedSubjectsJson.present) {
      map['selected_subjects_json'] = Variable<String>(
        selectedSubjectsJson.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ageGroup: $ageGroup, ')
          ..write('selectedSubjectsJson: $selectedSubjectsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuizSessionsTable extends QuizSessions
    with TableInfo<$QuizSessionsTable, QuizSessionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageGroupMeta = const VerificationMeta(
    'ageGroup',
  );
  @override
  late final GeneratedColumn<String> ageGroup = GeneratedColumn<String>(
    'age_group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalQuestionsMeta = const VerificationMeta(
    'totalQuestions',
  );
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
    'total_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    ageGroup,
    totalQuestions,
    score,
    isCompleted,
    startedAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizSessionEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('age_group')) {
      context.handle(
        _ageGroupMeta,
        ageGroup.isAcceptableOrUnknown(data['age_group']!, _ageGroupMeta),
      );
    } else if (isInserting) {
      context.missing(_ageGroupMeta);
    }
    if (data.containsKey('total_questions')) {
      context.handle(
        _totalQuestionsMeta,
        totalQuestions.isAcceptableOrUnknown(
          data['total_questions']!,
          _totalQuestionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalQuestionsMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizSessionEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizSessionEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      ageGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_group'],
      )!,
      totalQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_questions'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $QuizSessionsTable createAlias(String alias) {
    return $QuizSessionsTable(attachedDatabase, alias);
  }
}

class QuizSessionEntry extends DataClass
    implements Insertable<QuizSessionEntry> {
  final String id;
  final String subjectId;
  final String ageGroup;
  final int totalQuestions;
  final int score;
  final bool isCompleted;
  final DateTime startedAt;
  final DateTime? completedAt;
  const QuizSessionEntry({
    required this.id,
    required this.subjectId,
    required this.ageGroup,
    required this.totalQuestions,
    required this.score,
    required this.isCompleted,
    required this.startedAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject_id'] = Variable<String>(subjectId);
    map['age_group'] = Variable<String>(ageGroup);
    map['total_questions'] = Variable<int>(totalQuestions);
    map['score'] = Variable<int>(score);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  QuizSessionsCompanion toCompanion(bool nullToAbsent) {
    return QuizSessionsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      ageGroup: Value(ageGroup),
      totalQuestions: Value(totalQuestions),
      score: Value(score),
      isCompleted: Value(isCompleted),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory QuizSessionEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizSessionEntry(
      id: serializer.fromJson<String>(json['id']),
      subjectId: serializer.fromJson<String>(json['subjectId']),
      ageGroup: serializer.fromJson<String>(json['ageGroup']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      score: serializer.fromJson<int>(json['score']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subjectId': serializer.toJson<String>(subjectId),
      'ageGroup': serializer.toJson<String>(ageGroup),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'score': serializer.toJson<int>(score),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  QuizSessionEntry copyWith({
    String? id,
    String? subjectId,
    String? ageGroup,
    int? totalQuestions,
    int? score,
    bool? isCompleted,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => QuizSessionEntry(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    ageGroup: ageGroup ?? this.ageGroup,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    score: score ?? this.score,
    isCompleted: isCompleted ?? this.isCompleted,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  QuizSessionEntry copyWithCompanion(QuizSessionsCompanion data) {
    return QuizSessionEntry(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      ageGroup: data.ageGroup.present ? data.ageGroup.value : this.ageGroup,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      score: data.score.present ? data.score.value : this.score,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizSessionEntry(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('ageGroup: $ageGroup, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('score: $score, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    ageGroup,
    totalQuestions,
    score,
    isCompleted,
    startedAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizSessionEntry &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.ageGroup == this.ageGroup &&
          other.totalQuestions == this.totalQuestions &&
          other.score == this.score &&
          other.isCompleted == this.isCompleted &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt);
}

class QuizSessionsCompanion extends UpdateCompanion<QuizSessionEntry> {
  final Value<String> id;
  final Value<String> subjectId;
  final Value<String> ageGroup;
  final Value<int> totalQuestions;
  final Value<int> score;
  final Value<bool> isCompleted;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const QuizSessionsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.ageGroup = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.score = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizSessionsCompanion.insert({
    required String id,
    required String subjectId,
    required String ageGroup,
    required int totalQuestions,
    this.score = const Value.absent(),
    this.isCompleted = const Value.absent(),
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       subjectId = Value(subjectId),
       ageGroup = Value(ageGroup),
       totalQuestions = Value(totalQuestions),
       startedAt = Value(startedAt);
  static Insertable<QuizSessionEntry> custom({
    Expression<String>? id,
    Expression<String>? subjectId,
    Expression<String>? ageGroup,
    Expression<int>? totalQuestions,
    Expression<int>? score,
    Expression<bool>? isCompleted,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (ageGroup != null) 'age_group': ageGroup,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (score != null) 'score': score,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? subjectId,
    Value<String>? ageGroup,
    Value<int>? totalQuestions,
    Value<int>? score,
    Value<bool>? isCompleted,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return QuizSessionsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      ageGroup: ageGroup ?? this.ageGroup,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      score: score ?? this.score,
      isCompleted: isCompleted ?? this.isCompleted,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (ageGroup.present) {
      map['age_group'] = Variable<String>(ageGroup.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizSessionsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('ageGroup: $ageGroup, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('score: $score, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuizAnswersTable extends QuizAnswers
    with TableInfo<$QuizAnswersTable, QuizAnswerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedOptionIndexMeta =
      const VerificationMeta('selectedOptionIndex');
  @override
  late final GeneratedColumn<int> selectedOptionIndex = GeneratedColumn<int>(
    'selected_option_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _answeredAtMeta = const VerificationMeta(
    'answeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
    'answered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    questionId,
    selectedOptionIndex,
    isCorrect,
    answeredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizAnswerEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_option_index')) {
      context.handle(
        _selectedOptionIndexMeta,
        selectedOptionIndex.isAcceptableOrUnknown(
          data['selected_option_index']!,
          _selectedOptionIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedOptionIndexMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('answered_at')) {
      context.handle(
        _answeredAtMeta,
        answeredAt.isAcceptableOrUnknown(data['answered_at']!, _answeredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_answeredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizAnswerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizAnswerEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      selectedOptionIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}selected_option_index'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      )!,
      answeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}answered_at'],
      )!,
    );
  }

  @override
  $QuizAnswersTable createAlias(String alias) {
    return $QuizAnswersTable(attachedDatabase, alias);
  }
}

class QuizAnswerEntry extends DataClass implements Insertable<QuizAnswerEntry> {
  final String id;
  final String sessionId;
  final String questionId;
  final int selectedOptionIndex;
  final bool isCorrect;
  final DateTime answeredAt;
  const QuizAnswerEntry({
    required this.id,
    required this.sessionId,
    required this.questionId,
    required this.selectedOptionIndex,
    required this.isCorrect,
    required this.answeredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['question_id'] = Variable<String>(questionId);
    map['selected_option_index'] = Variable<int>(selectedOptionIndex);
    map['is_correct'] = Variable<bool>(isCorrect);
    map['answered_at'] = Variable<DateTime>(answeredAt);
    return map;
  }

  QuizAnswersCompanion toCompanion(bool nullToAbsent) {
    return QuizAnswersCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      questionId: Value(questionId),
      selectedOptionIndex: Value(selectedOptionIndex),
      isCorrect: Value(isCorrect),
      answeredAt: Value(answeredAt),
    );
  }

  factory QuizAnswerEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizAnswerEntry(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      questionId: serializer.fromJson<String>(json['questionId']),
      selectedOptionIndex: serializer.fromJson<int>(
        json['selectedOptionIndex'],
      ),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'questionId': serializer.toJson<String>(questionId),
      'selectedOptionIndex': serializer.toJson<int>(selectedOptionIndex),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  QuizAnswerEntry copyWith({
    String? id,
    String? sessionId,
    String? questionId,
    int? selectedOptionIndex,
    bool? isCorrect,
    DateTime? answeredAt,
  }) => QuizAnswerEntry(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    questionId: questionId ?? this.questionId,
    selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    isCorrect: isCorrect ?? this.isCorrect,
    answeredAt: answeredAt ?? this.answeredAt,
  );
  QuizAnswerEntry copyWithCompanion(QuizAnswersCompanion data) {
    return QuizAnswerEntry(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      selectedOptionIndex: data.selectedOptionIndex.present
          ? data.selectedOptionIndex.value
          : this.selectedOptionIndex,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      answeredAt: data.answeredAt.present
          ? data.answeredAt.value
          : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizAnswerEntry(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedOptionIndex: $selectedOptionIndex, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    questionId,
    selectedOptionIndex,
    isCorrect,
    answeredAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizAnswerEntry &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.questionId == this.questionId &&
          other.selectedOptionIndex == this.selectedOptionIndex &&
          other.isCorrect == this.isCorrect &&
          other.answeredAt == this.answeredAt);
}

class QuizAnswersCompanion extends UpdateCompanion<QuizAnswerEntry> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> questionId;
  final Value<int> selectedOptionIndex;
  final Value<bool> isCorrect;
  final Value<DateTime> answeredAt;
  final Value<int> rowid;
  const QuizAnswersCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedOptionIndex = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.answeredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizAnswersCompanion.insert({
    required String id,
    required String sessionId,
    required String questionId,
    required int selectedOptionIndex,
    required bool isCorrect,
    required DateTime answeredAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       questionId = Value(questionId),
       selectedOptionIndex = Value(selectedOptionIndex),
       isCorrect = Value(isCorrect),
       answeredAt = Value(answeredAt);
  static Insertable<QuizAnswerEntry> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? questionId,
    Expression<int>? selectedOptionIndex,
    Expression<bool>? isCorrect,
    Expression<DateTime>? answeredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (questionId != null) 'question_id': questionId,
      if (selectedOptionIndex != null)
        'selected_option_index': selectedOptionIndex,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (answeredAt != null) 'answered_at': answeredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizAnswersCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? questionId,
    Value<int>? selectedOptionIndex,
    Value<bool>? isCorrect,
    Value<DateTime>? answeredAt,
    Value<int>? rowid,
  }) {
    return QuizAnswersCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      questionId: questionId ?? this.questionId,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      isCorrect: isCorrect ?? this.isCorrect,
      answeredAt: answeredAt ?? this.answeredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (selectedOptionIndex.present) {
      map['selected_option_index'] = Variable<int>(selectedOptionIndex.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizAnswersCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedOptionIndex: $selectedOptionIndex, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('answeredAt: $answeredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningProgressTable extends LearningProgress
    with TableInfo<$LearningProgressTable, LearningProgressEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<String> subjectId = GeneratedColumn<String>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAnsweredMeta = const VerificationMeta(
    'totalAnswered',
  );
  @override
  late final GeneratedColumn<int> totalAnswered = GeneratedColumn<int>(
    'total_answered',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalCorrectMeta = const VerificationMeta(
    'totalCorrect',
  );
  @override
  late final GeneratedColumn<int> totalCorrect = GeneratedColumn<int>(
    'total_correct',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _accuracyMeta = const VerificationMeta(
    'accuracy',
  );
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
    'accuracy',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _lastPlayedAtMeta = const VerificationMeta(
    'lastPlayedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPlayedAt = GeneratedColumn<DateTime>(
    'last_played_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    subjectId,
    totalAnswered,
    totalCorrect,
    accuracy,
    lastPlayedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<LearningProgressEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('total_answered')) {
      context.handle(
        _totalAnsweredMeta,
        totalAnswered.isAcceptableOrUnknown(
          data['total_answered']!,
          _totalAnsweredMeta,
        ),
      );
    }
    if (data.containsKey('total_correct')) {
      context.handle(
        _totalCorrectMeta,
        totalCorrect.isAcceptableOrUnknown(
          data['total_correct']!,
          _totalCorrectMeta,
        ),
      );
    }
    if (data.containsKey('accuracy')) {
      context.handle(
        _accuracyMeta,
        accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta),
      );
    }
    if (data.containsKey('last_played_at')) {
      context.handle(
        _lastPlayedAtMeta,
        lastPlayedAt.isAcceptableOrUnknown(
          data['last_played_at']!,
          _lastPlayedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {subjectId};
  @override
  LearningProgressEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningProgressEntry(
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_id'],
      )!,
      totalAnswered: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_answered'],
      )!,
      totalCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_correct'],
      )!,
      accuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy'],
      )!,
      lastPlayedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_played_at'],
      ),
    );
  }

  @override
  $LearningProgressTable createAlias(String alias) {
    return $LearningProgressTable(attachedDatabase, alias);
  }
}

class LearningProgressEntry extends DataClass
    implements Insertable<LearningProgressEntry> {
  final String subjectId;
  final int totalAnswered;
  final int totalCorrect;
  final double accuracy;
  final DateTime? lastPlayedAt;
  const LearningProgressEntry({
    required this.subjectId,
    required this.totalAnswered,
    required this.totalCorrect,
    required this.accuracy,
    this.lastPlayedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['subject_id'] = Variable<String>(subjectId);
    map['total_answered'] = Variable<int>(totalAnswered);
    map['total_correct'] = Variable<int>(totalCorrect);
    map['accuracy'] = Variable<double>(accuracy);
    if (!nullToAbsent || lastPlayedAt != null) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt);
    }
    return map;
  }

  LearningProgressCompanion toCompanion(bool nullToAbsent) {
    return LearningProgressCompanion(
      subjectId: Value(subjectId),
      totalAnswered: Value(totalAnswered),
      totalCorrect: Value(totalCorrect),
      accuracy: Value(accuracy),
      lastPlayedAt: lastPlayedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayedAt),
    );
  }

  factory LearningProgressEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningProgressEntry(
      subjectId: serializer.fromJson<String>(json['subjectId']),
      totalAnswered: serializer.fromJson<int>(json['totalAnswered']),
      totalCorrect: serializer.fromJson<int>(json['totalCorrect']),
      accuracy: serializer.fromJson<double>(json['accuracy']),
      lastPlayedAt: serializer.fromJson<DateTime?>(json['lastPlayedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'subjectId': serializer.toJson<String>(subjectId),
      'totalAnswered': serializer.toJson<int>(totalAnswered),
      'totalCorrect': serializer.toJson<int>(totalCorrect),
      'accuracy': serializer.toJson<double>(accuracy),
      'lastPlayedAt': serializer.toJson<DateTime?>(lastPlayedAt),
    };
  }

  LearningProgressEntry copyWith({
    String? subjectId,
    int? totalAnswered,
    int? totalCorrect,
    double? accuracy,
    Value<DateTime?> lastPlayedAt = const Value.absent(),
  }) => LearningProgressEntry(
    subjectId: subjectId ?? this.subjectId,
    totalAnswered: totalAnswered ?? this.totalAnswered,
    totalCorrect: totalCorrect ?? this.totalCorrect,
    accuracy: accuracy ?? this.accuracy,
    lastPlayedAt: lastPlayedAt.present ? lastPlayedAt.value : this.lastPlayedAt,
  );
  LearningProgressEntry copyWithCompanion(LearningProgressCompanion data) {
    return LearningProgressEntry(
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      totalAnswered: data.totalAnswered.present
          ? data.totalAnswered.value
          : this.totalAnswered,
      totalCorrect: data.totalCorrect.present
          ? data.totalCorrect.value
          : this.totalCorrect,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      lastPlayedAt: data.lastPlayedAt.present
          ? data.lastPlayedAt.value
          : this.lastPlayedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningProgressEntry(')
          ..write('subjectId: $subjectId, ')
          ..write('totalAnswered: $totalAnswered, ')
          ..write('totalCorrect: $totalCorrect, ')
          ..write('accuracy: $accuracy, ')
          ..write('lastPlayedAt: $lastPlayedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    subjectId,
    totalAnswered,
    totalCorrect,
    accuracy,
    lastPlayedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningProgressEntry &&
          other.subjectId == this.subjectId &&
          other.totalAnswered == this.totalAnswered &&
          other.totalCorrect == this.totalCorrect &&
          other.accuracy == this.accuracy &&
          other.lastPlayedAt == this.lastPlayedAt);
}

class LearningProgressCompanion extends UpdateCompanion<LearningProgressEntry> {
  final Value<String> subjectId;
  final Value<int> totalAnswered;
  final Value<int> totalCorrect;
  final Value<double> accuracy;
  final Value<DateTime?> lastPlayedAt;
  final Value<int> rowid;
  const LearningProgressCompanion({
    this.subjectId = const Value.absent(),
    this.totalAnswered = const Value.absent(),
    this.totalCorrect = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningProgressCompanion.insert({
    required String subjectId,
    this.totalAnswered = const Value.absent(),
    this.totalCorrect = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : subjectId = Value(subjectId);
  static Insertable<LearningProgressEntry> custom({
    Expression<String>? subjectId,
    Expression<int>? totalAnswered,
    Expression<int>? totalCorrect,
    Expression<double>? accuracy,
    Expression<DateTime>? lastPlayedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (subjectId != null) 'subject_id': subjectId,
      if (totalAnswered != null) 'total_answered': totalAnswered,
      if (totalCorrect != null) 'total_correct': totalCorrect,
      if (accuracy != null) 'accuracy': accuracy,
      if (lastPlayedAt != null) 'last_played_at': lastPlayedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningProgressCompanion copyWith({
    Value<String>? subjectId,
    Value<int>? totalAnswered,
    Value<int>? totalCorrect,
    Value<double>? accuracy,
    Value<DateTime?>? lastPlayedAt,
    Value<int>? rowid,
  }) {
    return LearningProgressCompanion(
      subjectId: subjectId ?? this.subjectId,
      totalAnswered: totalAnswered ?? this.totalAnswered,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      accuracy: accuracy ?? this.accuracy,
      lastPlayedAt: lastPlayedAt ?? this.lastPlayedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (subjectId.present) {
      map['subject_id'] = Variable<String>(subjectId.value);
    }
    if (totalAnswered.present) {
      map['total_answered'] = Variable<int>(totalAnswered.value);
    }
    if (totalCorrect.present) {
      map['total_correct'] = Variable<int>(totalCorrect.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (lastPlayedAt.present) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningProgressCompanion(')
          ..write('subjectId: $subjectId, ')
          ..write('totalAnswered: $totalAnswered, ')
          ..write('totalCorrect: $totalCorrect, ')
          ..write('accuracy: $accuracy, ')
          ..write('lastPlayedAt: $lastPlayedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncMetadataEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataEntry(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataEntry extends DataClass
    implements Insertable<SyncMetadataEntry> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const SyncMetadataEntry({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncMetadataEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataEntry(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncMetadataEntry copyWith({
    String? key,
    String? value,
    DateTime? updatedAt,
  }) => SyncMetadataEntry(
    key: key ?? this.key,
    value: value ?? this.value,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncMetadataEntry copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataEntry(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataEntry(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataEntry &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataEntry> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<SyncMetadataEntry> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncMetadataCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $QuestionPacksTable questionPacks = $QuestionPacksTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $QuizSessionsTable quizSessions = $QuizSessionsTable(this);
  late final $QuizAnswersTable quizAnswers = $QuizAnswersTable(this);
  late final $LearningProgressTable learningProgress = $LearningProgressTable(
    this,
  );
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    questions,
    subjects,
    questionPacks,
    userProfiles,
    quizSessions,
    quizAnswers,
    learningProgress,
    syncMetadata,
  ];
}

typedef $$QuestionsTableCreateCompanionBuilder =
    QuestionsCompanion Function({
      required String id,
      required String subjectId,
      required String language,
      required String ageGroup,
      required String difficulty,
      required String questionText,
      required String optionsJson,
      required int correctOptionIndex,
      required String explanation,
      required String category,
      required String source,
      Value<int> packVersion,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$QuestionsTableUpdateCompanionBuilder =
    QuestionsCompanion Function({
      Value<String> id,
      Value<String> subjectId,
      Value<String> language,
      Value<String> ageGroup,
      Value<String> difficulty,
      Value<String> questionText,
      Value<String> optionsJson,
      Value<int> correctOptionIndex,
      Value<String> explanation,
      Value<String> category,
      Value<String> source,
      Value<int> packVersion,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
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

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageGroup => $composableBuilder(
    column: $table.ageGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get correctOptionIndex => $composableBuilder(
    column: $table.correctOptionIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get packVersion => $composableBuilder(
    column: $table.packVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
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

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageGroup => $composableBuilder(
    column: $table.ageGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correctOptionIndex => $composableBuilder(
    column: $table.correctOptionIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get packVersion => $composableBuilder(
    column: $table.packVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get ageGroup =>
      $composableBuilder(column: $table.ageGroup, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get correctOptionIndex => $composableBuilder(
    column: $table.correctOptionIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get packVersion => $composableBuilder(
    column: $table.packVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$QuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionsTable,
          QuestionEntry,
          $$QuestionsTableFilterComposer,
          $$QuestionsTableOrderingComposer,
          $$QuestionsTableAnnotationComposer,
          $$QuestionsTableCreateCompanionBuilder,
          $$QuestionsTableUpdateCompanionBuilder,
          (
            QuestionEntry,
            BaseReferences<_$AppDatabase, $QuestionsTable, QuestionEntry>,
          ),
          QuestionEntry,
          PrefetchHooks Function()
        > {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> ageGroup = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> questionText = const Value.absent(),
                Value<String> optionsJson = const Value.absent(),
                Value<int> correctOptionIndex = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> packVersion = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion(
                id: id,
                subjectId: subjectId,
                language: language,
                ageGroup: ageGroup,
                difficulty: difficulty,
                questionText: questionText,
                optionsJson: optionsJson,
                correctOptionIndex: correctOptionIndex,
                explanation: explanation,
                category: category,
                source: source,
                packVersion: packVersion,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required String language,
                required String ageGroup,
                required String difficulty,
                required String questionText,
                required String optionsJson,
                required int correctOptionIndex,
                required String explanation,
                required String category,
                required String source,
                Value<int> packVersion = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => QuestionsCompanion.insert(
                id: id,
                subjectId: subjectId,
                language: language,
                ageGroup: ageGroup,
                difficulty: difficulty,
                questionText: questionText,
                optionsJson: optionsJson,
                correctOptionIndex: correctOptionIndex,
                explanation: explanation,
                category: category,
                source: source,
                packVersion: packVersion,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionsTable,
      QuestionEntry,
      $$QuestionsTableFilterComposer,
      $$QuestionsTableOrderingComposer,
      $$QuestionsTableAnnotationComposer,
      $$QuestionsTableCreateCompanionBuilder,
      $$QuestionsTableUpdateCompanionBuilder,
      (
        QuestionEntry,
        BaseReferences<_$AppDatabase, $QuestionsTable, QuestionEntry>,
      ),
      QuestionEntry,
      PrefetchHooks Function()
    >;
typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      required String id,
      required String name,
      required String description,
      required String iconName,
      required int displayOrder,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<String> iconName,
      Value<int> displayOrder,
      Value<bool> isActive,
      Value<int> rowid,
    });

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectsTable,
          SubjectEntry,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (
            SubjectEntry,
            BaseReferences<_$AppDatabase, $SubjectsTable, SubjectEntry>,
          ),
          SubjectEntry,
          PrefetchHooks Function()
        > {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconName = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion(
                id: id,
                name: name,
                description: description,
                iconName: iconName,
                displayOrder: displayOrder,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required String iconName,
                required int displayOrder,
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                name: name,
                description: description,
                iconName: iconName,
                displayOrder: displayOrder,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectsTable,
      SubjectEntry,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (
        SubjectEntry,
        BaseReferences<_$AppDatabase, $SubjectsTable, SubjectEntry>,
      ),
      SubjectEntry,
      PrefetchHooks Function()
    >;
typedef $$QuestionPacksTableCreateCompanionBuilder =
    QuestionPacksCompanion Function({
      required String id,
      required String subjectId,
      required int version,
      required int questionCount,
      Value<String?> checksum,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$QuestionPacksTableUpdateCompanionBuilder =
    QuestionPacksCompanion Function({
      Value<String> id,
      Value<String> subjectId,
      Value<int> version,
      Value<int> questionCount,
      Value<String?> checksum,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$QuestionPacksTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionPacksTable> {
  $$QuestionPacksTableFilterComposer({
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

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionCount => $composableBuilder(
    column: $table.questionCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestionPacksTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionPacksTable> {
  $$QuestionPacksTableOrderingComposer({
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

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionCount => $composableBuilder(
    column: $table.questionCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestionPacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionPacksTable> {
  $$QuestionPacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get questionCount => $composableBuilder(
    column: $table.questionCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$QuestionPacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionPacksTable,
          QuestionPackEntry,
          $$QuestionPacksTableFilterComposer,
          $$QuestionPacksTableOrderingComposer,
          $$QuestionPacksTableAnnotationComposer,
          $$QuestionPacksTableCreateCompanionBuilder,
          $$QuestionPacksTableUpdateCompanionBuilder,
          (
            QuestionPackEntry,
            BaseReferences<
              _$AppDatabase,
              $QuestionPacksTable,
              QuestionPackEntry
            >,
          ),
          QuestionPackEntry,
          PrefetchHooks Function()
        > {
  $$QuestionPacksTableTableManager(_$AppDatabase db, $QuestionPacksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionPacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionPacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionPacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> questionCount = const Value.absent(),
                Value<String?> checksum = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionPacksCompanion(
                id: id,
                subjectId: subjectId,
                version: version,
                questionCount: questionCount,
                checksum: checksum,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required int version,
                required int questionCount,
                Value<String?> checksum = const Value.absent(),
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => QuestionPacksCompanion.insert(
                id: id,
                subjectId: subjectId,
                version: version,
                questionCount: questionCount,
                checksum: checksum,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionPacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionPacksTable,
      QuestionPackEntry,
      $$QuestionPacksTableFilterComposer,
      $$QuestionPacksTableOrderingComposer,
      $$QuestionPacksTableAnnotationComposer,
      $$QuestionPacksTableCreateCompanionBuilder,
      $$QuestionPacksTableUpdateCompanionBuilder,
      (
        QuestionPackEntry,
        BaseReferences<_$AppDatabase, $QuestionPacksTable, QuestionPackEntry>,
      ),
      QuestionPackEntry,
      PrefetchHooks Function()
    >;
typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      required String id,
      required String name,
      required String ageGroup,
      required String selectedSubjectsJson,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> ageGroup,
      Value<String> selectedSubjectsJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageGroup => $composableBuilder(
    column: $table.ageGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedSubjectsJson => $composableBuilder(
    column: $table.selectedSubjectsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageGroup => $composableBuilder(
    column: $table.ageGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedSubjectsJson => $composableBuilder(
    column: $table.selectedSubjectsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
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

  GeneratedColumn<String> get ageGroup =>
      $composableBuilder(column: $table.ageGroup, builder: (column) => column);

  GeneratedColumn<String> get selectedSubjectsJson => $composableBuilder(
    column: $table.selectedSubjectsJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfileEntry,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfileEntry,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileEntry>,
          ),
          UserProfileEntry,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> ageGroup = const Value.absent(),
                Value<String> selectedSubjectsJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                name: name,
                ageGroup: ageGroup,
                selectedSubjectsJson: selectedSubjectsJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String ageGroup,
                required String selectedSubjectsJson,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                name: name,
                ageGroup: ageGroup,
                selectedSubjectsJson: selectedSubjectsJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfileEntry,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfileEntry,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileEntry>,
      ),
      UserProfileEntry,
      PrefetchHooks Function()
    >;
typedef $$QuizSessionsTableCreateCompanionBuilder =
    QuizSessionsCompanion Function({
      required String id,
      required String subjectId,
      required String ageGroup,
      required int totalQuestions,
      Value<int> score,
      Value<bool> isCompleted,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$QuizSessionsTableUpdateCompanionBuilder =
    QuizSessionsCompanion Function({
      Value<String> id,
      Value<String> subjectId,
      Value<String> ageGroup,
      Value<int> totalQuestions,
      Value<int> score,
      Value<bool> isCompleted,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$QuizSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuizSessionsTable> {
  $$QuizSessionsTableFilterComposer({
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

  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageGroup => $composableBuilder(
    column: $table.ageGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuizSessionsTable> {
  $$QuizSessionsTableOrderingComposer({
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

  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageGroup => $composableBuilder(
    column: $table.ageGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizSessionsTable> {
  $$QuizSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get ageGroup =>
      $composableBuilder(column: $table.ageGroup, builder: (column) => column);

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$QuizSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuizSessionsTable,
          QuizSessionEntry,
          $$QuizSessionsTableFilterComposer,
          $$QuizSessionsTableOrderingComposer,
          $$QuizSessionsTableAnnotationComposer,
          $$QuizSessionsTableCreateCompanionBuilder,
          $$QuizSessionsTableUpdateCompanionBuilder,
          (
            QuizSessionEntry,
            BaseReferences<_$AppDatabase, $QuizSessionsTable, QuizSessionEntry>,
          ),
          QuizSessionEntry,
          PrefetchHooks Function()
        > {
  $$QuizSessionsTableTableManager(_$AppDatabase db, $QuizSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> subjectId = const Value.absent(),
                Value<String> ageGroup = const Value.absent(),
                Value<int> totalQuestions = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizSessionsCompanion(
                id: id,
                subjectId: subjectId,
                ageGroup: ageGroup,
                totalQuestions: totalQuestions,
                score: score,
                isCompleted: isCompleted,
                startedAt: startedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String subjectId,
                required String ageGroup,
                required int totalQuestions,
                Value<int> score = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizSessionsCompanion.insert(
                id: id,
                subjectId: subjectId,
                ageGroup: ageGroup,
                totalQuestions: totalQuestions,
                score: score,
                isCompleted: isCompleted,
                startedAt: startedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuizSessionsTable,
      QuizSessionEntry,
      $$QuizSessionsTableFilterComposer,
      $$QuizSessionsTableOrderingComposer,
      $$QuizSessionsTableAnnotationComposer,
      $$QuizSessionsTableCreateCompanionBuilder,
      $$QuizSessionsTableUpdateCompanionBuilder,
      (
        QuizSessionEntry,
        BaseReferences<_$AppDatabase, $QuizSessionsTable, QuizSessionEntry>,
      ),
      QuizSessionEntry,
      PrefetchHooks Function()
    >;
typedef $$QuizAnswersTableCreateCompanionBuilder =
    QuizAnswersCompanion Function({
      required String id,
      required String sessionId,
      required String questionId,
      required int selectedOptionIndex,
      required bool isCorrect,
      required DateTime answeredAt,
      Value<int> rowid,
    });
typedef $$QuizAnswersTableUpdateCompanionBuilder =
    QuizAnswersCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String> questionId,
      Value<int> selectedOptionIndex,
      Value<bool> isCorrect,
      Value<DateTime> answeredAt,
      Value<int> rowid,
    });

class $$QuizAnswersTableFilterComposer
    extends Composer<_$AppDatabase, $QuizAnswersTable> {
  $$QuizAnswersTableFilterComposer({
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

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get selectedOptionIndex => $composableBuilder(
    column: $table.selectedOptionIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizAnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $QuizAnswersTable> {
  $$QuizAnswersTableOrderingComposer({
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

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get selectedOptionIndex => $composableBuilder(
    column: $table.selectedOptionIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizAnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizAnswersTable> {
  $$QuizAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get selectedOptionIndex => $composableBuilder(
    column: $table.selectedOptionIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => column,
  );
}

class $$QuizAnswersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuizAnswersTable,
          QuizAnswerEntry,
          $$QuizAnswersTableFilterComposer,
          $$QuizAnswersTableOrderingComposer,
          $$QuizAnswersTableAnnotationComposer,
          $$QuizAnswersTableCreateCompanionBuilder,
          $$QuizAnswersTableUpdateCompanionBuilder,
          (
            QuizAnswerEntry,
            BaseReferences<_$AppDatabase, $QuizAnswersTable, QuizAnswerEntry>,
          ),
          QuizAnswerEntry,
          PrefetchHooks Function()
        > {
  $$QuizAnswersTableTableManager(_$AppDatabase db, $QuizAnswersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<int> selectedOptionIndex = const Value.absent(),
                Value<bool> isCorrect = const Value.absent(),
                Value<DateTime> answeredAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizAnswersCompanion(
                id: id,
                sessionId: sessionId,
                questionId: questionId,
                selectedOptionIndex: selectedOptionIndex,
                isCorrect: isCorrect,
                answeredAt: answeredAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required String questionId,
                required int selectedOptionIndex,
                required bool isCorrect,
                required DateTime answeredAt,
                Value<int> rowid = const Value.absent(),
              }) => QuizAnswersCompanion.insert(
                id: id,
                sessionId: sessionId,
                questionId: questionId,
                selectedOptionIndex: selectedOptionIndex,
                isCorrect: isCorrect,
                answeredAt: answeredAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuizAnswersTable,
      QuizAnswerEntry,
      $$QuizAnswersTableFilterComposer,
      $$QuizAnswersTableOrderingComposer,
      $$QuizAnswersTableAnnotationComposer,
      $$QuizAnswersTableCreateCompanionBuilder,
      $$QuizAnswersTableUpdateCompanionBuilder,
      (
        QuizAnswerEntry,
        BaseReferences<_$AppDatabase, $QuizAnswersTable, QuizAnswerEntry>,
      ),
      QuizAnswerEntry,
      PrefetchHooks Function()
    >;
typedef $$LearningProgressTableCreateCompanionBuilder =
    LearningProgressCompanion Function({
      required String subjectId,
      Value<int> totalAnswered,
      Value<int> totalCorrect,
      Value<double> accuracy,
      Value<DateTime?> lastPlayedAt,
      Value<int> rowid,
    });
typedef $$LearningProgressTableUpdateCompanionBuilder =
    LearningProgressCompanion Function({
      Value<String> subjectId,
      Value<int> totalAnswered,
      Value<int> totalCorrect,
      Value<double> accuracy,
      Value<DateTime?> lastPlayedAt,
      Value<int> rowid,
    });

class $$LearningProgressTableFilterComposer
    extends Composer<_$AppDatabase, $LearningProgressTable> {
  $$LearningProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAnswered => $composableBuilder(
    column: $table.totalAnswered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCorrect => $composableBuilder(
    column: $table.totalCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LearningProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningProgressTable> {
  $$LearningProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get subjectId => $composableBuilder(
    column: $table.subjectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAnswered => $composableBuilder(
    column: $table.totalAnswered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCorrect => $composableBuilder(
    column: $table.totalCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LearningProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningProgressTable> {
  $$LearningProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<int> get totalAnswered => $composableBuilder(
    column: $table.totalAnswered,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCorrect => $composableBuilder(
    column: $table.totalCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => column,
  );
}

class $$LearningProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LearningProgressTable,
          LearningProgressEntry,
          $$LearningProgressTableFilterComposer,
          $$LearningProgressTableOrderingComposer,
          $$LearningProgressTableAnnotationComposer,
          $$LearningProgressTableCreateCompanionBuilder,
          $$LearningProgressTableUpdateCompanionBuilder,
          (
            LearningProgressEntry,
            BaseReferences<
              _$AppDatabase,
              $LearningProgressTable,
              LearningProgressEntry
            >,
          ),
          LearningProgressEntry,
          PrefetchHooks Function()
        > {
  $$LearningProgressTableTableManager(
    _$AppDatabase db,
    $LearningProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> subjectId = const Value.absent(),
                Value<int> totalAnswered = const Value.absent(),
                Value<int> totalCorrect = const Value.absent(),
                Value<double> accuracy = const Value.absent(),
                Value<DateTime?> lastPlayedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningProgressCompanion(
                subjectId: subjectId,
                totalAnswered: totalAnswered,
                totalCorrect: totalCorrect,
                accuracy: accuracy,
                lastPlayedAt: lastPlayedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String subjectId,
                Value<int> totalAnswered = const Value.absent(),
                Value<int> totalCorrect = const Value.absent(),
                Value<double> accuracy = const Value.absent(),
                Value<DateTime?> lastPlayedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningProgressCompanion.insert(
                subjectId: subjectId,
                totalAnswered: totalAnswered,
                totalCorrect: totalCorrect,
                accuracy: accuracy,
                lastPlayedAt: lastPlayedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LearningProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LearningProgressTable,
      LearningProgressEntry,
      $$LearningProgressTableFilterComposer,
      $$LearningProgressTableOrderingComposer,
      $$LearningProgressTableAnnotationComposer,
      $$LearningProgressTableCreateCompanionBuilder,
      $$LearningProgressTableUpdateCompanionBuilder,
      (
        LearningProgressEntry,
        BaseReferences<
          _$AppDatabase,
          $LearningProgressTable,
          LearningProgressEntry
        >,
      ),
      LearningProgressEntry,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableCreateCompanionBuilder =
    SyncMetadataCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableUpdateCompanionBuilder =
    SyncMetadataCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTable,
          SyncMetadataEntry,
          $$SyncMetadataTableFilterComposer,
          $$SyncMetadataTableOrderingComposer,
          $$SyncMetadataTableAnnotationComposer,
          $$SyncMetadataTableCreateCompanionBuilder,
          $$SyncMetadataTableUpdateCompanionBuilder,
          (
            SyncMetadataEntry,
            BaseReferences<
              _$AppDatabase,
              $SyncMetadataTable,
              SyncMetadataEntry
            >,
          ),
          SyncMetadataEntry,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableManager(_$AppDatabase db, $SyncMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTable,
      SyncMetadataEntry,
      $$SyncMetadataTableFilterComposer,
      $$SyncMetadataTableOrderingComposer,
      $$SyncMetadataTableAnnotationComposer,
      $$SyncMetadataTableCreateCompanionBuilder,
      $$SyncMetadataTableUpdateCompanionBuilder,
      (
        SyncMetadataEntry,
        BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataEntry>,
      ),
      SyncMetadataEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$QuestionPacksTableTableManager get questionPacks =>
      $$QuestionPacksTableTableManager(_db, _db.questionPacks);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$QuizSessionsTableTableManager get quizSessions =>
      $$QuizSessionsTableTableManager(_db, _db.quizSessions);
  $$QuizAnswersTableTableManager get quizAnswers =>
      $$QuizAnswersTableTableManager(_db, _db.quizAnswers);
  $$LearningProgressTableTableManager get learningProgress =>
      $$LearningProgressTableTableManager(_db, _db.learningProgress);
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
}
