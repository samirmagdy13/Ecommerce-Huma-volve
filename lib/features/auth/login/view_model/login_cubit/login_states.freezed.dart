// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginStates<T> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStates<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginStates<$T>()';
}


}

/// @nodoc
class $LoginStatesCopyWith<T,$Res>  {
$LoginStatesCopyWith(LoginStates<T> _, $Res Function(LoginStates<T>) __);
}


/// Adds pattern-matching-related methods to [LoginStates].
extension LoginStatesPatterns<T> on LoginStates<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( LoginLoading<T> value)?  loginLoading,TResult Function( LoginSuccess<T> value)?  loginSuccess,TResult Function( LoginError<T> value)?  loginError,TResult Function( QuickLoginError<T> value)?  quickLoginError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginLoading() when loginLoading != null:
return loginLoading(_that);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case LoginError() when loginError != null:
return loginError(_that);case QuickLoginError() when quickLoginError != null:
return quickLoginError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( LoginLoading<T> value)  loginLoading,required TResult Function( LoginSuccess<T> value)  loginSuccess,required TResult Function( LoginError<T> value)  loginError,required TResult Function( QuickLoginError<T> value)  quickLoginError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoginLoading():
return loginLoading(_that);case LoginSuccess():
return loginSuccess(_that);case LoginError():
return loginError(_that);case QuickLoginError():
return quickLoginError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( LoginLoading<T> value)?  loginLoading,TResult? Function( LoginSuccess<T> value)?  loginSuccess,TResult? Function( LoginError<T> value)?  loginError,TResult? Function( QuickLoginError<T> value)?  quickLoginError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginLoading() when loginLoading != null:
return loginLoading(_that);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case LoginError() when loginError != null:
return loginError(_that);case QuickLoginError() when quickLoginError != null:
return quickLoginError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loginLoading,TResult Function( LoginResponse data)?  loginSuccess,TResult Function( String error)?  loginError,TResult Function( String error)?  quickLoginError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginLoading() when loginLoading != null:
return loginLoading();case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.data);case LoginError() when loginError != null:
return loginError(_that.error);case QuickLoginError() when quickLoginError != null:
return quickLoginError(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loginLoading,required TResult Function( LoginResponse data)  loginSuccess,required TResult Function( String error)  loginError,required TResult Function( String error)  quickLoginError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoginLoading():
return loginLoading();case LoginSuccess():
return loginSuccess(_that.data);case LoginError():
return loginError(_that.error);case QuickLoginError():
return quickLoginError(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loginLoading,TResult? Function( LoginResponse data)?  loginSuccess,TResult? Function( String error)?  loginError,TResult? Function( String error)?  quickLoginError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginLoading() when loginLoading != null:
return loginLoading();case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.data);case LoginError() when loginError != null:
return loginError(_that.error);case QuickLoginError() when quickLoginError != null:
return quickLoginError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements LoginStates<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginStates<$T>.initial()';
}


}




/// @nodoc


class LoginLoading<T> implements LoginStates<T> {
  const LoginLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginStates<$T>.loginLoading()';
}


}




/// @nodoc


class LoginSuccess<T> implements LoginStates<T> {
  const LoginSuccess(this.data);
  

 final  LoginResponse data;

/// Create a copy of LoginStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessCopyWith<T, LoginSuccess<T>> get copyWith => _$LoginSuccessCopyWithImpl<T, LoginSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess<T>&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,data);
}

@override
String toString() {
    return 'LoginStates<$T>.loginSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<T,$Res> implements $LoginStatesCopyWith<T, $Res> {
  factory $LoginSuccessCopyWith(LoginSuccess<T> value, $Res Function(LoginSuccess<T>) _then) = _$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 LoginResponse data
});




}
/// @nodoc
class _$LoginSuccessCopyWithImpl<T,$Res>
    implements $LoginSuccessCopyWith<T, $Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess<T> _self;
  final $Res Function(LoginSuccess<T>) _then;

/// Create a copy of LoginStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoginSuccess<T>(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginResponse,
  ));
}


}

/// @nodoc


class LoginError<T> implements LoginStates<T> {
  const LoginError({required this.error});
  

 final  String error;

/// Create a copy of LoginStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginErrorCopyWith<T, LoginError<T>> get copyWith => _$LoginErrorCopyWithImpl<T, LoginError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginError<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'LoginStates<$T>.loginError(error: $error)';
}


}

/// @nodoc
abstract mixin class $LoginErrorCopyWith<T,$Res> implements $LoginStatesCopyWith<T, $Res> {
  factory $LoginErrorCopyWith(LoginError<T> value, $Res Function(LoginError<T>) _then) = _$LoginErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$LoginErrorCopyWithImpl<T,$Res>
    implements $LoginErrorCopyWith<T, $Res> {
  _$LoginErrorCopyWithImpl(this._self, this._then);

  final LoginError<T> _self;
  final $Res Function(LoginError<T>) _then;

/// Create a copy of LoginStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LoginError<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class QuickLoginError<T> implements LoginStates<T> {
  const QuickLoginError({required this.error});
  

 final  String error;

/// Create a copy of LoginStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickLoginErrorCopyWith<T, QuickLoginError<T>> get copyWith => _$QuickLoginErrorCopyWithImpl<T, QuickLoginError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickLoginError<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'LoginStates<$T>.quickLoginError(error: $error)';
}


}

/// @nodoc
abstract mixin class $QuickLoginErrorCopyWith<T,$Res> implements $LoginStatesCopyWith<T, $Res> {
  factory $QuickLoginErrorCopyWith(QuickLoginError<T> value, $Res Function(QuickLoginError<T>) _then) = _$QuickLoginErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$QuickLoginErrorCopyWithImpl<T,$Res>
    implements $QuickLoginErrorCopyWith<T, $Res> {
  _$QuickLoginErrorCopyWithImpl(this._self, this._then);

  final QuickLoginError<T> _self;
  final $Res Function(QuickLoginError<T>) _then;

/// Create a copy of LoginStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(QuickLoginError<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
