import 'package:flutter/material.dart';
import 'package:practica_graphql/Logic/GraphQL.dart';
import 'package:practica_graphql/Provider/DatosProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiGraphQL api = new ApiGraphQL();

  List<Widget> items;
  List lista;
  DatosProvider prov;
  @override
  void didChangeDependencies() async {
    prov = Provider.of<DatosProvider>(context);
    super.didChangeDependencies();
    api.suscripsion(context);

    // lista = await api.leerDatos();
    // items = lista.map((e) {
    //   return CardItem(
    //     idMuseo: e["idMuseo"], 
    //     name: e["name"]
    //   );
    // }).toList();
    // setState(() { });
    lista = prov.lista;
    if(lista!=null){
      items = lista.map((e) {
        return CardItem(
          idMuseo: e["idMuseo"], 
          name: e["name"]
        );
      }).toList();
    }
      
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        child: ListView(
          children: items!=null?items:[CircularProgressIndicator()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          api.leerDatos();
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String idMuseo;
  final String name;

  const CardItem({@required this.idMuseo,@required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text(this.idMuseo),
          Text(this.name),
        ],
      ),
    );
  }
}