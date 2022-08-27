// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TasksRequest _$TasksRequestFromJson(Map<String, dynamic> json) {
  return _TasksRequest.fromJson(json);
}

/// @nodoc
mixin _$TasksRequest {
  @JsonKey(name: 'list')
  List<TaskModel> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksRequestCopyWith<TasksRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksRequestCopyWith<$Res> {
  factory $TasksRequestCopyWith(
          TasksRequest value, $Res Function(TasksRequest) then) =
      _$TasksRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'list') List<TaskModel> tasks});
}

/// @nodoc
class _$TasksRequestCopyWithImpl<$Res> implements $TasksRequestCopyWith<$Res> {
  _$TasksRequestCopyWithImpl(this._value, this._then);

  final TasksRequest _value;
  // ignore: unused_field
  final $Res Function(TasksRequest) _then;

  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_TasksRequestCopyWith<$Res>
    implements $TasksRequestCopyWith<$Res> {
  factory _$$_TasksRequestCopyWith(
          _$_TasksRequest value, $Res Function(_$_TasksRequest) then) =
      __$$_TasksRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'list') List<TaskModel> tasks});
}

/// @nodoc
class __$$_TasksRequestCopyWithImpl<$Res>
    extends _$TasksRequestCopyWithImpl<$Res>
    implements _$$_TasksRequestCopyWith<$Res> {
  __$$_TasksRequestCopyWithImpl(
      _$_TasksRequest _value, $Res Function(_$_TasksRequest) _then)
      : super(_value, (v) => _then(v as _$_TasksRequest));

  @override
  _$_TasksRequest get _value => super._value as _$_TasksRequest;

  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_$_TasksRequest(
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TasksRequest implements _TasksRequest {
  _$_TasksRequest({@JsonKey(name: 'list') required final List<TaskModel> tasks})
      : _tasks = tasks;

  factory _$_TasksRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TasksRequestFromJson(json);

  final List<TaskModel> _tasks;
  @override
  @JsonKey(name: 'list')
  List<TaskModel> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksRequest(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksRequest &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  _$$_TasksRequestCopyWith<_$_TasksRequest> get copyWith =>
      __$$_TasksRequestCopyWithImpl<_$_TasksRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TasksRequestToJson(this);
  }
}

abstract class _TasksRequest implements TasksRequest {
  factory _TasksRequest(
          {@JsonKey(name: 'list') required final List<TaskModel> tasks}) =
      _$_TasksRequest;

  factory _TasksRequest.fromJson(Map<String, dynamic> json) =
      _$_TasksRequest.fromJson;

  @override
  @JsonKey(name: 'list')
  List<TaskModel> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_TasksRequestCopyWith<_$_TasksRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
