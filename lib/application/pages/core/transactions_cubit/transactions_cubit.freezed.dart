// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(Summary summary) transactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(Summary summary)? transactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(Summary summary)? transactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsStateError value) error,
    required TResult Function(TransactionsStateLoading value) loading,
    required TResult Function(TransactionsStateLoaded value) transactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsStateError value)? error,
    TResult? Function(TransactionsStateLoading value)? loading,
    TResult? Function(TransactionsStateLoaded value)? transactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsStateError value)? error,
    TResult Function(TransactionsStateLoading value)? loading,
    TResult Function(TransactionsStateLoaded value)? transactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransactionsStateErrorImplCopyWith<$Res> {
  factory _$$TransactionsStateErrorImplCopyWith(
          _$TransactionsStateErrorImpl value,
          $Res Function(_$TransactionsStateErrorImpl) then) =
      __$$TransactionsStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsStateErrorImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsStateErrorImpl>
    implements _$$TransactionsStateErrorImplCopyWith<$Res> {
  __$$TransactionsStateErrorImplCopyWithImpl(
      _$TransactionsStateErrorImpl _value,
      $Res Function(_$TransactionsStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionsStateErrorImpl implements TransactionsStateError {
  const _$TransactionsStateErrorImpl();

  @override
  String toString() {
    return 'TransactionsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(Summary summary) transactions,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(Summary summary)? transactions,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(Summary summary)? transactions,
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
    required TResult Function(TransactionsStateError value) error,
    required TResult Function(TransactionsStateLoading value) loading,
    required TResult Function(TransactionsStateLoaded value) transactions,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsStateError value)? error,
    TResult? Function(TransactionsStateLoading value)? loading,
    TResult? Function(TransactionsStateLoaded value)? transactions,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsStateError value)? error,
    TResult Function(TransactionsStateLoading value)? loading,
    TResult Function(TransactionsStateLoaded value)? transactions,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TransactionsStateError implements TransactionsState {
  const factory TransactionsStateError() = _$TransactionsStateErrorImpl;
}

/// @nodoc
abstract class _$$TransactionsStateLoadingImplCopyWith<$Res> {
  factory _$$TransactionsStateLoadingImplCopyWith(
          _$TransactionsStateLoadingImpl value,
          $Res Function(_$TransactionsStateLoadingImpl) then) =
      __$$TransactionsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsStateLoadingImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res,
        _$TransactionsStateLoadingImpl>
    implements _$$TransactionsStateLoadingImplCopyWith<$Res> {
  __$$TransactionsStateLoadingImplCopyWithImpl(
      _$TransactionsStateLoadingImpl _value,
      $Res Function(_$TransactionsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionsStateLoadingImpl implements TransactionsStateLoading {
  const _$TransactionsStateLoadingImpl();

  @override
  String toString() {
    return 'TransactionsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(Summary summary) transactions,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(Summary summary)? transactions,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(Summary summary)? transactions,
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
    required TResult Function(TransactionsStateError value) error,
    required TResult Function(TransactionsStateLoading value) loading,
    required TResult Function(TransactionsStateLoaded value) transactions,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsStateError value)? error,
    TResult? Function(TransactionsStateLoading value)? loading,
    TResult? Function(TransactionsStateLoaded value)? transactions,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsStateError value)? error,
    TResult Function(TransactionsStateLoading value)? loading,
    TResult Function(TransactionsStateLoaded value)? transactions,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransactionsStateLoading implements TransactionsState {
  const factory TransactionsStateLoading() = _$TransactionsStateLoadingImpl;
}

/// @nodoc
abstract class _$$TransactionsStateLoadedImplCopyWith<$Res> {
  factory _$$TransactionsStateLoadedImplCopyWith(
          _$TransactionsStateLoadedImpl value,
          $Res Function(_$TransactionsStateLoadedImpl) then) =
      __$$TransactionsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Summary summary});
}

/// @nodoc
class __$$TransactionsStateLoadedImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsStateLoadedImpl>
    implements _$$TransactionsStateLoadedImplCopyWith<$Res> {
  __$$TransactionsStateLoadedImplCopyWithImpl(
      _$TransactionsStateLoadedImpl _value,
      $Res Function(_$TransactionsStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
  }) {
    return _then(_$TransactionsStateLoadedImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary,
    ));
  }
}

/// @nodoc

class _$TransactionsStateLoadedImpl implements TransactionsStateLoaded {
  const _$TransactionsStateLoadedImpl({required this.summary});

  @override
  final Summary summary;

  @override
  String toString() {
    return 'TransactionsState.transactions(summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsStateLoadedImpl &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsStateLoadedImplCopyWith<_$TransactionsStateLoadedImpl>
      get copyWith => __$$TransactionsStateLoadedImplCopyWithImpl<
          _$TransactionsStateLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(Summary summary) transactions,
  }) {
    return transactions(summary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(Summary summary)? transactions,
  }) {
    return transactions?.call(summary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(Summary summary)? transactions,
    required TResult orElse(),
  }) {
    if (transactions != null) {
      return transactions(summary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsStateError value) error,
    required TResult Function(TransactionsStateLoading value) loading,
    required TResult Function(TransactionsStateLoaded value) transactions,
  }) {
    return transactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsStateError value)? error,
    TResult? Function(TransactionsStateLoading value)? loading,
    TResult? Function(TransactionsStateLoaded value)? transactions,
  }) {
    return transactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsStateError value)? error,
    TResult Function(TransactionsStateLoading value)? loading,
    TResult Function(TransactionsStateLoaded value)? transactions,
    required TResult orElse(),
  }) {
    if (transactions != null) {
      return transactions(this);
    }
    return orElse();
  }
}

abstract class TransactionsStateLoaded implements TransactionsState {
  const factory TransactionsStateLoaded({required final Summary summary}) =
      _$TransactionsStateLoadedImpl;

  Summary get summary;
  @JsonKey(ignore: true)
  _$$TransactionsStateLoadedImplCopyWith<_$TransactionsStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
