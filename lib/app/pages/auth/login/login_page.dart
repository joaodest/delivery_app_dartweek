import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login", style: context.textStyles.textTitle),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "E-mail"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Senha"),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: DeliveryButton(
                        label: "ENTRAR",
                        width: double.infinity,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não possui uma conta?",
                      style: context.textStyles.textBold,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/auth/register");
                      },
                      child: Text(
                        "Cadastre-se",
                        style: context.textStyles.textBold
                            .copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
