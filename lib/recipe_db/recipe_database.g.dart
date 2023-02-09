// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorRecipeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$RecipeDatabaseBuilder databaseBuilder(String name) =>
      _$RecipeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$RecipeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$RecipeDatabaseBuilder(null);
}

class _$RecipeDatabaseBuilder {
  _$RecipeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$RecipeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$RecipeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<RecipeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$RecipeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$RecipeDatabase extends RecipeDatabase {
  _$RecipeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RecipeDao? _recipeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RecipeDbData` (`id` INTEGER NOT NULL, `calories` INTEGER NOT NULL, `carbs` TEXT NOT NULL, `fat` TEXT NOT NULL, `image` TEXT NOT NULL, `protein` TEXT NOT NULL, `title` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RecipeDao get recipeDao {
    return _recipeDaoInstance ??= _$RecipeDao(database, changeListener);
  }
}

class _$RecipeDao extends RecipeDao {
  _$RecipeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _recipeDbDataInsertionAdapter = InsertionAdapter(
            database,
            'RecipeDbData',
            (RecipeDbData item) => <String, Object?>{
                  'id': item.id,
                  'calories': item.calories,
                  'carbs': item.carbs,
                  'fat': item.fat,
                  'image': item.image,
                  'protein': item.protein,
                  'title': item.title
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecipeDbData> _recipeDbDataInsertionAdapter;

  @override
  Future<List<RecipeDbData>> getAllRecipes() async {
    return _queryAdapter.queryList('SELECT * FROM RecipeDbData',
        mapper: (Map<String, Object?> row) => RecipeDbData(
            calories: row['calories'] as int,
            carbs: row['carbs'] as String,
            fat: row['fat'] as String,
            id: row['id'] as int,
            image: row['image'] as String,
            protein: row['protein'] as String,
            title: row['title'] as String));
  }

  @override
  Future<void> deleteRecipe(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM RecipeDbData WHERE id=?1', arguments: [id]);
  }

  @override
  Future<RecipeDbData?> findStudentById(int id) async {
    return _queryAdapter.query('SELECT * FROM RecipeDbData WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RecipeDbData(
            calories: row['calories'] as int,
            carbs: row['carbs'] as String,
            fat: row['fat'] as String,
            id: row['id'] as int,
            image: row['image'] as String,
            protein: row['protein'] as String,
            title: row['title'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertRecipeDetail(RecipeDbData recipeData) async {
    await _recipeDbDataInsertionAdapter.insert(
        recipeData, OnConflictStrategy.abort);
  }
}
