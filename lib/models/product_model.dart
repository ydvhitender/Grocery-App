class ProductModel{
  String productName;
  String productImage;
  int productPrice;
  String productId;
  List<dynamic>productUnit;

  ProductModel({
    required this.productUnit, 
    required this.productId, required this.productName,required this.productImage,required this.productPrice});
  

}