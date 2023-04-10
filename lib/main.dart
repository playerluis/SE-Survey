import 'package:flutter/material.dart';

List<Color> colors = const <Color>[Color(0xffeefff7), Color(0xFF07f9A2), Color(0xFF09C184), Color(0xFF0A8967), Color(0xFF0C5149), Color(0xFF0D192B)];

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GEC Survey - QUIZZ',
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: LoginForm(),
      ),
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  InputDecoration formInputStyle(String labelText) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colors[5], width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors[5], width: 2.0),
      ),
      labelStyle: TextStyle(
        color: colors[5],
      ),
      labelText: labelText,
    );
  }

  bool loadingEnter = false;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.65,
          decoration: BoxDecoration(
              color: colors[4],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/2/27/Logo_ESPE.png"),
                        width: 75,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "SE Survey",
                        style: TextStyle(color: colors[0], fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.55,
                  decoration: BoxDecoration(color: colors[0], borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    padding: const EdgeInsets.all(25),
                    children: [
                      Center(
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(color: colors[5], fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Form(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: formInputStyle("Usuario"),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration: formInputStyle("Contraseña"),
                              )
                            ],
                          )),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "¿Olvidaste tu contraseña?",
                              style: TextStyle(color: colors[5]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      RoundButton(
                        title: "Entrar",
                        tapfun: () {
                          setState(() => loadingEnter = !loadingEnter);
                        },
                        loading: loadingEnter,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿No tiene una cuenta?",
                        style: TextStyle(color: colors[0]),
                      ),
                      TextButton(onPressed: () {}, child: Text("Crear cuenta", style: TextStyle(color: colors[2])))
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback tapfun;
  final bool loading;

  const RoundButton({super.key, required this.title, required this.tapfun, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapfun,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: colors[4],
          borderRadius: BorderRadius.circular(25.2),
        ),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
              strokeWidth: 3,
              color: colors[0],
            )
                : Text(
              title,
              style: TextStyle(color: colors[0], fontWeight: FontWeight.bold, fontSize: 15),
            )),
      ),
    );
  }
}
