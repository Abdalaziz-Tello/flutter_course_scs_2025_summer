


import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLClient initGraphql(){

HttpLink url = HttpLink("https://graphqlzero.almansi.me/api");

return GraphQLClient(link:url , cache:GraphQLCache(store: HiveStore()) );

}