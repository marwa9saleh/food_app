

class FoodModel{
   final String  idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;
  

 FoodModel
({ required this.idCategory,  required this.strCategory,  required this.strCategoryThumb,  required this.strCategoryDescription,});

 factory FoodModel.fromjson(Map<String, dynamic> json) {
  return FoodModel(
    idCategory :json['idCategory'],
    strCategory : json['strCategory'],
    strCategoryThumb : json['strCategoryThumb'],
    strCategoryDescription :json['strCategoryDescription'],
    );
  }
}
