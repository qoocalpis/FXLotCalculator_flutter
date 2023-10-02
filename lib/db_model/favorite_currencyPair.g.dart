// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_currencyPair.dart';

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
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _favoriteCurrencyPairsListEstimateSize,
  serialize: _favoriteCurrencyPairsListSerialize,
  deserialize: _favoriteCurrencyPairsListDeserialize,
  deserializeProp: _favoriteCurrencyPairsListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'favoriteCurrencyPairsList': LinkSchema(
      id: -2273368680421455722,
      name: r'favoriteCurrencyPairsList',
      target: r'User',
      single: true,
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
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _favoriteCurrencyPairsListSerialize(
  FavoriteCurrencyPairsList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeString(offsets[1], object.name);
}

FavoriteCurrencyPairsList _favoriteCurrencyPairsListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoriteCurrencyPairsList();
  object.age = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[1]);
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
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoriteCurrencyPairsListGetId(FavoriteCurrencyPairsList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoriteCurrencyPairsListGetLinks(
    FavoriteCurrencyPairsList object) {
  return [object.favoriteCurrencyPairsList];
}

void _favoriteCurrencyPairsListAttach(
    IsarCollection<dynamic> col, Id id, FavoriteCurrencyPairsList object) {
  object.id = id;
  object.favoriteCurrencyPairsList.attach(
      col, col.isar.collection<User>(), r'favoriteCurrencyPairsList', id);
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
}

extension FavoriteCurrencyPairsListQueryFilter on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QFilterCondition> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> ageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameLessThan(
    String? value, {
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
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

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FavoriteCurrencyPairsListQueryObject on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QFilterCondition> {}

extension FavoriteCurrencyPairsListQueryLinks on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QFilterCondition> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> favoriteCurrencyPairsList(FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'favoriteCurrencyPairsList');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterFilterCondition> favoriteCurrencyPairsListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'favoriteCurrencyPairsList', 0, true, 0, true);
    });
  }
}

extension FavoriteCurrencyPairsListQuerySortBy on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QSortBy> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FavoriteCurrencyPairsListQuerySortThenBy on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QSortThenBy> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

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
      QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList,
      QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FavoriteCurrencyPairsListQueryWhereDistinct on QueryBuilder<
    FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct> {
  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, FavoriteCurrencyPairsList, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
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

  QueryBuilder<FavoriteCurrencyPairsList, int?, QQueryOperations>
      ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<FavoriteCurrencyPairsList, String?, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
