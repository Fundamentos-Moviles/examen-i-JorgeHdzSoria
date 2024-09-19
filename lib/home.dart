import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> listaExamen = [
    "6#28#23#Enero#Alejandro#Ordaz#Cumpleaños del profesor#1",
    "7#28#23#Febrero#Alejandro#Ordaz#Cumpleaños del profesor#2",
    "8#28#23#Marzo#Alejandro#Ordaz#Cumpleaños del profesor#3",
    "9#28#23#Abril#Alejandro#Ordaz#Cumpleaños del profesor#4",
    "10#28#23#Mayo#Alejandro#Ordaz#Cumpleaños del profesor#5",
    "11#28#23#Junio#Alejandro#Ordaz#Cumpleaños del profesor#1",
    "12#28#23#Julio#Alejandro#Ordaz#Cumpleaños del profesor#2",
    "13#28#23#Agosto#Alejandro#Ordaz#Cumpleaños del profesor#3",
    "14#28#23#Septiembre#Alejandro#Ordaz#Cumpleaños del profesor#4",
    "15#28#23#Octubre#Alejandro#Ordaz#Cumpleaños del profesor#5",
    "16#28#23#Noviembre#Alejandro#Ordaz#Cumpleaños del profesor#1",
    "17#28#23#Diciembre#Alejandro#Ordaz#Cumpleaños del profesor#2",
    "18#28#23#Diciembre#Alejandro#Ordaz#Cumpleaños del profesor#3",
  ];

  // eliminar cumpleaños usando el ID
  void eliminarCumpleaniosPorID(String id) {
    setState(() {
      listaExamen.removeWhere((elemento) {
        List<String> campos = elemento.split('#');
        return campos[0] == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cons.fondo,
      appBar: AppBar(
        title: const Text('Calendario de Cumpleaños'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Hernandez Soria Jorge Alberto',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listaExamen.map((elemento) {
                        // Separar los campos usando el símbolo #
                        List<String> campos = elemento.split('#');
                        return Row(
                          children: [
                            Expanded(
                              flex: 3, // 3 de 4 columnas
                              child: InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'ID: ${campos[0]}\nFecha de nacimiento: ${campos[2]} de ${campos[3]}\nNombre completo: ${campos[4]} ${campos[5]}\nDescripción: ${campos[6]}\nNº de estrellas: ${campos[7]}'),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              '${campos[2]} - ${campos[3]}',
                                              style: const TextStyle(
                                                  color: cons.titulos,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            (campos[0] == '1' ||
                                                    campos[0] == '5' ||
                                                    campos[0] == '10' ||
                                                    campos[0] == '15')
                                                ? const Icon(Icons.car_crash,
                                                    color: Colors.yellow)
                                                : const Icon(Icons.eco_outlined,
                                                    color: cons.botones),
                                          ],
                                        ),
                                        Text('${campos[4]} ${campos[5]}'),
                                        Text(campos[6]),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: List.generate(
                                            5, // Siempre serán 5 estrellas en total
                                            (index) {
                                              // Si el índice es menor que el número de estrellas amarillas, muestra una estrella amarilla
                                              if (index <
                                                  int.parse(campos[7])) {
                                                return const Icon(Icons.star,
                                                    color: Colors
                                                        .yellow); // Estrella amarilla
                                              } else {
                                                return const Icon(Icons.star,
                                                    color: Colors
                                                        .grey); // Estrella gris
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Card(
                                    child: Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Eliminando ID: ${campos[0]}'),
                                            ),
                                          );
                                          if (campos[0] != '1' &&
                                              campos[0] != '10' &&
                                              campos[0] != '15' &&
                                              campos[0] != '20' &&
                                              campos[0] != '23') {
                                            eliminarCumpleaniosPorID(campos[0]);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: cons.botones,
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.delete,
                                                color: Colors.white),
                                            Text('Borrar',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
