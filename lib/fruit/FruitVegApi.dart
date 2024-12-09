import 'package:http/http.dart' as http;
import "dart:convert";

import 'FruitAndVeg.dart';
//import "dart:io";
//import 'package:utf_ext/utf_ext.dart' as utf;
  class FruitAndVegApi {
    final String _jsonFruitApiSearchUrl = "http://tropicalfruitandveg.com/api/tfvjsonapi.php?search=";
    final String _jsonFruitApiGetItemUrl = "http://tropicalfruitandveg.com/api/tfvjsonapi.php?tfvitem=";

    Future<SearchResultQuery<SearchResult>> searchFruitOrVeg(
        String nameofFruit) async {
      late SearchResultQuery<SearchResult> resultQuery;
      var url = Uri.parse(_jsonFruitApiSearchUrl + nameofFruit);
      http.Response fruitResp;
      try {
        fruitResp = await http.get(url);
      } catch (ex) {
        return SearchResultQuery(
            errorMessage: ex.toString(), resultList: null, searchCount: 0);
      }
      // Sometimes the response might have some broken characters so we have to decode it into utf8 allowing malformed characters
      String utf8DecodedResponse = utf8.decode(
          fruitResp.bodyBytes, allowMalformed: true);
      //Parse to JSON
      var response = jsonDecode(utf8DecodedResponse);
      // The response for search can either be a 'results' which returns a list results about your search or 'error' which returns an error message

      if (response["error"] == null) {
        var results = response["results"] as List<dynamic>;
        resultQuery = SearchResultQuery<SearchResult>(
            errorMessage: response["error"], resultList:
        results.map((e) {
          return SearchResult(
              name: e[SearchResultTerms.name.term],
              otherName: e[SearchResultTerms.otherName.term],
              botanicalName: e[SearchResultTerms.botanicalName.term],
              imageUrlInternet: e[SearchResultTerms.imageUrlInternet.term]
          );
        }).toList(growable: true),
            searchCount: response["tfvcount"]
        );

        return resultQuery;
      }
      else {
        resultQuery = SearchResultQuery(
            errorMessage: response["error"], resultList: null, searchCount: 0);
        return resultQuery;
      }
    }

    Future<FruitItem> getFruitorVeg(String name) async {
      var url = Uri.parse(_jsonFruitApiGetItemUrl + name);
      http.Response fruitResp;
      try {
        fruitResp = await http.get(url);
      } catch (ex) {
        return FruitItem(errorMessage: ex.toString());
      }
      // Sometimes the response might have some broken characters so we have to decode it into utf8 allowing malformed characters
      String utf8DecodedResponse = utf8.decode(
          fruitResp.bodyBytes, allowMalformed: true);
      //Parse to JSON
      var response = jsonDecode(utf8DecodedResponse);
      FruitItem resultItem;
      if (response["error"] == null) {
        var results = response["results"] as List<dynamic>;
        resultItem = FruitItem(
            name: results.first[ResultTerms.name.term],
            botanicalName: results.first[ResultTerms.botanicalName.term],
            otherName: results.first[ResultTerms.otherName.term],
            imageUrlInternet: results.first[ResultTerms.imageUrlInternet.term],
            climate: results.first[ResultTerms.climate.term],
            description: results.first[ResultTerms.description.term],
            health: results.first[ResultTerms.healthBenefits.term],
            propagation: results.first[ResultTerms.propagation.term],
            soil: results.first[ResultTerms.soil.term],
            uses: results.first[ResultTerms.uses.term],
            errorMessage: null


        );


        return resultItem;
      }
      else {
        resultItem = FruitItem(errorMessage: response["error"]);
        return resultItem;
      }
    }
  }



