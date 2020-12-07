
//import
import 'package:flutter/cupertino.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:practica_graphql/Provider/DatosProvider.dart';
import 'package:provider/provider.dart';

String url = 'https://museosapp.herokuapp.com/v1/graphql';
HasuraConnect hasuraConnect = HasuraConnect(
  url,
  headers: {
    "content-type":"application/json",
    "x-hasura-admin-secret":"AleAdminMuseosApp"
  }
);


//document
String docQuery = """
  query readMuseos {
    Museo {
      idMuseo
      name
    }
  }
""";

//suscripsion 
String docSubscription = """
  subscription MySubscriptionMuseo {
    Museo {
      idMuseo
      name
    }
  }
""";

class ApiGraphQL{

  Future<List> leerDatos()async{
    //get query
    var r = await hasuraConnect.query(docQuery);
    print("""
    ------------------------

    $r
    
    ------------------------
    """);
    List lista =r["data"]["Museo"]; 
    return lista;
  }

  suscripsion(BuildContext context)async{
    DatosProvider prov = Provider.of<DatosProvider>(context);
    Snapshot snapshot = await hasuraConnect.subscription(docSubscription);
    snapshot.listen((data) {
      // print("""
      // --------------x----------

      // $data
      
      // ------------------------
      // """);
      List list =data["data"]["Museo"];
      prov.lista = list;
      
    }).onError((err) {
    //   print("""
    //   ----------error--------------
    //   $err
    // """);
    });
  }

}