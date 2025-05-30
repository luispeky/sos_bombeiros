import 'package:flutter/material.dart';

class ContatosEmergenciaPage extends StatefulWidget {
  @override
  _ContatosEmergenciaPageState createState() => _ContatosEmergenciaPageState();
}

class _ContatosEmergenciaPageState extends State<ContatosEmergenciaPage> {
  final List<Map<String, String>> contatos = [];
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  void adicionarContato() {
    final nome = nomeController.text.trim();
    final telefone = telefoneController.text.trim();

    if (nome.isNotEmpty && telefone.isNotEmpty) {
      setState(() {
        contatos.add({'nome': nome, 'telefone': telefone});
        nomeController.clear();
        telefoneController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0F1F7),
      appBar: AppBar(
        title: Text(
          'Contatos de Emergência',
          style: TextStyle(color: Colors.white), // Apenas o texto
        ),
        backgroundColor: Colors.red, // Vermelho anterior
        iconTheme: IconThemeData(color: Colors.white), // Ícones brancos
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: adicionarContato,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Adicionar Contato',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red, // ou use o código: Color(0xFFE30613)
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child:
                  contatos.isEmpty
                      ? Center(child: Text('Nenhum contato adicionado.'))
                      : ListView.builder(
                        itemCount: contatos.length,
                        itemBuilder: (context, index) {
                          final contato = contatos[index];
                          return ListTile(
                            title: Text(contato['nome'] ?? ''),
                            subtitle: Text(contato['telefone'] ?? ''),
                            leading: Icon(Icons.person),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
