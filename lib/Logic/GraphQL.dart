
//import
import 'package:hasura_connect/hasura_connect.dart';

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

}