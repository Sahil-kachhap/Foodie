import 'package:foodopia/features/auth/domain/entity/user_entity.dart';
import 'package:foodopia/features/auth/domain/usecase/auth_usecase.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final AuthUsecase authUsecase = AuthUsecase();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      try {
        UserEntity userEntity = UserEntity(
          name: event.name,
          email: event.email,
          password: event.password,
        );

        UserEntity entity = await authUsecase.performRegisteration(userEntity);
        emit(RegistrationSuccess(userEntity: entity));
      } catch (e) {
        emit(RegistrationFailure(message: e.toString()));
        emit(AuthInitial());
      }
    });

    on<LoginUserEvent>(
      (event, emit) async {
        try {
          await authUsecase.performLogin(event.email, event.password);
          emit(LoginSuccess());
        } catch (e) {
          emit(LoginFailure(message: e.toString()));
          emit(AuthInitial());
        }
      },
    );
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final userEntity = json['userEntity'];

      return RegistrationSuccess(userEntity: userEntity);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is RegistrationSuccess) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
