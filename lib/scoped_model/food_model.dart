import 'dart:convert';
import 'package:food_app/model/food.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
class FoodModel extends Model
{
  List<Food> _food=[];
  bool _isLoading=false;

  bool get isLoading{
    return _isLoading;
  }

  List<Food> get foods{
    return List.from(_food);
  }

  Future<bool> addFood(Food food)async{
    _isLoading=true;
    notifyListeners();

    try{
      final Map<String,dynamic> foodData={
        "title":food.name,
        "description":food.description,
        "category":food.category,
        "price":food.price,
        "discount":food.discount,
      };
      final http.Response response= await http.post("https://fooddemo-1beb8.firebaseio.com/food.json",body: json.encode(foodData));
      //print(response);
      final Map<String,dynamic> responseData=json.decode(response.body);
      Food foodwithID=Food(
        id:responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
        price:food.price,
      );

      _isLoading=false;
      notifyListeners();
      fethFood();
      return Future.value(true);
      //_food.add(foodwithID);
      //print(_food[0].discount);
    }catch(e){
      _isLoading=false;
      notifyListeners();
      return Future.value(false);

      //print("connect error: $e");
    }
  }

  void fethFood(){
    http.get("https://fooddemo-1beb8.firebaseio.com/food.json").then((http.Response response){
      final Map<String,dynamic> fetchData=json.decode(response.body);
      print(fetchData);

      final List<Food> foodItems=[];

      fetchData.forEach((String id, dynamic foodData) {
        Food foodItem=Food(
          id:id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: foodData["price"],
          discount: foodData["discount"],
        );

        foodItems.add(foodItem);
      });
      _food=foodItems;
      notifyListeners();
      print(_food);
      //print("Fetching data: ${response.body}");
      //final List fetchedData=json.decode(response.body);
      //final List<Food> fetchFoodItems=[];

      //fetchedData.forEach((data) {
       // print(food["id"]);
      ///  Food food=Food(
        //  id: data["id"],
       //   category: data["category_id"],
       //   discount:  double.parse(data["discount"]),
        //  imagePath: data["image_path"],
       //   name: data["title"],
        //  price: double.parse(data["price"]),
      //  );

      //  fetchFoodItems.add(food);
     // });
     // _food=fetchFoodItems;
      //print(_food);
    });
  }
}