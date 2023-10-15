// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_pair.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrencyPairCollection on Isar {
  IsarCollection<CurrencyPair> get currencyPairs => this.collection();
}

const CurrencyPairSchema = CollectionSchema(
  name: r'CurrencyPair',
  id: 2774001482398651259,
  properties: {
    r'addedToFavorite': PropertySchema(
      id: 0,
      name: r'addedToFavorite',
      type: IsarType.bool,
    ),
    r'pair': PropertySchema(
      id: 1,
      name: r'pair',
      type: IsarType.string,
    ),
    r'selected': PropertySchema(
      id: 2,
      name: r'selected',
      type: IsarType.bool,
    )
  },
  estimateSize: _currencyPairEstimateSize,
  serialize: _currencyPairSerialize,
  deserialize: _currencyPairDeserialize,
  deserializeProp: _currencyPairDeserializeProp,
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
      id: 6227411217739410893,
      name: r'user',
      target: r'User',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _currencyPairGetId,
  getLinks: _currencyPairGetLinks,
  attach: _currencyPairAttach,
  version: '3.1.0',
);

int _currencyPairEstimateSize(
  CurrencyPair object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pair.length * 3;
  return bytesCount;
}

void _currencyPairSerialize(
  CurrencyPair object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.addedToFavorite);
  writer.writeString(offsets[1], object.pair);
  writer.writeBool(offsets[2], object.selected);
}

CurrencyPair _currencyPairDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrencyPair();
  object.addedToFavorite = reader.readBool(offsets[0]);
  object.id = id;
  object.pair = reader.readString(offsets[1]);
  object.selected = reader.readBool(offsets[2]);
  return object;
}

P _currencyPairDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currencyPairGetId(CurrencyPair object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _currencyPairGetLinks(CurrencyPair object) {
  return [object.user];
}

void _currencyPairAttach(
    IsarCollection<dynamic> col, Id id, CurrencyPair object) {
  object.id = id;
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
}

extension CurrencyPairByIndex on IsarCollection<CurrencyPair> {
  Future<CurrencyPair?> getByPair(String pair) {
    return getByIndex(r'pair', [pair]);
  }

  CurrencyPair? getByPairSync(String pair) {
    return getByIndexSync(r'pair', [pair]);
  }

  Future<bool> deleteByPair(String pair) {
    return deleteByIndex(r'pair', [pair]);
  }

  bool deleteByPairSync(String pair) {
    return deleteByIndexSync(r'pair', [pair]);
  }

  Future<List<CurrencyPair?>> getAllByPair(List<String> pairValues) {
    final values = pairValues.map((e) => [e]).toList();
    return getAllByIndex(r'pair', values);
  }

  List<CurrencyPair?> getAllByPairSync(List<String> pairValues) {
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

  Future<Id> putByPair(CurrencyPair object) {
    return putByIndex(r'pair', object);
  }

  Id putByPairSync(CurrencyPair object, {bool saveLinks = true}) {
    return putByIndexSync(r'pair', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPair(List<CurrencyPair> objects) {
    return putAllByIndex(r'pair', objects);
  }

  List<Id> putAllByPairSync(List<CurrencyPair> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'pair', objects, saveLinks: saveLinks);
  }
}

extension CurrencyPairQueryWhereSort
    on QueryBuilder<CurrencyPair, CurrencyPair, QWhere> {
  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CurrencyPairQueryWhere
    on QueryBuilder<CurrencyPair, CurrencyPair, QWhereClause> {
  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> idBetween(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> pairEqualTo(
      String pair) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pair',
        value: [pair],
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterWhereClause> pairNotEqualTo(
      String pair) {
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

extension CurrencyPairQueryFilter
    on QueryBuilder<CurrencyPair, CurrencyPair, QFilterCondition> {
  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      addedToFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedToFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> pairEqualTo(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      pairGreaterThan(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> pairLessThan(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> pairBetween(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      pairStartsWith(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> pairEndsWith(
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

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> pairContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pair',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> pairMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pair',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      pairIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pair',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      pairIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pair',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      selectedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selected',
        value: value,
      ));
    });
  }
}

extension CurrencyPairQueryObject
    on QueryBuilder<CurrencyPair, CurrencyPair, QFilterCondition> {}

extension CurrencyPairQueryLinks
    on QueryBuilder<CurrencyPair, CurrencyPair, QFilterCondition> {
  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition> user(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      userLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', length, true, length, true);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      userIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      userIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, false, 999999, true);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      userLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, length, include);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      userLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', length, include, 999999, true);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterFilterCondition>
      userLengthBetween(
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

extension CurrencyPairQuerySortBy
    on QueryBuilder<CurrencyPair, CurrencyPair, QSortBy> {
  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy>
      sortByAddedToFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedToFavorite', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy>
      sortByAddedToFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedToFavorite', Sort.desc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> sortByPair() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> sortByPairDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.desc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> sortBySelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> sortBySelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.desc);
    });
  }
}

extension CurrencyPairQuerySortThenBy
    on QueryBuilder<CurrencyPair, CurrencyPair, QSortThenBy> {
  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy>
      thenByAddedToFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedToFavorite', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy>
      thenByAddedToFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedToFavorite', Sort.desc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> thenByPair() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> thenByPairDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pair', Sort.desc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> thenBySelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.asc);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QAfterSortBy> thenBySelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selected', Sort.desc);
    });
  }
}

extension CurrencyPairQueryWhereDistinct
    on QueryBuilder<CurrencyPair, CurrencyPair, QDistinct> {
  QueryBuilder<CurrencyPair, CurrencyPair, QDistinct>
      distinctByAddedToFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedToFavorite');
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QDistinct> distinctByPair(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pair', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyPair, CurrencyPair, QDistinct> distinctBySelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selected');
    });
  }
}

extension CurrencyPairQueryProperty
    on QueryBuilder<CurrencyPair, CurrencyPair, QQueryProperty> {
  QueryBuilder<CurrencyPair, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrencyPair, bool, QQueryOperations> addedToFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedToFavorite');
    });
  }

  QueryBuilder<CurrencyPair, String, QQueryOperations> pairProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pair');
    });
  }

  QueryBuilder<CurrencyPair, bool, QQueryOperations> selectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selected');
    });
  }
}
