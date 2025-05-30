import 'package:flutter/material.dart';
import 'ficha_medica_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> acoes = [
    {
      'titulo': 'INCÊNDIOS',
      'url': 'https://pt.wikipedia.org/wiki/Inc%C3%AAndio',
    },
    {
      'titulo': 'BUSCA E SALVAMENTO',
      'url': 'https://pt.wikipedia.org/wiki/Busca_e_resgate',
    },
    {
      'titulo': 'DESLIZAMENTOS E DESABAMENTOS',
      'url': 'https://pt.wikipedia.org/wiki/Deslizamento_de_terra',
    },
    {
      'titulo': 'RESGATE DE ANIMAIS',
      'url': 'https://pt.wikipedia.org/wiki/Resgate_de_animais',
    },
    {
      'titulo': 'ATENDIMENTO PRÉ-HOSPITALAR',
      'url': 'https://pt.wikipedia.org/wiki/Servi%C3%A7o_de_ambul%C3%A2ncia',
    },
    {
      'titulo': 'DESASTRE NATURAL',
      'url': 'https://pt.wikipedia.org/wiki/Desastre_natural',
    },
    {
      'titulo': 'ACIDENTE QUÍMICO',
      'url': 'https://pt.wikipedia.org/wiki/Acidente_qu%C3%ADmico',
    },
  ];

  void _abrirURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  void _solicitarLocalizacao(BuildContext context) async {
    bool autorizado = true;
    if (autorizado) {
      Navigator.pushNamed(context, '/mapa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0F1F7), // azul claro de fundo
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botão de emergência no topo (ícone)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FichaMedicaPage(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(Icons.emergency, color: Colors.red),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: acoes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ElevatedButton(
                        onPressed: () => _abrirURL(acoes[index]['url']!),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black45,
                        ),
                        child: Text(
                          acoes[index]['titulo']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ElevatedButton(
                  onPressed: () => _solicitarLocalizacao(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                    shadowColor: Colors.black45,
                  ),
                  child: Text(
                    'OUTRA LOCALIZAÇÃO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
