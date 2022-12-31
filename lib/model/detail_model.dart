import 'dart:convert';

import 'package:restaurant_submission1/model/review_model.dart';

RestaurantDetail restaurantDetailFromJson(String str) =>
    RestaurantDetail.fromJson(json.decode(str));

String restaurantDetailToJson(RestaurantDetail data) =>
    json.encode(data.toJson());

class RestaurantDetail {
  RestaurantDetail({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  Restaurant restaurant;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        error: json["error"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
      };
}

class Restaurant {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;
  List<Category> categories;
  Menus menus;
  List<CustomerReview> customerReviews;
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    rating: json["rating"].toDouble(),
    categories: List<Category>.from(
        json["categories"].map((x) => Category.fromJson(x))),
    menus: Menus.fromJson(json["menus"]),
    customerReviews: List<CustomerReview>.from(
        json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "address": address,
    "pictureId": pictureId,
    "rating": rating,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "menus": menus.toJson(),
    "customerReviews":
    List<dynamic>.from(customerReviews.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Category> foods;
  List<Category> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(json["drinks"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

