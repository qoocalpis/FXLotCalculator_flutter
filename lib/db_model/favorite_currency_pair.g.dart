// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_currency_pair.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTestFavoriteCurrencyPairsListCollection on Isar {
  IsarCollection<TestFavoriteCurrencyPairsList>
      get testFavoriteCurrencyPairsLists => this.collection();
}

const TestFavoriteCurrencyPairsListSchema = CollectionSchema(
  name: r'TestFavoriteCurrencyPairsList',
  id: -3285994036970629818,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _testFavoriteCurrencyPairsListEstimateSize,
  serialize: _testFavoriteCurrencyPairsListSerialize,
  deserialize: _testFavoriteCurrencyPairsListDeserialize,
  deserializeProp: _testFavoriteCurrencyPairsListDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'user': LinkSchema(
      id: -3414877878026158551,
      name: r'user',
      target: r'TestUser',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _testFavoriteCurrencyPairsListGetId,
  getLinks: _testFavoriteCurrencyPairsListGetLinks,
  attach: _testFavoriteCurrencyPairsListAttach,
  version: '3.1.0',
);

int _testFavoriteCurrencyPairsListEstimateSize(
  TestFavoriteCurrencyPairsList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _testFavoriteCurrencyPairsListSerialize(
  TestFavoriteCurrencyPairsList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

TestFavoriteCurrencyPairsList _testFavoriteCurrencyPairsListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TestFavoriteCurrencyPairsList();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _testFavoriteCurrencyPairsListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _testFavoriteCurrencyPairsListGetId(TestFavoriteCurrencyPairsList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _testFavoriteCurrencyPairsListGetLinks(
    TestFavoriteCurrencyPairsList object) {
  return [object.user];
}

void _testFavoriteCurrencyPairsListAttach(
    IsarCollection<dynamic> col, Id id, TestFavoriteCurrencyPairsList object) {
  object.id = id;
  object.user.attach(col, col.isar.collection<TestUser>(), r'user', id);
}

extension TestFavoriteCurrencyPairsListByIndex
    on IsarCollection<TestFavoriteCurrencyPairsList> {
  Future<TestFavoriteCurrencyPairsList?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  TestFavoriteCurrencyPairsList? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<TestFavoriteCurrencyPairsList?>> getAllByName(
      List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<TestFavoriteCurrencyPairsList?> getAllByNameSync(
      List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(TestFavoriteCurrencyPairsList object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(TestFavoriteCurrencyPairsList object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<TestFavoriteCurrencyPairsList> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<TestFavoriteCurrencyPairsList> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension TestFavoriteCurrencyPairsListQueryWhereSort on QueryBuilder<
    TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList, QWhere> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TestFavoriteCurrencyPairsListQueryWhere on QueryBuilder<
    TestFavoriteCurrencyPairsList,
    TestFavoriteCurrencyPairsList,
    QWhereClause> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterWhereClause> nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TestFavoriteCurrencyPairsListQueryFilter on QueryBuilder<
    TestFavoriteCurrencyPairsList,
    TestFavoriteCurrencyPairsList,
    QFilterCondition> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension TestFavoriteCurrencyPairsListQueryObject on QueryBuilder<
    TestFavoriteCurrencyPairsList,
    TestFavoriteCurrencyPairsList,
    QFilterCondition> {}

extension TestFavoriteCurrencyPairsListQueryLinks on QueryBuilder<
    TestFavoriteCurrencyPairsList,
    TestFavoriteCurrencyPairsList,
    QFilterCondition> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> user(FilterQuery<TestUser> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', length, true, length, true);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> userIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> userIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, false, 999999, true);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, length, include);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', length, include, 999999, true);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'user', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TestFavoriteCurrencyPairsListQuerySortBy on QueryBuilder<
    TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList, QSortBy> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension TestFavoriteCurrencyPairsListQuerySortThenBy on QueryBuilder<
    TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList, QSortThenBy> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension TestFavoriteCurrencyPairsListQueryWhereDistinct on QueryBuilder<
    TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList, QDistinct> {
  QueryBuilder<TestFavoriteCurrencyPairsList, TestFavoriteCurrencyPairsList,
      QDistinct> distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension TestFavoriteCurrencyPairsListQueryProperty on QueryBuilder<
    TestFavoriteCurrencyPairsList,
    TestFavoriteCurrencyPairsList,
    QQueryProperty> {
  QueryBuilder<TestFavoriteCurrencyPairsList, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TestFavoriteCurrencyPairsList, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
