import 'package:delivery_app_dartweek/app/core/core/ui/base_state/base_state.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app_dartweek/app/pages/auth/register/register_controller.dart';
import 'package:delivery_app_dartweek/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: (){
            showError("Erro ao registrar usuário");
          },
          success: (){
            hideLoader();
            showSuccess("Cadastro realizado com sucesso");
            Navigator.pop(context);
        }
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cadastro",
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    "Preencha os campos abaixo para criar o seu cadastro.",
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _name,
                    validator: Validatorless.required("Nome Obrigatório"),
                    decoration: InputDecoration(labelText: "Nome"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _email,
                    validator: Validatorless.multiple([
                      Validatorless.required("E-mail Obrigatório"),
                      Validatorless.email("E-mail inválido")
                    ]),
                    decoration: InputDecoration(labelText: "E-mail"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    validator: Validatorless.multiple([
                      Validatorless.required("Senha Obrigatória"),
                      Validatorless.min(
                          6, "Sua senha deve conter pelo menos 6 caracteres")
                    ]),
                    decoration: InputDecoration(labelText: "Senha"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Confirme sua senha"),
                      Validatorless.compare(_password, "Senhas não coincidem")
                    ]),
                    decoration:
                        InputDecoration(labelText: "Confirme sua senha"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DeliveryButton(
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(_name.text, _email.text, _password.text);
                        }
                      },
                      label: "Cadastrar",
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
