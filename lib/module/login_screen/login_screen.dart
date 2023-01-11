import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task11/module/scan_or_code/scan_or_code.dart';
import 'package:task11/shared/componant/componants.dart';
import 'package:task11/shared/componant/constains.dart';
import 'package:task11/shared/network/local/cache_helper.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginSuccessState) {
        CacheHelper.saveData(
                key: 'token', value: state.loginModel!.data!.token!.toString())
            .then((value) {
          token = state.loginModel!.data!.token!.toString();

          navigateAndFinish(context, ScanOrCode());
        });
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/back1.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 120, bottom: 100),
                          child: Center(
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: defaultTextFormField(
                          controller: phoneController,
                          textType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone number must not be empty';
                            }
                          },
                          labelText: 'Enter your Phone number'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: defaultTextFormField(
                          ispassword: LoginCubit.get(context).isSecure,
                          sufix: LoginCubit.get(context).suffix,
                          controller: passwordController,
                          sufixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          textType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            }
                          },
                          labelText: 'Password'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text('Forget Password ?')),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoadinglState,
                      builder: (context) => Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrangeAccent,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  phone: phoneController.text,
                                  password: passwordController.text);
                              print('login');
                            }
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      fallback: (context) => CircularProgressIndicator(),
                    )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
