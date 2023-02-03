import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
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
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Confirme sua senha"),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: DeliveryButton(
                    onPressed: () {},
                    label: "Cadastrar",
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
