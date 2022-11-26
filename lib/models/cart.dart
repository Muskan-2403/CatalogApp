import 'package:my_first_app/models/catalog.dart';

class CartModel {
  //catalog feild
  CatalogueModel _catalog;

  //collection of ids + store ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogueModel get catalog => _catalog;

  set catalog(CatalogueModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
