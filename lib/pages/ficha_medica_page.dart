import 'package:flutter/material.dart';

class FichaMedicaPage extends StatelessWidget {
  const FichaMedicaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController idadeController = TextEditingController();
    final TextEditingController cpfController = TextEditingController();
    final TextEditingController medicamentosController =
        TextEditingController();
    final TextEditingController alergiasController = TextEditingController();
    final TextEditingController transtornoController = TextEditingController();
    final TextEditingController alturaController = TextEditingController();
    final TextEditingController pesoController = TextEditingController();
    final TextEditingController sangueController = TextEditingController();
    final TextEditingController extrasController = TextEditingController();
    final TextEditingController gravidezController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🩺 FICHA MÉDICA 🩺',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // cor do ícone de voltar
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 20),
            buildTextField("NOME", nomeController),
            buildTextField("IDADE", idadeController),
            buildTextField("CPF", cpfController),
            buildTextField("MEDICAMENTOS", medicamentosController),
            buildTextField("ALERGIAS", alergiasController),
            buildTextField("TRANSTORNO MENTAL", transtornoController),
            buildTextField("ALTURA", alturaController),
            buildTextField("PESO", pesoController),
            buildTextField("TIPO SANGUÍNEO", sangueController),
            buildTextField("INFORMAÇÕES EXTRAS", extrasController),
            buildTextField("GRAVIDEZ", gravidezController),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white, // <-- Aqui
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),

              icon: const Icon(Icons.warning_amber_rounded),
              label: const Text(
                "CONTATOS DE EMERGÊNCIA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/contatos-emergencia');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white70,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
