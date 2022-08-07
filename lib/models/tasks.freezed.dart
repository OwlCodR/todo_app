// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tasks _$TasksFromJson(Map<String, dynamic> json) {
  return _Tasks.fromJson(json);
}

/// @nodoc
mixin _$Tasks {
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'list')
  List<TaskElement> get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision')
  int get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksCopyWith<Tasks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksCopyWith<$Res> {
  factory $TasksCopyWith(Tasks value, $Res Function(Tasks) then) =
      _$TasksCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'list') List<TaskElement> tasks,
      @JsonKey(name: 'revision') int revision});
}

/// @nodoc
class _$TasksCopyWithImpl<$Res> implements $TasksCopyWith<$Res> {
  _$TasksCopyWithImpl(this._value, this._then);

  final Tasks _value;
  // ignore: unused_field
  final $Res Function(Tasks) _then;

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
              as List<TaskElement>,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TasksCopyWith<$Res> implements $TasksCopyWith<$Res> {
  factory _$$_TasksCopyWith(_$_Tasks value, $Res Function(_$_Tasks) then) =
      __$$_TasksCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'list') List<TaskElement> tasks,
      @JsonKey(name: 'revision') int revision});
}

/// @nodoc
class __$$_TasksCopyWithImpl<$Res> extends _$TasksCopyWithImpl<$Res>
    implements _$$_TasksCopyWith<$Res> {
  __$$_TasksCopyWithImpl(_$_Tasks _value, $Res Function(_$_Tasks) _then)
      : super(_value, (v) => _then(v as _$_Tasks));

  @override
  _$_Tasks get _value => super._value as _$_Tasks;

  @override
  $Res call({
    Object? status = freezed,
    Object? tasks = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$_Tasks(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskElement>,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tasks implements _Tasks {
  _$_Tasks(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'list') required final List<TaskElement> tasks,
      @JsonKey(name: 'revision') required this.revision})
      : _tasks = tasks;

  factory _$_Tasks.fromJson(Map<String, dynamic> json) =>
      _$$_TasksFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  final List<TaskElement> _tasks;
  @override
  @JsonKey(name: 'list')
  List<TaskElement> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey(name: 'revision')
  final int revision;

  @override
  String toString() {
    return 'Tasks(status: $status, tasks: $tasks, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tasks &&
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
  _$$_TasksCopyWith<_$_Tasks> get copyWith =>
      __$$_TasksCopyWithImpl<_$_Tasks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TasksToJson(this);
  }
}

abstract class _Tasks implements Tasks {
  factory _Tasks(
      {@JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'list') required final List<TaskElement> tasks,
      @JsonKey(name: 'revision') required final int revision}) = _$_Tasks;

  factory _Tasks.fromJson(Map<String, dynamic> json) = _$_Tasks.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'list')
  List<TaskElement> get tasks;
  @override
  @JsonKey(name: 'revision')
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$_TasksCopyWith<_$_Tasks> get copyWith =>
      throw _privateConstructorUsedError;
}
