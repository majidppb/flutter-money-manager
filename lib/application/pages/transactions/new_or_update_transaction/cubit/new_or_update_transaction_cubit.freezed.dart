// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_or_update_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewOrUpdateTransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOrUpdateTransactionStateCopyWith<$Res> {
  factory $NewOrUpdateTransactionStateCopyWith(
          NewOrUpdateTransactionState value,
          $Res Function(NewOrUpdateTransactionState) then) =
      _$NewOrUpdateTransactionStateCopyWithImpl<$Res,
          NewOrUpdateTransactionState>;
}

/// @nodoc
class _$NewOrUpdateTransactionStateCopyWithImpl<$Res,
        $Val extends NewOrUpdateTransactionState>
    implements $NewOrUpdateTransactionStateCopyWith<$Res> {
  _$NewOrUpdateTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NewOrUpdateTransactionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NewOrUpdateTransactionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements NewOrUpdateTransactionState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NewOrUpdateTransactionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'NewOrUpdateTransactionState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)
        loaded,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Loaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Loaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements NewOrUpdateTransactionState {
  const factory Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {NewOrUpdateStatus status,
      String? purpose,
      double? amount,
      DateTime? date,
      CategoryType? type,
      Category? category,
      List<Category> categories});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NewOrUpdateTransactionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? purpose = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? categories = null,
  }) {
    return _then(_$LoadedImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NewOrUpdateStatus,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(
      {this.status = NewOrUpdateStatus.editing,
      this.purpose,
      this.amount,
      this.date,
      this.type,
      this.category,
      final List<Category> categories = const []})
      : _categories = categories;

  @override
  @JsonKey()
  final NewOrUpdateStatus status;
  @override
  final String? purpose;
  @override
  final double? amount;
  @override
  final DateTime? date;
  @override
  final CategoryType? type;
  @override
  final Category? category;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'NewOrUpdateTransactionState.loaded(status: $status, purpose: $purpose, amount: $amount, date: $date, type: $type, category: $category, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, purpose, amount, date,
      type, category, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)
        loaded,
  }) {
    return loaded(status, purpose, amount, date, type, category, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
  }) {
    return loaded?.call(
        status, purpose, amount, date, type, category, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            NewOrUpdateStatus status,
            String? purpose,
            double? amount,
            DateTime? date,
            CategoryType? type,
            Category? category,
            List<Category> categories)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(status, purpose, amount, date, type, category, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements NewOrUpdateTransactionState {
  const factory Loaded(
      {final NewOrUpdateStatus status,
      final String? purpose,
      final double? amount,
      final DateTime? date,
      final CategoryType? type,
      final Category? category,
      final List<Category> categories}) = _$LoadedImpl;

  NewOrUpdateStatus get status;
  String? get purpose;
  double? get amount;
  DateTime? get date;
  CategoryType? get type;
  Category? get category;
  List<Category> get categories;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
