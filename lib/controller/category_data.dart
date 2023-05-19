 import '../model/model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel>categories = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.imageUrl = "https://images.pexels.com/photos/1137752/pexels-photo-1137752.jpeg?auto=compress&cs=tinysrgb&w=400";
  categoryModel.categoriesName = "Street Art";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.imageUrl = "https://images.pexels.com/photos/168496/pexels-photo-168496.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.categoriesName = "Wild Life";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.imageUrl = "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.categoriesName = "Nature";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.imageUrl = "https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.categoriesName = "Cars";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.imageUrl = "https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&w=600";
  categoryModel.categoriesName = "Bikes";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  return categories;

 }