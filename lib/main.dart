import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Kombosa"),
          ),
          body: ListView(
            children: [
              Destino("Angra dos Reis", "imagens/ANGRA.jpg", 384, 70,
                  "Conheça as lindas praias de Angra."),
              Destino("Arraial do Cabo", "imagens/arraial.jpg", 571, 65,
                  "Conheça Arraial do Cabo e venha surfar nas ondas do mar cristalino."),
              Destino("Florianópolis", "imagens/flori.jpg", 348, 85,
                  "Se hospede em um belissimo hotel a beira mar e relaxe em Florianópolis."),
              Destino("Jericoacoara", "imagens/jeri.jpg", 571, 75,
                  "Se aventure nas dunas e aproveita uma bela praia."),
              Destino("Madri", "imagens/madri.jpg", 401, 85,
                  "Assista a uma missa na famosa catedral de Madri."),
              Destino("Paris", "imagens/paris.jpg", 546, 95,
                  "Veja a torre Eifel, faça uma visita ao Louvre e veja a Monalisa em pessoa."),
              Destino("Orlando", "imagens/orlando.jpg", 616, 105,
                  "Visite os famosos parques de Orlando e desfruete de um bom tempo com a familia."),
              Destino("Roma", "imagens/roma.jpg", 478, 85,
                  "Venha fazer um passeio histórico pela capital do Império Romano."),
              Destino("Las Vegas", "imagens/lasvegas.jpg", 504, 110,
                  "Conheça a famosa Vegas Strip, mas cuidado para não perder tudo nos cassinos."),
              Destino("Chile", "imagens/chile.jpg", 446, 95,
                  "Visite a bélissima capital chilena."),
            ],
          )),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome_d;
  final String img;
  final String descricao;
  int valord = 0;
  int valorp = 0;
  Destino(this.nome_d, this.img, this.valord, this.valorp, this.descricao,
      {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_diarias = 0;
  int n_pessoas = 0;
  int total = 0;

  void _dias() {
    setState(() {
      n_diarias++;
    });
  }

  void _pessoas() {
    setState(() {
      n_pessoas++;
    });
  }

  void _calctotal() {
    setState(() {
      total = (n_diarias * widget.valord) + (n_pessoas * widget.valorp);
    });
  }

  void _limpar() {
    setState(() {
      n_diarias = 0;
      n_pessoas = 0;
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            "${widget.nome_d}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "R\$ ${widget.valord}/dia - R\$ ${widget.valorp}/pessoa",
            style: TextStyle(
                fontSize: 30, color: Colors.deepPurpleAccent.shade700),
          ),
          Text(
            " Descrição: ${widget.descricao}",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  width: 300,
                  height: 30,
                  child: Text(
                    "Quantidade de dias: $n_diarias",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _dias, child: Icon(Icons.add)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  color: Colors.white,
                  width: 300,
                  height: 50,
                  child: Text(
                    "Quantidade de pessoas: $n_pessoas",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _pessoas, child: Icon(Icons.add)),
            ],
          ),
          Container(
            color: Colors.white,
            width: 300,
            height: 40,
            child: Text(
              "Valor Total R\$: $total",
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                ),
                ElevatedButton(onPressed: _calctotal, child: Text("Calcular")),
                ElevatedButton(onPressed: _limpar, child: Text("Limpar")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
