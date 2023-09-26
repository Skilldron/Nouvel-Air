// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercice.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ExerciceCategoryCollectionReference
    implements
        ExerciceCategoryQuery,
        FirestoreCollectionReference<ExerciceCategory,
            ExerciceCategoryQuerySnapshot> {
  factory ExerciceCategoryCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ExerciceCategoryCollectionReference;

  static ExerciceCategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ExerciceCategory.fromJson(
        {'name': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    ExerciceCategory value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('name');
  }

  @override
  CollectionReference<ExerciceCategory> get reference;

  @override
  ExerciceCategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ExerciceCategoryDocumentReference> add(ExerciceCategory value);
}

class _$ExerciceCategoryCollectionReference extends _$ExerciceCategoryQuery
    implements ExerciceCategoryCollectionReference {
  factory _$ExerciceCategoryCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ExerciceCategoryCollectionReference._(
      firestore.collection('exercice_categories').withConverter(
            fromFirestore: ExerciceCategoryCollectionReference.fromFirestore,
            toFirestore: ExerciceCategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$ExerciceCategoryCollectionReference._(
    CollectionReference<ExerciceCategory> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<ExerciceCategory> get reference =>
      super.reference as CollectionReference<ExerciceCategory>;

  @override
  ExerciceCategoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ExerciceCategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ExerciceCategoryDocumentReference> add(ExerciceCategory value) {
    return reference
        .add(value)
        .then((ref) => ExerciceCategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExerciceCategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ExerciceCategoryDocumentReference
    extends FirestoreDocumentReference<ExerciceCategory,
        ExerciceCategoryDocumentSnapshot> {
  factory ExerciceCategoryDocumentReference(
          DocumentReference<ExerciceCategory> reference) =
      _$ExerciceCategoryDocumentReference;

  DocumentReference<ExerciceCategory> get reference;

  /// A reference to the [ExerciceCategoryCollectionReference] containing this document.
  ExerciceCategoryCollectionReference get parent {
    return _$ExerciceCategoryCollectionReference(reference.firestore);
  }

  late final ExerciceCollectionReference exercices =
      _$ExerciceCollectionReference(
    reference,
  );

  @override
  Stream<ExerciceCategoryDocumentSnapshot> snapshots();

  @override
  Future<ExerciceCategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? urlImage,
    FieldValue urlImageFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? urlImage,
    FieldValue urlImageFieldValue,
  });
}

class _$ExerciceCategoryDocumentReference extends FirestoreDocumentReference<
        ExerciceCategory, ExerciceCategoryDocumentSnapshot>
    implements ExerciceCategoryDocumentReference {
  _$ExerciceCategoryDocumentReference(this.reference);

  @override
  final DocumentReference<ExerciceCategory> reference;

  /// A reference to the [ExerciceCategoryCollectionReference] containing this document.
  ExerciceCategoryCollectionReference get parent {
    return _$ExerciceCategoryCollectionReference(reference.firestore);
  }

  late final ExerciceCollectionReference exercices =
      _$ExerciceCollectionReference(
    reference,
  );

  @override
  Stream<ExerciceCategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ExerciceCategoryDocumentSnapshot._);
  }

  @override
  Future<ExerciceCategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ExerciceCategoryDocumentSnapshot._);
  }

  @override
  Future<ExerciceCategoryDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(ExerciceCategoryDocumentSnapshot._);
  }

  Future<void> update({
    Object? urlImage = _sentinel,
    FieldValue? urlImageFieldValue,
  }) async {
    assert(
      urlImage == _sentinel || urlImageFieldValue == null,
      "Cannot specify both urlImage and urlImageFieldValue",
    );
    final json = {
      if (urlImage != _sentinel)
        _$ExerciceCategoryFieldMap['urlImage']!: urlImage as String?,
      if (urlImageFieldValue != null)
        _$ExerciceCategoryFieldMap['urlImage']!: urlImageFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? urlImage = _sentinel,
    FieldValue? urlImageFieldValue,
  }) {
    assert(
      urlImage == _sentinel || urlImageFieldValue == null,
      "Cannot specify both urlImage and urlImageFieldValue",
    );
    final json = {
      if (urlImage != _sentinel)
        _$ExerciceCategoryFieldMap['urlImage']!: urlImage as String?,
      if (urlImageFieldValue != null)
        _$ExerciceCategoryFieldMap['urlImage']!: urlImageFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciceCategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ExerciceCategoryQuery
    implements QueryReference<ExerciceCategory, ExerciceCategoryQuerySnapshot> {
  @override
  ExerciceCategoryQuery limit(int limit);

  @override
  ExerciceCategoryQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ExerciceCategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ExerciceCategoryDocumentSnapshot? startAtDocument,
    ExerciceCategoryDocumentSnapshot? endAtDocument,
    ExerciceCategoryDocumentSnapshot? endBeforeDocument,
    ExerciceCategoryDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ExerciceCategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ExerciceCategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExerciceCategoryQuery whereUrlImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  ExerciceCategoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExerciceCategoryDocumentSnapshot? startAtDocument,
    ExerciceCategoryDocumentSnapshot? endAtDocument,
    ExerciceCategoryDocumentSnapshot? endBeforeDocument,
    ExerciceCategoryDocumentSnapshot? startAfterDocument,
  });

  ExerciceCategoryQuery orderByUrlImage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExerciceCategoryDocumentSnapshot? startAtDocument,
    ExerciceCategoryDocumentSnapshot? endAtDocument,
    ExerciceCategoryDocumentSnapshot? endBeforeDocument,
    ExerciceCategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$ExerciceCategoryQuery
    extends QueryReference<ExerciceCategory, ExerciceCategoryQuerySnapshot>
    implements ExerciceCategoryQuery {
  _$ExerciceCategoryQuery(
    this._collection, {
    required Query<ExerciceCategory> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ExerciceCategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(ExerciceCategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ExerciceCategoryQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ExerciceCategoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ExerciceCategoryQuery limit(int limit) {
    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExerciceCategoryQuery limitToLast(int limit) {
    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceCategoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceCategoryDocumentSnapshot? startAtDocument,
    ExerciceCategoryDocumentSnapshot? endAtDocument,
    ExerciceCategoryDocumentSnapshot? endBeforeDocument,
    ExerciceCategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceCategoryQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceCategoryQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceCategoryQuery whereUrlImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceCategoryFieldMap['urlImage']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceCategoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceCategoryDocumentSnapshot? startAtDocument,
    ExerciceCategoryDocumentSnapshot? endAtDocument,
    ExerciceCategoryDocumentSnapshot? endBeforeDocument,
    ExerciceCategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceCategoryQuery orderByUrlImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceCategoryDocumentSnapshot? startAtDocument,
    ExerciceCategoryDocumentSnapshot? endAtDocument,
    ExerciceCategoryDocumentSnapshot? endBeforeDocument,
    ExerciceCategoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ExerciceCategoryFieldMap['urlImage']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceCategoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExerciceCategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ExerciceCategoryDocumentSnapshot
    extends FirestoreDocumentSnapshot<ExerciceCategory> {
  ExerciceCategoryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ExerciceCategory> snapshot;

  @override
  ExerciceCategoryDocumentReference get reference {
    return ExerciceCategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ExerciceCategory? data;
}

class ExerciceCategoryQuerySnapshot extends FirestoreQuerySnapshot<
    ExerciceCategory, ExerciceCategoryQueryDocumentSnapshot> {
  ExerciceCategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ExerciceCategoryQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ExerciceCategory> snapshot,
  ) {
    final docs =
        snapshot.docs.map(ExerciceCategoryQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ExerciceCategoryDocumentSnapshot._,
      );
    }).toList();

    return ExerciceCategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ExerciceCategoryDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ExerciceCategoryDocumentSnapshot Function(DocumentSnapshot<T> doc)
        decodeDoc,
  ) {
    return FirestoreDocumentChange<ExerciceCategoryDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ExerciceCategory> snapshot;

  @override
  final List<ExerciceCategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ExerciceCategoryDocumentSnapshot>>
      docChanges;
}

class ExerciceCategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ExerciceCategory>
    implements ExerciceCategoryDocumentSnapshot {
  ExerciceCategoryQueryDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ExerciceCategory> snapshot;

  @override
  final ExerciceCategory data;

  @override
  ExerciceCategoryDocumentReference get reference {
    return ExerciceCategoryDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ExerciceCollectionReference
    implements
        ExerciceQuery,
        FirestoreCollectionReference<Exercice, ExerciceQuerySnapshot> {
  factory ExerciceCollectionReference(
    DocumentReference<ExerciceCategory> parent,
  ) = _$ExerciceCollectionReference;

  static Exercice fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Exercice.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Exercice value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Exercice> get reference;

  /// A reference to the containing [ExerciceCategoryDocumentReference] if this is a subcollection.
  ExerciceCategoryDocumentReference get parent;

  @override
  ExerciceDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ExerciceDocumentReference> add(Exercice value);
}

class _$ExerciceCollectionReference extends _$ExerciceQuery
    implements ExerciceCollectionReference {
  factory _$ExerciceCollectionReference(
    DocumentReference<ExerciceCategory> parent,
  ) {
    return _$ExerciceCollectionReference._(
      ExerciceCategoryDocumentReference(parent),
      parent.collection('exercices').withConverter(
            fromFirestore: ExerciceCollectionReference.fromFirestore,
            toFirestore: ExerciceCollectionReference.toFirestore,
          ),
    );
  }

  _$ExerciceCollectionReference._(
    this.parent,
    CollectionReference<Exercice> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final ExerciceCategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Exercice> get reference =>
      super.reference as CollectionReference<Exercice>;

  @override
  ExerciceDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ExerciceDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ExerciceDocumentReference> add(Exercice value) {
    return reference.add(value).then((ref) => ExerciceDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExerciceCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ExerciceDocumentReference
    extends FirestoreDocumentReference<Exercice, ExerciceDocumentSnapshot> {
  factory ExerciceDocumentReference(DocumentReference<Exercice> reference) =
      _$ExerciceDocumentReference;

  DocumentReference<Exercice> get reference;

  /// A reference to the [ExerciceCollectionReference] containing this document.
  ExerciceCollectionReference get parent {
    return _$ExerciceCollectionReference(
      reference.parent.parent!.withConverter<ExerciceCategory>(
        fromFirestore: ExerciceCategoryCollectionReference.fromFirestore,
        toFirestore: ExerciceCategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExerciceDocumentSnapshot> snapshots();

  @override
  Future<ExerciceDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String instruction,
    FieldValue instructionFieldValue,
    String muscleTarget,
    FieldValue muscleTargetFieldValue,
    String? urlGif,
    FieldValue urlGifFieldValue,
    String? urlImage,
    FieldValue urlImageFieldValue,
    String? urlVideo,
    FieldValue urlVideoFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String instruction,
    FieldValue instructionFieldValue,
    String muscleTarget,
    FieldValue muscleTargetFieldValue,
    String? urlGif,
    FieldValue urlGifFieldValue,
    String? urlImage,
    FieldValue urlImageFieldValue,
    String? urlVideo,
    FieldValue urlVideoFieldValue,
  });
}

class _$ExerciceDocumentReference
    extends FirestoreDocumentReference<Exercice, ExerciceDocumentSnapshot>
    implements ExerciceDocumentReference {
  _$ExerciceDocumentReference(this.reference);

  @override
  final DocumentReference<Exercice> reference;

  /// A reference to the [ExerciceCollectionReference] containing this document.
  ExerciceCollectionReference get parent {
    return _$ExerciceCollectionReference(
      reference.parent.parent!.withConverter<ExerciceCategory>(
        fromFirestore: ExerciceCategoryCollectionReference.fromFirestore,
        toFirestore: ExerciceCategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExerciceDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ExerciceDocumentSnapshot._);
  }

  @override
  Future<ExerciceDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ExerciceDocumentSnapshot._);
  }

  @override
  Future<ExerciceDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(ExerciceDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? instruction = _sentinel,
    FieldValue? instructionFieldValue,
    Object? muscleTarget = _sentinel,
    FieldValue? muscleTargetFieldValue,
    Object? urlGif = _sentinel,
    FieldValue? urlGifFieldValue,
    Object? urlImage = _sentinel,
    FieldValue? urlImageFieldValue,
    Object? urlVideo = _sentinel,
    FieldValue? urlVideoFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      instruction == _sentinel || instructionFieldValue == null,
      "Cannot specify both instruction and instructionFieldValue",
    );
    assert(
      muscleTarget == _sentinel || muscleTargetFieldValue == null,
      "Cannot specify both muscleTarget and muscleTargetFieldValue",
    );
    assert(
      urlGif == _sentinel || urlGifFieldValue == null,
      "Cannot specify both urlGif and urlGifFieldValue",
    );
    assert(
      urlImage == _sentinel || urlImageFieldValue == null,
      "Cannot specify both urlImage and urlImageFieldValue",
    );
    assert(
      urlVideo == _sentinel || urlVideoFieldValue == null,
      "Cannot specify both urlVideo and urlVideoFieldValue",
    );
    final json = {
      if (name != _sentinel) _$ExerciceFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$ExerciceFieldMap['name']!: nameFieldValue,
      if (instruction != _sentinel)
        _$ExerciceFieldMap['instruction']!: instruction as String,
      if (instructionFieldValue != null)
        _$ExerciceFieldMap['instruction']!: instructionFieldValue,
      if (muscleTarget != _sentinel)
        _$ExerciceFieldMap['muscleTarget']!: muscleTarget as String,
      if (muscleTargetFieldValue != null)
        _$ExerciceFieldMap['muscleTarget']!: muscleTargetFieldValue,
      if (urlGif != _sentinel) _$ExerciceFieldMap['urlGif']!: urlGif as String?,
      if (urlGifFieldValue != null)
        _$ExerciceFieldMap['urlGif']!: urlGifFieldValue,
      if (urlImage != _sentinel)
        _$ExerciceFieldMap['urlImage']!: urlImage as String?,
      if (urlImageFieldValue != null)
        _$ExerciceFieldMap['urlImage']!: urlImageFieldValue,
      if (urlVideo != _sentinel)
        _$ExerciceFieldMap['urlVideo']!: urlVideo as String?,
      if (urlVideoFieldValue != null)
        _$ExerciceFieldMap['urlVideo']!: urlVideoFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? instruction = _sentinel,
    FieldValue? instructionFieldValue,
    Object? muscleTarget = _sentinel,
    FieldValue? muscleTargetFieldValue,
    Object? urlGif = _sentinel,
    FieldValue? urlGifFieldValue,
    Object? urlImage = _sentinel,
    FieldValue? urlImageFieldValue,
    Object? urlVideo = _sentinel,
    FieldValue? urlVideoFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      instruction == _sentinel || instructionFieldValue == null,
      "Cannot specify both instruction and instructionFieldValue",
    );
    assert(
      muscleTarget == _sentinel || muscleTargetFieldValue == null,
      "Cannot specify both muscleTarget and muscleTargetFieldValue",
    );
    assert(
      urlGif == _sentinel || urlGifFieldValue == null,
      "Cannot specify both urlGif and urlGifFieldValue",
    );
    assert(
      urlImage == _sentinel || urlImageFieldValue == null,
      "Cannot specify both urlImage and urlImageFieldValue",
    );
    assert(
      urlVideo == _sentinel || urlVideoFieldValue == null,
      "Cannot specify both urlVideo and urlVideoFieldValue",
    );
    final json = {
      if (name != _sentinel) _$ExerciceFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$ExerciceFieldMap['name']!: nameFieldValue,
      if (instruction != _sentinel)
        _$ExerciceFieldMap['instruction']!: instruction as String,
      if (instructionFieldValue != null)
        _$ExerciceFieldMap['instruction']!: instructionFieldValue,
      if (muscleTarget != _sentinel)
        _$ExerciceFieldMap['muscleTarget']!: muscleTarget as String,
      if (muscleTargetFieldValue != null)
        _$ExerciceFieldMap['muscleTarget']!: muscleTargetFieldValue,
      if (urlGif != _sentinel) _$ExerciceFieldMap['urlGif']!: urlGif as String?,
      if (urlGifFieldValue != null)
        _$ExerciceFieldMap['urlGif']!: urlGifFieldValue,
      if (urlImage != _sentinel)
        _$ExerciceFieldMap['urlImage']!: urlImage as String?,
      if (urlImageFieldValue != null)
        _$ExerciceFieldMap['urlImage']!: urlImageFieldValue,
      if (urlVideo != _sentinel)
        _$ExerciceFieldMap['urlVideo']!: urlVideo as String?,
      if (urlVideoFieldValue != null)
        _$ExerciceFieldMap['urlVideo']!: urlVideoFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciceDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ExerciceQuery
    implements QueryReference<Exercice, ExerciceQuerySnapshot> {
  @override
  ExerciceQuery limit(int limit);

  @override
  ExerciceQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ExerciceQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ExerciceQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ExerciceQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExerciceQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExerciceQuery whereInstruction({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExerciceQuery whereMuscleTarget({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ExerciceQuery whereUrlGif({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ExerciceQuery whereUrlImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ExerciceQuery whereUrlVideo({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  ExerciceQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  ExerciceQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  ExerciceQuery orderByInstruction({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  ExerciceQuery orderByMuscleTarget({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  ExerciceQuery orderByUrlGif({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  ExerciceQuery orderByUrlImage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });

  ExerciceQuery orderByUrlVideo({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  });
}

class _$ExerciceQuery extends QueryReference<Exercice, ExerciceQuerySnapshot>
    implements ExerciceQuery {
  _$ExerciceQuery(
    this._collection, {
    required Query<Exercice> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ExerciceQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(ExerciceQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ExerciceQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ExerciceQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ExerciceQuery limit(int limit) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExerciceQuery limitToLast(int limit) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereInstruction({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceFieldMap['instruction']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereMuscleTarget({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceFieldMap['muscleTarget']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereUrlGif({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceFieldMap['urlGif']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereUrlImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceFieldMap['urlImage']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery whereUrlVideo({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExerciceFieldMap['urlVideo']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ExerciceQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ExerciceFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery orderByInstruction({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ExerciceFieldMap['instruction']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery orderByMuscleTarget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ExerciceFieldMap['muscleTarget']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery orderByUrlGif({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ExerciceFieldMap['urlGif']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery orderByUrlImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ExerciceFieldMap['urlImage']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ExerciceQuery orderByUrlVideo({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExerciceDocumentSnapshot? startAtDocument,
    ExerciceDocumentSnapshot? endAtDocument,
    ExerciceDocumentSnapshot? endBeforeDocument,
    ExerciceDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ExerciceFieldMap['urlVideo']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExerciceQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExerciceQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ExerciceDocumentSnapshot extends FirestoreDocumentSnapshot<Exercice> {
  ExerciceDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Exercice> snapshot;

  @override
  ExerciceDocumentReference get reference {
    return ExerciceDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Exercice? data;
}

class ExerciceQuerySnapshot
    extends FirestoreQuerySnapshot<Exercice, ExerciceQueryDocumentSnapshot> {
  ExerciceQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ExerciceQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Exercice> snapshot,
  ) {
    final docs = snapshot.docs.map(ExerciceQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ExerciceDocumentSnapshot._,
      );
    }).toList();

    return ExerciceQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ExerciceDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ExerciceDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ExerciceDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Exercice> snapshot;

  @override
  final List<ExerciceQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ExerciceDocumentSnapshot>> docChanges;
}

class ExerciceQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Exercice>
    implements ExerciceDocumentSnapshot {
  ExerciceQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Exercice> snapshot;

  @override
  final Exercice data;

  @override
  ExerciceDocumentReference get reference {
    return ExerciceDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciceCategory _$ExerciceCategoryFromJson(Map<String, dynamic> json) =>
    ExerciceCategory(
      name: $enumDecode(_$ExerciseTargetEnumMap, json['name']),
      urlImage: json['urlImage'] as String?,
    );

const _$ExerciceCategoryFieldMap = <String, String>{
  'name': 'name',
  'urlImage': 'urlImage',
};

Map<String, dynamic> _$ExerciceCategoryToJson(ExerciceCategory instance) =>
    <String, dynamic>{
      'name': _$ExerciseTargetEnumMap[instance.name]!,
      'urlImage': instance.urlImage,
    };

const _$ExerciseTargetEnumMap = {
  ExerciseTarget.chest: 'chest',
  ExerciseTarget.back: 'back',
  ExerciseTarget.legs: 'legs',
  ExerciseTarget.shoulders: 'shoulders',
  ExerciseTarget.biceps: 'biceps',
  ExerciseTarget.triceps: 'triceps',
  ExerciseTarget.abs: 'abs',
  ExerciseTarget.cardio: 'cardio',
  ExerciseTarget.fullBody: 'fullBody',
  ExerciseTarget.other: 'other',
};

Exercice _$ExerciceFromJson(Map<String, dynamic> json) => Exercice(
      id: json['id'] as String,
      name: json['name'] as String,
      instruction: json['instruction'] as String,
      muscleTarget: json['muscleTarget'] as String,
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      urlGif: json['urlGif'] as String?,
      urlImage: json['urlImage'] as String?,
      urlVideo: json['urlVideo'] as String?,
    );

const _$ExerciceFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'instruction': 'instruction',
  'muscleTarget': 'muscleTarget',
  'difficulty': 'difficulty',
  'urlGif': 'urlGif',
  'urlImage': 'urlImage',
  'urlVideo': 'urlVideo',
};

Map<String, dynamic> _$ExerciceToJson(Exercice instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instruction': instance.instruction,
      'muscleTarget': instance.muscleTarget,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'urlGif': instance.urlGif,
      'urlImage': instance.urlImage,
      'urlVideo': instance.urlVideo,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};
