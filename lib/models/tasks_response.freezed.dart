// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TasksResponse _$TasksResponseFromJson(Map<String, dynamic> json) {
  return _TasksResponse.fromJson(json);
}

/// @nodoc
mixin _$TasksResponse {
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'list')
  List<TaskModel> get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision')
  int get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksResponseCopyWith<TasksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksResponseCopyWith<$Res> {
  factory $TasksResponseCopyWith(
          TasksResponse value, $Res Function(TasksResponse) then) =
      _$TasksResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'list') List<TaskModel> tasks,
      @JsonKey(name: 'revision') int revision});
}

/// @nodoc
class _$TasksResponseCopyWithImpl<$Res>
    implements $TasksResponseCopyWith<$Res> {
  _$TasksResponseCopyWithImpl(this._value, this._then);

  final TasksResponse _value;
  // ignore: unused_field
  final $Res Function(TasksResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? tasks = freezed,
    Object? revision = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TasksResponseCopyWith<$Res>
    implements $TasksResponseCopyWith<$Res> {
  factory _$$_TasksResponseCopyWith(
          _$_TasksResponse value, $Res Function(_$_TasksResponse) then) =
      __$$_TasksResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'list') List<TaskModel> tasks,
      @JsonKey(name: 'revision') int revision});
}

/// @nodoc
class __$$_TasksResponseCopyWithImpl<$Res>
    extends _$TasksResponseCopyWithImpl<$Res>
    implements _$$_TasksResponseCopyWith<$Res> {
  __$$_TasksResponseCopyWithImpl(
      _$_TasksResponse _value, $Res Function(_$_TasksResponse) _then)
      : super(_value, (v) => _then(v as _$_TasksResponse));

  @override
  _$_TasksResponse get _value => super._value as _$_TasksResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? tasks = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$_TasksResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TasksResponse implements _TasksResponse {
  _$_TasksResponse(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'list') required final List<TaskModel> tasks,
      @JsonKey(name: 'revision') required this.revision})
      : _tasks = tasks;

  factory _$_TasksResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TasksResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  final List<TaskModel> _tasks;
  @override
  @JsonKey(name: 'list')
  List<TaskModel> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey(name: 'revision')
  final int revision;

  @override
  String toString() {
    return 'TasksResponse(status: $status, tasks: $tasks, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other.revision, revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(revision));

  @JsonKey(ignore: true)
  @override
  _$$_TasksResponseCopyWith<_$_TasksResponse> get copyWith =>
      __$$_TasksResponseCopyWithImpl<_$_TasksResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TasksResponseToJson(this);
  }
}

abstract class _TasksResponse implements TasksResponse {
  factory _TasksResponse(
          {@JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'list') required final List<TaskModel> tasks,
          @JsonKey(name: 'revision') required final int revision}) =
      _$_TasksResponse;

  factory _TasksResponse.fromJson(Map<String, dynamic> json) =
      _$_TasksResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'list')
  List<TaskModel> get tasks;
  @override
  @JsonKey(name: 'revision')
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$_TasksResponseCopyWith<_$_TasksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
