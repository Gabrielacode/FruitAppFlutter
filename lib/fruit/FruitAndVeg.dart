enum ResultTerms{
  name("tfvname"),
  botanicalName("botname"),
  otherName("othname"),
  imageUrlInternet("imageurl"),
  description("description"),
  uses("uses"),
  healthBenefits("health"),
  climate("climate"),
  soil("soil"),
  propagation("propagation");


  final String term;
  const  ResultTerms(this.term);
}
enum SearchResultTerms{
  name("tfvname"),
  botanicalName("botname"),
  otherName("othname"),
  imageUrlInternet("imageurl");

  final String term;
  const  SearchResultTerms(this.term);
}
class SearchResult{
  String? name;
  String? botanicalName;
  String? otherName;
  String? imageUrlInternet;

  SearchResult({ required this.name , this.botanicalName,this.otherName,this.imageUrlInternet});
}

class SearchResultQuery<T extends SearchResult>{
  String? errorMessage;
  List<T?>? resultList;
  int? searchCount;

  SearchResultQuery({this.errorMessage, this.resultList, this.searchCount});
}

class FruitItem extends SearchResult{
  String? description;
  String? uses;
  String? health;
  String? climate;
  String? soil;
  String? propagation;

  String? errorMessage;

  FruitItem({super.name,super.botanicalName,super.otherName,super.imageUrlInternet,this.climate,this.description,this.health,this.propagation,this.soil,this.uses,this.errorMessage});
}
