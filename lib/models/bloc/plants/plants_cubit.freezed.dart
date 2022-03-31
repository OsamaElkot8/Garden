// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plants_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlantsStateTearOff {
  const _$PlantsStateTearOff();

  Idle idle() {
    return const Idle();
  }

  FetchLoading fetchLoading() {
    return const FetchLoading();
  }

  FetchLoaded fetchLoaded(List<Plant> plants) {
    return FetchLoaded(
      plants,
    );
  }

  FetchLoadingError fetchLoadingError(String reason) {
    return FetchLoadingError(
      reason,
    );
  }

  SearchLoading searchLoading() {
    return const SearchLoading();
  }

  SearchLoaded searchLoaded(List<Plant> plants) {
    return SearchLoaded(
      plants,
    );
  }

  SearchLoadingError searchLoadingError(String reason) {
    return SearchLoadingError(
      reason,
    );
  }
}

/// @nodoc
const $PlantsState = _$PlantsStateTearOff();

/// @nodoc
mixin _$PlantsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantsStateCopyWith<$Res> {
  factory $PlantsStateCopyWith(
          PlantsState value, $Res Function(PlantsState) then) =
      _$PlantsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlantsStateCopyWithImpl<$Res> implements $PlantsStateCopyWith<$Res> {
  _$PlantsStateCopyWithImpl(this._value, this._then);

  final PlantsState _value;
  // ignore: unused_field
  final $Res Function(PlantsState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$PlantsStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'PlantsState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements PlantsState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $FetchLoadingCopyWith<$Res> {
  factory $FetchLoadingCopyWith(
          FetchLoading value, $Res Function(FetchLoading) then) =
      _$FetchLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchLoadingCopyWithImpl<$Res> extends _$PlantsStateCopyWithImpl<$Res>
    implements $FetchLoadingCopyWith<$Res> {
  _$FetchLoadingCopyWithImpl(
      FetchLoading _value, $Res Function(FetchLoading) _then)
      : super(_value, (v) => _then(v as FetchLoading));

  @override
  FetchLoading get _value => super._value as FetchLoading;
}

/// @nodoc

class _$FetchLoading implements FetchLoading {
  const _$FetchLoading();

  @override
  String toString() {
    return 'PlantsState.fetchLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return fetchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return fetchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (fetchLoading != null) {
      return fetchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return fetchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return fetchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (fetchLoading != null) {
      return fetchLoading(this);
    }
    return orElse();
  }
}

abstract class FetchLoading implements PlantsState {
  const factory FetchLoading() = _$FetchLoading;
}

/// @nodoc
abstract class $FetchLoadedCopyWith<$Res> {
  factory $FetchLoadedCopyWith(
          FetchLoaded value, $Res Function(FetchLoaded) then) =
      _$FetchLoadedCopyWithImpl<$Res>;
  $Res call({List<Plant> plants});
}

/// @nodoc
class _$FetchLoadedCopyWithImpl<$Res> extends _$PlantsStateCopyWithImpl<$Res>
    implements $FetchLoadedCopyWith<$Res> {
  _$FetchLoadedCopyWithImpl(
      FetchLoaded _value, $Res Function(FetchLoaded) _then)
      : super(_value, (v) => _then(v as FetchLoaded));

  @override
  FetchLoaded get _value => super._value as FetchLoaded;

  @override
  $Res call({
    Object? plants = freezed,
  }) {
    return _then(FetchLoaded(
      plants == freezed
          ? _value.plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<Plant>,
    ));
  }
}

/// @nodoc

class _$FetchLoaded implements FetchLoaded {
  const _$FetchLoaded(this.plants);

  @override
  final List<Plant> plants;

  @override
  String toString() {
    return 'PlantsState.fetchLoaded(plants: $plants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchLoaded &&
            const DeepCollectionEquality().equals(other.plants, plants));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(plants));

  @JsonKey(ignore: true)
  @override
  $FetchLoadedCopyWith<FetchLoaded> get copyWith =>
      _$FetchLoadedCopyWithImpl<FetchLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return fetchLoaded(plants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return fetchLoaded?.call(plants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (fetchLoaded != null) {
      return fetchLoaded(plants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return fetchLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return fetchLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (fetchLoaded != null) {
      return fetchLoaded(this);
    }
    return orElse();
  }
}

abstract class FetchLoaded implements PlantsState {
  const factory FetchLoaded(List<Plant> plants) = _$FetchLoaded;

  List<Plant> get plants;
  @JsonKey(ignore: true)
  $FetchLoadedCopyWith<FetchLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchLoadingErrorCopyWith<$Res> {
  factory $FetchLoadingErrorCopyWith(
          FetchLoadingError value, $Res Function(FetchLoadingError) then) =
      _$FetchLoadingErrorCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$FetchLoadingErrorCopyWithImpl<$Res>
    extends _$PlantsStateCopyWithImpl<$Res>
    implements $FetchLoadingErrorCopyWith<$Res> {
  _$FetchLoadingErrorCopyWithImpl(
      FetchLoadingError _value, $Res Function(FetchLoadingError) _then)
      : super(_value, (v) => _then(v as FetchLoadingError));

  @override
  FetchLoadingError get _value => super._value as FetchLoadingError;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(FetchLoadingError(
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchLoadingError implements FetchLoadingError {
  const _$FetchLoadingError(this.reason);

  @override
  final String reason;

  @override
  String toString() {
    return 'PlantsState.fetchLoadingError(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchLoadingError &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  $FetchLoadingErrorCopyWith<FetchLoadingError> get copyWith =>
      _$FetchLoadingErrorCopyWithImpl<FetchLoadingError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return fetchLoadingError(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return fetchLoadingError?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (fetchLoadingError != null) {
      return fetchLoadingError(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return fetchLoadingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return fetchLoadingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (fetchLoadingError != null) {
      return fetchLoadingError(this);
    }
    return orElse();
  }
}

abstract class FetchLoadingError implements PlantsState {
  const factory FetchLoadingError(String reason) = _$FetchLoadingError;

  String get reason;
  @JsonKey(ignore: true)
  $FetchLoadingErrorCopyWith<FetchLoadingError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLoadingCopyWith<$Res> {
  factory $SearchLoadingCopyWith(
          SearchLoading value, $Res Function(SearchLoading) then) =
      _$SearchLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchLoadingCopyWithImpl<$Res> extends _$PlantsStateCopyWithImpl<$Res>
    implements $SearchLoadingCopyWith<$Res> {
  _$SearchLoadingCopyWithImpl(
      SearchLoading _value, $Res Function(SearchLoading) _then)
      : super(_value, (v) => _then(v as SearchLoading));

  @override
  SearchLoading get _value => super._value as SearchLoading;
}

/// @nodoc

class _$SearchLoading implements SearchLoading {
  const _$SearchLoading();

  @override
  String toString() {
    return 'PlantsState.searchLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return searchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return searchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return searchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return searchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading(this);
    }
    return orElse();
  }
}

abstract class SearchLoading implements PlantsState {
  const factory SearchLoading() = _$SearchLoading;
}

/// @nodoc
abstract class $SearchLoadedCopyWith<$Res> {
  factory $SearchLoadedCopyWith(
          SearchLoaded value, $Res Function(SearchLoaded) then) =
      _$SearchLoadedCopyWithImpl<$Res>;
  $Res call({List<Plant> plants});
}

/// @nodoc
class _$SearchLoadedCopyWithImpl<$Res> extends _$PlantsStateCopyWithImpl<$Res>
    implements $SearchLoadedCopyWith<$Res> {
  _$SearchLoadedCopyWithImpl(
      SearchLoaded _value, $Res Function(SearchLoaded) _then)
      : super(_value, (v) => _then(v as SearchLoaded));

  @override
  SearchLoaded get _value => super._value as SearchLoaded;

  @override
  $Res call({
    Object? plants = freezed,
  }) {
    return _then(SearchLoaded(
      plants == freezed
          ? _value.plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<Plant>,
    ));
  }
}

/// @nodoc

class _$SearchLoaded implements SearchLoaded {
  const _$SearchLoaded(this.plants);

  @override
  final List<Plant> plants;

  @override
  String toString() {
    return 'PlantsState.searchLoaded(plants: $plants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLoaded &&
            const DeepCollectionEquality().equals(other.plants, plants));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(plants));

  @JsonKey(ignore: true)
  @override
  $SearchLoadedCopyWith<SearchLoaded> get copyWith =>
      _$SearchLoadedCopyWithImpl<SearchLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return searchLoaded(plants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return searchLoaded?.call(plants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (searchLoaded != null) {
      return searchLoaded(plants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return searchLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return searchLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (searchLoaded != null) {
      return searchLoaded(this);
    }
    return orElse();
  }
}

abstract class SearchLoaded implements PlantsState {
  const factory SearchLoaded(List<Plant> plants) = _$SearchLoaded;

  List<Plant> get plants;
  @JsonKey(ignore: true)
  $SearchLoadedCopyWith<SearchLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLoadingErrorCopyWith<$Res> {
  factory $SearchLoadingErrorCopyWith(
          SearchLoadingError value, $Res Function(SearchLoadingError) then) =
      _$SearchLoadingErrorCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$SearchLoadingErrorCopyWithImpl<$Res>
    extends _$PlantsStateCopyWithImpl<$Res>
    implements $SearchLoadingErrorCopyWith<$Res> {
  _$SearchLoadingErrorCopyWithImpl(
      SearchLoadingError _value, $Res Function(SearchLoadingError) _then)
      : super(_value, (v) => _then(v as SearchLoadingError));

  @override
  SearchLoadingError get _value => super._value as SearchLoadingError;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(SearchLoadingError(
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchLoadingError implements SearchLoadingError {
  const _$SearchLoadingError(this.reason);

  @override
  final String reason;

  @override
  String toString() {
    return 'PlantsState.searchLoadingError(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLoadingError &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  $SearchLoadingErrorCopyWith<SearchLoadingError> get copyWith =>
      _$SearchLoadingErrorCopyWithImpl<SearchLoadingError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() fetchLoading,
    required TResult Function(List<Plant> plants) fetchLoaded,
    required TResult Function(String reason) fetchLoadingError,
    required TResult Function() searchLoading,
    required TResult Function(List<Plant> plants) searchLoaded,
    required TResult Function(String reason) searchLoadingError,
  }) {
    return searchLoadingError(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
  }) {
    return searchLoadingError?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? fetchLoading,
    TResult Function(List<Plant> plants)? fetchLoaded,
    TResult Function(String reason)? fetchLoadingError,
    TResult Function()? searchLoading,
    TResult Function(List<Plant> plants)? searchLoaded,
    TResult Function(String reason)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (searchLoadingError != null) {
      return searchLoadingError(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(FetchLoading value) fetchLoading,
    required TResult Function(FetchLoaded value) fetchLoaded,
    required TResult Function(FetchLoadingError value) fetchLoadingError,
    required TResult Function(SearchLoading value) searchLoading,
    required TResult Function(SearchLoaded value) searchLoaded,
    required TResult Function(SearchLoadingError value) searchLoadingError,
  }) {
    return searchLoadingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
  }) {
    return searchLoadingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(FetchLoading value)? fetchLoading,
    TResult Function(FetchLoaded value)? fetchLoaded,
    TResult Function(FetchLoadingError value)? fetchLoadingError,
    TResult Function(SearchLoading value)? searchLoading,
    TResult Function(SearchLoaded value)? searchLoaded,
    TResult Function(SearchLoadingError value)? searchLoadingError,
    required TResult orElse(),
  }) {
    if (searchLoadingError != null) {
      return searchLoadingError(this);
    }
    return orElse();
  }
}

abstract class SearchLoadingError implements PlantsState {
  const factory SearchLoadingError(String reason) = _$SearchLoadingError;

  String get reason;
  @JsonKey(ignore: true)
  $SearchLoadingErrorCopyWith<SearchLoadingError> get copyWith =>
      throw _privateConstructorUsedError;
}
