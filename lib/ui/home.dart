import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../root/pallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> funcionarios = [];
  int indice = 0;

  @override
  void initState() {
    super.initState();
    carregarJSON();
  }

  Future<void> carregarJSON() async {
    String dados =
        await rootBundle.loadString('assets/mockup/funcionarios.json');
    setState(() {
      funcionarios = json.decode(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    final temDados = funcionarios.isNotEmpty;
    final f = temDados ? funcionarios[indice] : null;

    return Scaffold(
      appBar: AppBar(title: const Text("Funcionários")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Pallet.p1,
                boxShadow: [
                  BoxShadow(
                    color: Pallet.p2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<dynamic>(
                isExpanded: true,
                underline: const SizedBox(),
                value: temDados ? f : null,
                items: funcionarios
                    .map(
                      (f) => DropdownMenuItem(
                        value: f,
                        child: Text(f['nome']),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    indice = funcionarios.indexOf(value);
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            Text(
              temDados ? f['nome'] : "Nome",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Pallet.p2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    temDados
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage(f['avatar']),
                          )
                        : Image.asset('assets/icone.png', width: 150),

                    const SizedBox(height: 10),

                    Text(temDados ? f['cargo'] : ""),
                    Text(temDados ? "R\$ ${f['salario']}" : ""),
                    Text(
                      temDados
                          ? "Contratado: ${f['dataContatacao']}"
                          : "",
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: temDados && indice > 0
                      ? () => setState(() => indice--)
                      : null,
                  child: const Text("Anterior"),
                ),
                ElevatedButton(
                  onPressed: temDados && indice < funcionarios.length - 1
                      ? () => setState(() => indice++)
                      : null,
                  child: const Text("Próximo"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}