// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_currency_pair.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoriteCurrencyPairsListCollection on Isar {
  IsarCollection<FavoriteCurrencyPairsList> get favoriteCurrencyPairsLists =>
      this.collection();
}

const FavoriteCurrencyPairsListSchema = CollectionSchema(
  name: r'FavoriteCurrencyPairsList',
  id: 8551452234315885248,
  properties: {
    r'pair': PropertySchema(
      id: 0,
      name: r'pair',
      type: IsarType.string,
    ),
    r'registered': PropertySchema(
      id: 1,
      name: r'registered',
      type: IsarType.bool,
    ),
    r'selected': PropertySchema(
      id: 2,
      name: r'selected',
      type: IsarType.bool,
    )
  },
  estimateSize: _favoriteCurrencyPairsListEstimateSize,
  serialize: _favoriteCurrencyPairsListSerialize,
  deserialize: _favoriteCurrencyPairsListDeserialize,
  deserializeProp: _favoriteCurrencyPairsListDeserializeProp,
  idName: r'id',
  indexes: {
    r'pair': IndexSchema(
      id: -2280073220056032088,
      name: r'pair',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pair',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'user': LinkSchema(
      id: -4772442243072011268,
      name: r'user',
      target: r'User',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _favoriteCurrencyPairsListGetId,
  getLinks: _favoriteCurrencyPairsListGetLinks,
  attach: _favoriteCurrencyPairsListAttach,
  version: '3.1.0',
);

int _favoriteCurrencyPairsListEstimateSize(
  FavoriteCurrencyPairsList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pair.length * 3;
  return bytesCount;
}

void _favoriteCurrencyPairsListSerialize(
  FavoriteCurrencyPairsList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.pair);
  writer.writeBool(offsets[1], object.registered);
  writer.writeBool(offsets[2], object.selected);
}

FavoriteCurrencyPairsList _favoriteCurrencyPairsListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoriteCurrencyPairsList();
  object.id = id;
  object.pair = reader.readString(offsets[0]);
  object.registered = reader.readBool(offsets[1]);
  object.selected = reader.readBool(offsets[2]);
  return object;
}

P _favoriteCurrencyPairsListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoriteCurrencyPairsListGetId(FavoriteCurrencyPairsList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoriteCurrencyPairsListGetLinks(
    FavoriteCurrencyPairsList object) {
  return [object.user];
}

void _favoriteCurrencyPairsListAttach(
    IsarCollection<dynamic> col, Id id, FavoriteCurrencyPairsList object) {
  object.id = id;
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
}

extension FavoriteCurrencyPairsListByIndex
    on IsarCollection<FavoriteCurrencyPairsList> {
  Future<FavoriteCurrencyPairsList?> getByPair(String pair) {
    return getByIndex(r'pair', [pair]);
  }

  FavoriteCurrencyPairsList? getByPairSync(String pair) {
    return getByIndexSync(r'pair', [pair]);
  }

  Future<bool> deleteByPair(String pair) {
    return deleteByIndex(r'pair', [pair]);
  }

  bool deleteByPairSync(String pair) {
    return deleteByIndexSync(r'pair', [pair]);
  }

  Future<List<FavoriteCurrencyPairsList?>> getAllByPair(
      List<String> pairValues) {
    final values = pairValues.map((e) => [e]).toList();
    return getAllByIndex(r'pair', values);
  }

  List<FavoriteCurrencyPairsList?> getAllByPairSync(List<String> pairValues) {
    final values = pairValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'pair', values);
  }

  Future<int> deleteAllByPair(List<String> pairValues) {
    final values = pairValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'pair', values);
  }

  int deleteAllByPairSync(List<String> pairValues) {
    final values = pairValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'pair', values);
  }

  Future<Id> putByPair(FavoriteCurrencyPairsList object) {
    return putByIndex(r'pair', object);
  }

  Id putByPairSync(FavoriteCurrencyPairsList object, {bool saveLinks = true}) {
    return putByIndexSync(r'pair', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPair(List<FavoriteCurrencyPairsList> objects) {
    return putAllByIndex(r'pair', objects);
  }

  List<Id> putAllByPairSync(List<FavoriteCurrencyPairsList> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'pair', objects, saveLinks: saveLinks);
  }
}

extension FavoriteCurrencyPairsListQueryWhereSort on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QWhere> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavoriteCurrencyPairsListQueryWhere on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QWhereClause> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterWhereClause> pairEqualTo(String pair) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pair',
        value: [pair],
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterWhereClause> pairNotEqualTo(String pair) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pair',
              lower: [],
              upper: [pair],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pair',
              lower: [pair],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pair',
              lower: [pair],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pair',
              lower: [],
              upper: [pair],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FavoriteCurrencyPairsListQueryFilter on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QFilterCondition> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pair',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
          QAfterFilterCondition>
      pairContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
          QAfterFilterCondition>
      pairMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pair',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pair',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> pairIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pair',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> registeredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registered',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> selectedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selected',
        value: value,
      ));
    });
  }
}

extension FavoriteCurrencyPairsListQueryObject on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QFilterCondition> {}

extension FavoriteCurrencyPairsListQueryLinks on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QFilterCondition> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> user(FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', length, true, length, true);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> userIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> userIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, false, 999999, true);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, length, include);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> userLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', length, include, 999999, true);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

extension FavoriteCurrencyPairsListQuerySortBy on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QSortBy> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByPair() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByPairDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByRegistered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registered', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByRegisteredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registered', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortBySelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortBySelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.desc);
    });
  }
}

extension FavoriteCurrencyPairsListQuerySortThenBy on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QSortThenBy> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByPair() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByPairDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByRegistered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registered', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByRegisteredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registered', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenBySelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenBySelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.desc);
    });
  }
}

extension FavoriteCurrencyPairsListQueryWhereDistinct on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct>
      distinctByPair({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pair', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct>
      distinctByRegistered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registered');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct>
      distinctBySelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selected');
    });
  }
}

extension FavoriteCurrencyPairsListQueryProperty on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QQueryProperty> {
  QueryBuilder<FavoriteCurrencyPairsList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, String, QQueryOperations>
      pairProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pair');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, bool, QQueryOperations>
      registeredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registered');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, bool, QQueryOperations>
      selectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selected');
    });
  }
}
