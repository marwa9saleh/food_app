import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data_model.dart';
import 'package:flutter_application_1/servises/product_servises.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:http/http.dart' as http;
class DataController extends GetxController {
  var foodList = <FoodModel>[].obs;
  var filteredItems = <FoodModel>[].obs;
  var isLoading = true.obs;
  TextEditingController searchTextController = TextEditingController();
  var favoriteList = <FoodModel>[].obs;
  final box2 = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadFavorite();
    fetchproduct();
  }

  void _saveFavorite() {
    box2.write('Fav', favoriteList.map((e) => e.toJson()).toList());
  }

  void _loadFavorite() {
    List<dynamic>? savedFav = box2.read<List>('Fav');
    if (savedFav != null) {
      favoriteList.clear();
      favoriteList
          .assignAll(savedFav.map((e) => FoodModel.fromjson(e)).toList());
    }
  }

  Future<void> fetchproduct() async {
    var product = await FoodApi.fetchData();
    try {
      isLoading.value = true;
      if (product.isNotEmpty) {
        foodList.addAll(product);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void addToFavorites(FoodModel item) {
    // if (!favoriteList.contains(item)) {
    if (!favoriteList.any((e) => e.idCategory == item.idCategory)) {
      favoriteList.add(item);
      _saveFavorite();
    }
  }

  // إزالة عنصر من المفضلة
  void removeFromFavorites(FoodModel item) {
    favoriteList.removeWhere((e) => e.idCategory == item.idCategory);
    // favoriteList.remove(item);
    _saveFavorite();
  }

  bool isFavorite(FoodModel item) {
    return favoriteList.any((e) => e.idCategory == item.idCategory);
  }

  void search(String query) {
    // if (query.isEmpty) {
    //   filteredItems.clear();
    // } else {
    filteredItems.value = foodList.where((item) {
      return item.strCategory.toLowerCase().contains(query.toLowerCase());
    }).toList();
    update();
    // }
  }

  void clearSearch() {
    searchTextController.clear();
    search("");
  }

  List<Map<String, dynamic>> food = [
    {
      "id": 1,
      "name": "Beef",
      "im":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBHu2MT5t3rBjyukyWbkAB8rovNBkkgqb4RQ&s",
      "menu": [
        {
          "num": 1,
          "nam": "Burger",
          "image": "https://www.themealdb.com/images/category/beef.png",
          "description":
              "Beef is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Steak",
          "image":
              "https://cdn.pixabay.com/photo/2024/04/26/12/24/ai-generated-8721771_640.jpg",
          "description": "Steak is a popular beef dish enjoyed worldwide."
        },
        {
          "num": 3,
          "nam": "SpicySteak",
          "image":
              "https://t3.ftcdn.net/jpg/05/39/75/88/360_F_539758860_1vCdxgIx1oePzvxcdts80VYacH0hxOOO.jpg",
          "description": "Steak is a popular beef dish enjoyed worldwide."
        }
      ]
    },
    {
      "id": 2,
      "name": "chicken",
      "im":
          "https://media.istockphoto.com/id/477596753/photo/homemade-southern-fried-chicken.jpg?s=612x612&w=0&k=20&c=8b_5KjKmmO34ChsqVZN4-1YlDXyVJNlKh3w6qtVjR88=",
      "menu": [
        {
          "num": 1,
          "nam": "fride chicken",
          "image":
              "https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?cs=srgb&dl=pexels-harry-dona-2338407.jpg&fm=jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Grilled Chicken",
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRElAY12WuWalyh5ewBqpidHrrXU99gCRztAv40zKwcAxGlEXhIYhxFSArMWZuZxDezvME&usqp=CAU",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "ROAST Chicken",
          "image":
              "https://pressureluckcooking.com/wp-content/uploads/2020/03/Fried-Chicken-720x540.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 3,
      "name": "fish",
      "im":
          "https://img.freepik.com/free-photo/bottom-view-fish-fry-with-lemon-slices-plate-napkin-black-background_140725-112100.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
      "menu": [
        {
          "num": 1,
          "nam": "fride fish",
          "image":
              "https://img.freepik.com/free-photo/calamari-rings-served-with-lemon-mayonnaise_140725-1504.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "salt fish",
          "image":
              "https://img.freepik.com/free-photo/grilled-salmon-mashed-potato-with-greeens-sauces-side-view_141793-3551.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "fish meal",
          "image":
              "https://img.freepik.com/free-photo/fried-fish-with-sauce-plate_140725-758.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 4,
      "name": "dessert",
      "im":
          "https://img.freepik.com/free-photo/set-tea-nuts-dessert-plate-white-wooden-background-side-view_176474-3848.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
      "menu": [
        {
          "num": 1,
          "nam": "dounts",
          "image":
              "https://img.freepik.com/free-vector/flying-doughnut-melted-cartoon-icon-illustration_138676-2452.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "cup cake",
          "image":
              "https://img.freepik.com/free-photo/closeup-shot-pink-white-cupcakes-tray-table_181624-43398.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "blue cake",
          "image":
              "https://img.freepik.com/free-photo/front-view-delicious-browny-with-blue-cream-blue-cake-biscuit-sugar-color_140725-24663.jpg?ga=GA1.1.821518492.1731605893&semt=ais_hybrid",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 5,
      "name": "Lamb",
      "im":
          "https://media.istockphoto.com/id/467413730/photo/grilled-lamb-chops-organized-on-a-white-plate-on-wood.jpg?s=612x612&w=0&k=20&c=XyYp05pGAQx5FqYV6diCbaC1puKaeAzVOVvQIS845bY=",
      "menu": [
        {
          "num": 1,
          "nam": "Grilled Lamb Chops",
          "image":
              "https://www.dinneratthezoo.com/wp-content/uploads/2021/03/grilled-lamb-chops-final-2.jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Tandoori Grilled Lamb Chops",
          "image":
              "https://www.homemadeinterest.com/wp-content/uploads/2022/08/Grilled-Lamb-Chops-in-a-Curry-Marinade_IG-1.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "Mutton Chops Recipe",
          "image": "https://i.ytimg.com/vi/NasiPF08rZo/maxresdefault.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 6,
      "name": "shaorma",
      "im":
          "https://pizzamediteraneo.ro/wp-content/uploads/2022/08/DSC_0192.jpg",
      "menu": [
        {
          "num": 1,
          "nam": "Chicken Shawarma ",
          "image":
              "https://img77.uenicdn.com/image/upload/v1599609012/business/cd99bf88-a072-4414-85a7-fad5eadb6eb3.jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Beef Shawarma",
          "image":
              "https://lh3.googleusercontent.com/proxy/klJ4x2YTAWFZeaaKtvFks7187DFE09WoE3lMha1aGFycjfRTU0BaB3_5L8Yo_ybaW4dKXPVtLyc5-RSNyJupalRhFV_IElZts1YW-eEcyWErPY3_yVW_rbeiuO4QH5YxH1I-F4XJWjVViQ",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "SOJOK SHAWARMA ",
          "image":
              "https://aboushawarma.sa/menu/wp-content/uploads/2023/09/Artboard-16-1.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 7,
      "name": "pasta",
      "im":
          "https://www.eatingwell.com/thmb/iCdLRBC1BMcDYKRYMTyyToQ8mRs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8401873-ad2429ae1858464a92229875c91c093d.jpg",
      "menu": [
        {
          "num": 1,
          "nam": "Skillet Pasta ",
          "image":
              "https://myplate-prod.azureedge.us/sites/default/files/styles/recipe_525_x_350_/public/2020-11/SkilletPastaDinner_527x323.jpg?itok=Yb4EDdkm",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Italian doch Pasta ",
          "image":
              "https://www.favfamilyrecipes.com/wp-content/uploads/2021/06/Italian-Spaghetti-8.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "Spaghetti Bolognese",
          "image":
              "https://macros.com.au/cdn/shop/files/MAC2000-SpaghettiBolognese3_4_6615e28c-a232-4ce0-b24c-7baf63501b31.jpg?v=1705907274",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 8,
      "name": "seafood",
      "im":
          "https://myfoodbook.com.au/sites/default/files/styles/card_c_molo/public/recipe_photo/Easy_As_Aussie_Seafood_Platter_vert%20copy.jpg",
      "menu": [
        {
          "num": 1,
          "nam": "Grilled Seafood Platter ",
          "image":
              "https://overthefirecooking.com/wp-content/uploads/2024/04/Cover-Image-4-500x375.jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Ocean Crab House ",
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_EfCldE0cxmXgCVYyAhLyaOgoi2ZQkg-sfn6GiorkeeR0380g5UUdQJlgt1JqnoG5K2A&usqp=CAU",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "Seafood Boil",
          "image":
              "https://static01.nyt.com/images/2024/02/28/multimedia/LH-seafood-boil-gktl/LH-seafood-boil-gktl-googleFourByThree.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 9,
      "name": "side",
      "im":
          "https://hips.hearstapps.com/hmg-prod/images/melting-potatoes-vertical-1676485814.jpg",
      "menu": [
        {
          "num": 1,
          "nam": " Vegetable Side ",
          "image":
              "https://www.acouplecooks.com/wp-content/uploads/2019/09/Sweet-Potato-Wedges-004.jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": "Korean zucchini side ",
          "image":
              "https://iheartumami.com/wp-content/uploads/2023/02/Korean-zucchini-side-dish-recipe.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": " Potato Side",
          "image":
              "https://www.eatingwell.com/thmb/QegiZCTclr5sL5kIODMpTVwsiwI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8533552-a4b47716638e48ce986f05fe84fb5c8c.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 10,
      "name": "starter",
      "im":
          "https://img.taste.com.au/6QVUpcfO/taste/2016/11/starters-recipes-116741-1.jpg",
      "menu": [
        {
          "num": 1,
          "nam": "  Chicken Starter  ",
          "image":
              "https://c.ndtvimg.com/2019-04/gbkiutf8_chicken-tikka-650_650x400_09_April_19.jpg?im=FaceCrop,algorithm=dnn,width=384,height=384",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": " Indian Starters ",
          "image":
              "https://media.istockphoto.com/id/868053356/photo/indian-food-selection.jpg?s=612x612&w=0&k=20&c=SQH3fZPe2O4n5TGg6yRUmnxRU6dduEwliJ7euIiktD4=",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "olivemagazine",
          "image":
              "https://images.immediate.co.uk/production/volatile/sites/2/2019/12/Creamy_Prawns-70c3cc5.jpg?quality=90&crop=7px,1941px,3395px,2262px&resize=700,466",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 11,
      "name": "vegan",
      "im":
          "https://images.immediate.co.uk/production/volatile/sites/30/2013/05/vegan-jambalaya-01e5bde.jpg?quality=90&resize=556,505",
      "menu": [
        {
          "num": 1,
          "nam": "High Protein passende Vegan",
          "image":
              "https://biteswithblair.com/wp-content/uploads/2023/05/high-protein-vegan-meal-prep-featured-image-1.jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": " Protein Vegan",
          "image":
              "https://www.mississippivegan.com/wp-content/uploads/2024/08/three-bean-salad-05-819x1024.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "Vincent Vegetarian Food",
          "image":
              "https://imageproxy.wolt.com/venue/63ff1bed1963bf2a36da313c/de781cfc-bbf3-11ed-82ca-ae4d76e08c37_vsgc.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 12,
      "name": "Vegetarian",
      "im":
          "https://media.post.rvohealth.io/wp-content/uploads/2021/08/healthy-eating-food-sweet-potato-kale-bowl-grain-vegan-1296x728-header-732x549.jpg",
      "menu": [
        {
          "num": 1,
          "nam": "Vegetarian best sale",
          "image":
              "https://assets-global.website-files.com/63ed08484c069d0492f5b0bc/642c5de2f6aa2bd4c9abbe86_6406876a4676d1734a14a9a3_Bowl-of-vegetables-and-fruits-for-a-vegetarian-diet-vegetarian-weight-loss-plan.jpeg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": " Vegetarian Diet",
          "image":
              "https://www.healthifyme.com/blog/wp-content/uploads/2021/11/Is-it-better-to-be-on-a-vegetarian-diet.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "Pros and Cons of Vegetarian",
          "image":
              "https://batonrougeclinic.com/wp-content/uploads/2021/10/Baldwin-10.-The-Pros-and-Cons-of-Vegetarian-Diets.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 13,
      "name": "breakfast",
      "im":
          "https://www.kateskitchenkc.com/wp-content/uploads/2023/10/traditional-full-american-breakfast-eggs-pancakes-with-bacon-and-toast.jpg_s1024x1024wisk20cz03ui5Oqyz8Ys_pG0bVWsgoz_v_E5Oct4x-0C-sAjME.jpg",
      "menu": [
        {
          "num": 1,
          "nam": "Breakfast Recipes",
          "image":
              "https://images.immediate.co.uk/production/volatile/sites/30/2017/08/smoothie-bowl-3a8632c.jpg?quality=90&resize=556,505",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": " Sheet Pan ",
          "image":
              "https://www.simplyrecipes.com/thmb/qZhTCZXCER16sPaUBuNjiRxPUNo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2018__02__Sheet-Pan-English-ALT-LEAD-cb66a03b6afd4e8784fa99a124b0e1ab.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 3,
          "nam": "Traditional Balkan-Style Breakfasts",
          "image":
              "https://cdn.shopify.com/s/files/1/2968/1670/files/tasty-cooked-egg-with-chopped-sausages-2023-03-24-21-33-06-utc_copy_3abb9306-a118-42d7-8e1b-78637bb2c279_480x480.jpg?v=1684238049",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        }
      ]
    },
    {
      "id": 14,
      "name": "goat",
      "im":
          "https://thumbs.dreamstime.com/b/spicy-aromatic-traditional-indian-goat-curry-served-black-pan-top-table-view-332725063.jpg",
      "menu": [
        {
          "num": 3,
          "nam": "Sudanese Goat",
          "image":
              "https://i.ytimg.com/vi/z4hYnZ9JGmk/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLC2jZ2Nz_fwJOLLRnEq4YLB1dYiWA",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
        {
          "num": 1,
          "nam": "Indian Goat",
          "image":
              "https://thumbs.dreamstime.com/b/overhead-view-indian-goat-curry-mutton-nihari-rogan-josh-bowl-spicy-rice-copy-space-text-163778487.jpg",
          "description":
              "chicken is a culinary term used to describe meat from cattle."
        },
        {
          "num": 2,
          "nam": " Curry Goat",
          "image":
              "https://travelandmunchies.com/wp-content/uploads/2022/11/IMG_4514.jpg",
          "description":
              "Grilled chicken is a healthier alternative to fried chicken."
        },
      ]
    },
  ];

  //   { "id": 2, "name": "Lamp", "menu": ["f", "Ramen"]
  // }

//   @override
// void onClose() {

//     tabController.dispose();
//     super.onClose();
//   }
}
