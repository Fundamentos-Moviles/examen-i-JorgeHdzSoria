import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo verde
          Container(color: const Color(0xFF085434)),

          // Fondo personalizado con el grid
          CustomBackground(),

          // Formulario dentro de un Card
          Center(
            child: Card(
              color: const Color.fromARGB(100, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Bienvenido a tu primer EXAMEN',
                        style: TextStyle(
                          color: Color(0xFF96b400),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        // Contenedor para el texto para poder alinear a la izquierda
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Ingresa tu correo electronico:',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Correo',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        // Contenedor para el texto para poder alinear a la izquierda
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Ingresa tu contraseña:',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Contraseña',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                          ),
                          obscureText: true),
                      const SizedBox(height: 24),
                      if (errorMessage.isNotEmpty)
                        Text(
                          errorMessage,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 241, 193, 0),
                          fixedSize: const Size(300, 30),
                        ),
                        onPressed: () {
                          if (_emailController.text == 'test@correo.mx' &&
                              _passwordController.text == 'FDM2') {
                            /////   NAVEGAR A HOME   /////
                            // Navegar a la página de Home directamente
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {
                            setState(() {
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                errorMessage = 'Datos incompletos';
                              } else if (_emailController.text !=
                                  'test@correo.mx') {
                                errorMessage = 'Correo incorrecto';
                              } else if (_passwordController.text != 'FDM2') {
                                errorMessage = 'Contraseña incorrecta';
                              }
                            });
                          }
                        },
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Mi primer examen, ¿estará sencillo?',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Fondo personalizado del login
class CustomBackground extends StatelessWidget {
  CustomBackground({super.key});

  final List<List<int>> colorPattern = [
    [2, 4, 3, 1], // Fila 1
    [1, 3, 2, 4], // Fila 2
    [3, 1, 4, 2], // Fila 3
    [4, 2, 1, 3], // Fila 4
    [2, 4, 3, 1], // Fila 5
    [1, 3, 2, 4], // Fila 6
  ];

  // Función que convierte un número en un color
  Color getColor(int num) {
    switch (num) {
      case 1:
        return cuadro1;
      case 2:
        return cuadro2;
      case 3:
        return cuadro3;
      default:
        return const Color.fromARGB(0, 255, 255, 255);
    }
  }

  //Diferentes colores de verde
  final cuadro1 = Color(0xFF00ae72);
  final cuadro2 = Color(0xFF016447);
  final cuadro3 = Color(0xFF00402c);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 columnas
          crossAxisSpacing: 0, // Espacio horizontal entre las celdas
          mainAxisSpacing: 0, // Espacio vertical entre las celdas
        ),
        itemCount: 24, // 6 filas x 4 columnas = 24 elementos
        itemBuilder: (context, index) {
          // Obtener fila y columna a partir del índice
          int row = index ~/ 4;
          int col = index % 4;

          // Obtener el color basado en el patrón
          int colorNumber = colorPattern[row][col];
          Color cellColor = getColor(colorNumber);

          return Container(
            decoration: BoxDecoration(
              color: cellColor, // Color personalizado para cada celda
              borderRadius: BorderRadius.circular(50.0), // Bordes redondeados
            ),
          );
        },
      ),
    );
  }
}
