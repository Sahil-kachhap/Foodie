import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodopia/features/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase authUsecase = AuthUsecase();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async{
       try{
         await authUsecase.performRegisteration(event.email, event.password, event.name);
         emit(RegistrationSuccess());
       }catch(e){
         emit(RegistrationFailure(message: e.toString()));
         emit(AuthInitial());
       }
    });

    on<LoginUserEvent>((event, emit) async{
      try{
        await authUsecase.performLogin(event.email, event.password);
        emit(LoginSuccess());
      }catch(e){
        emit(LoginFailure(message: e.toString()));
        emit(AuthInitial());
      }
    },);
  }
}
