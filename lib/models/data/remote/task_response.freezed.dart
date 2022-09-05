// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) {
  return _TaskResponse.fromJson(json);
}

/// @nodoc
mixin _$TaskResponse {
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'element')
  ElementResponse get task => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision')
  int get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskResponseCopyWith<TaskResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskResponseCopyWith<$Res> {
  factory $TaskResponseCopyWith(
          TaskResponse value, $Res Function(TaskResponse) then) =
      _$TaskResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'element') ElementResponse task,
      @JsonKey(name: 'revision') int revision});

  $ElementResponseCopyWith<$Res> get task;
}

/// @nodoc
class _$TaskResponseCopyWithImpl<$Res> implements $TaskResponseCopyWith<$Res> {
  _$TaskResponseCopyWithImpl(this._value, this._then);

  final TaskResponse _value;
  // ignore: unused_field
  final $Res Function(TaskResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? task = freezed,
    Object? revision = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as ElementResponse,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ElementResponseCopyWith<$Res> get task {
    return $ElementResponseCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskResponseCopyWith<$Res>
    implements $TaskResponseCopyWith<$Res> {
  factory _$$_TaskResponseCopyWith(
          _$_TaskResponse value, $Res Function(_$_TaskResponse) then) =
      __$$_TaskResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'element') ElementResponse task,
      @JsonKey(name: 'revision') int revision});

  @override
  $ElementResponseCopyWith<$Res> get task;
}

/// @nodoc
class __$$_TaskResponseCopyWithImpl<$Res>
    extends _$TaskResponseCopyWithImpl<$Res>
    implements _$$_TaskResponseCopyWith<$Res> {
  __$$_TaskResponseCopyWithImpl(
      _$_TaskResponse _value, $Res Function(_$_TaskResponse) _then)
      : super(_value, (v) => _then(v as _$_TaskResponse));

  @override
  _$_TaskResponse get _value => super._value as _$_TaskResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? task = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$_TaskResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as ElementResponse,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskResponse implements _TaskResponse {
  _$_TaskResponse(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'element') required this.task,
      @JsonKey(name: 'revision') required this.revision});

  factory _$_TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TaskResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'element')
  final ElementResponse task;
  @override
  @JsonKey(name: 'revision')
  final int revision;

  @override
  String toString() {
    return 'TaskResponse(status: $status, task: $task, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.task, task) &&
            const DeepCollectionEquality().equals(other.revision, revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(task),
      const DeepCollectionEquality().hash(revision));

  @JsonKey(ignore: true)
  @override
  _$$_TaskResponseCopyWith<_$_TaskResponse> get copyWith =>
      __$$_TaskResponseCopyWithImpl<_$_TaskResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskResponseToJson(this);
  }
}

abstract class _TaskResponse implements TaskResponse {
  factory _TaskResponse(
          {@JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'element') required final ElementResponse task,
          @JsonKey(name: 'revision') required final int revision}) =
      _$_TaskResponse;

  factory _TaskResponse.fromJson(Map<String, dynamic> json) =
      _$_TaskResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'element')
  ElementResponse get task;
  @override
  @JsonKey(name: 'revision')
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$_TaskResponseCopyWith<_$_TaskResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
