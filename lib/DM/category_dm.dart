import 'package:news_app/core/assets_manager.dart';

class CategoryDm {
  final String id;
  final String title;
  final String imagePath;

  CategoryDm({required this.id, required this.title, required this.imagePath});
  

  //business entertainment general health science sports technology

  static List<CategoryDm> _getCategory () => [
    CategoryDm(id: "general", title: "General", imagePath: AssetsManager.general),
    CategoryDm(id: "business", title: "Business", imagePath: AssetsManager.business),
    CategoryDm(id: "entertainment", title: "Entertainment", imagePath: AssetsManager.entertainment),
    CategoryDm(id: "health", title: "Health", imagePath: AssetsManager.health),
    CategoryDm(id: "sports", title: "Sports", imagePath: AssetsManager.sports),
    CategoryDm(id: "technology", title: "Technology", imagePath: AssetsManager.technology),
    CategoryDm(id: "science", title: "Science", imagePath: AssetsManager.science),
  ];

  static List<CategoryDm> categories = _getCategory();
}
