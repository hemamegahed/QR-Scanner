import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task11/module/login_screen/cubit/state.dart';
import 'package:task11/shared/componant/constains.dart';

import '../../../model/login_model.dart';
import '../../../shared/network/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

   LoginModel? loginModel;
  void userLogin({
    required String phone,
    required String password,
  }) {
    emit(LoginLoadinglState());
    DioHelper.postData(
        url: loginUrl,
        data: {'phone': phone, 'password': password}).then((value)  {
      loginModel = LoginModel.formJson(value.data);
      emit(LoginSuccessState(loginModel!));
      print(loginModel!.message.toString());
      print(loginModel!.data!.token.toString());

    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isSecure = true;
  void changePasswordVisibility() {
    isSecure = !isSecure;
    suffix = isSecure ? Icons.visibility : Icons.visibility_off_outlined;

    emit(LoginPasswordSuffixState());
  }
}
