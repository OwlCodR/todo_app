// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskRequest _$TaskRequestFromJson(Map<String, dynamic> json) {
  return _TaskRequest.fromJson(json);
}

/// @nodoc
mixin _$TaskRequest {
  @JsonKey(name: 'element')
  TaskModel get task => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskRequestCopyWith<TaskRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskRequestCopyWith<$Res> {
  factory $TaskRequestCopyWith(
          TaskRequest value, $Res Function(TaskRequest) then) =
      _$TaskRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'element') TaskModel task});

  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class _$TaskRequestCopyWithImpl<$Res> implements $TaskRequestCopyWith<$Res> {
  _$TaskRequestCopyWithImpl(this._value, this._then);

  final TaskRequest _value;
  // ignore: unused_field
  final $Res Function(TaskRequest) _then;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }

  @override
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskRequestCopyWith<$Res>
    implements $TaskRequestCopyWith<$Res> {
  factory _$$_TaskRequestCopyWith(
          _$_TaskRequest value, $Res Function(_$_TaskRequest) then) =
      __$$_TaskRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'element') TaskModel task});

  @override
  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$_TaskRequestCopyWithImpl<$Res> extends _$TaskRequestCopyWithImpl<$Res>
    implements _$$_TaskRequestCopyWith<$Res> {
  __$$_TaskRequestCopyWithImpl(
      _$_TaskRequest _value, $Res Function(_$_TaskRequest) _then)
      : super(_value, (v) => _then(v as _$_TaskRequest));

  @override
  _$_TaskRequest get _value => super._value as _$_TaskRequest;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$_TaskRequest(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskRequest implements _TaskRequest {
  _$_TaskRequest({@JsonKey(name: 'element') required this.task});

  factory _$_TaskRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TaskRequestFromJson(json);

  @override
  @JsonKey(name: 'element')
  final TaskModel task;

  @override
  String toString() {
    return 'TaskRequest(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskRequest &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$_TaskRequestCopyWith<_$_TaskRequest> get copyWith =>
      __$$_TaskRequestCopyWithImpl<_$_TaskRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskRequestToJson(this);
  }
}

abstract class _TaskRequest implements TaskRequest {
  factory _TaskRequest(
          {@JsonKey(name: 'element') required final TaskModel task}) =
      _$_TaskRequest;

  factory _TaskRequest.fromJson(Map<String, dynamic> json) =
      _$_TaskRequest.fromJson;

  @override
  @JsonKey(name: 'element')
  TaskModel get task;
  @override
  @JsonKey(ignore: true)
  _$$_TaskRequestCopyWith<_$_TaskRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
