class ShopPageElements():

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
###Utility
    def _get_li_by_id(self, id):
        return '//li[@id="'+ id +'"]'
     
    def _get_products_list(self):
        return '//div[@class="products ng-scope"]/ul'

###Elements
    def buy_locator(self, id):
        return self._get_li_by_id(id) + '//a[contains(text(), "Buy")]'
    
    def product_name_locator(self, id):
        return self._get_li_by_id(id) + '//h4[@class="product-title ng-binding"]'

    def all_products_locator(self):
        return self._get_products_list() + '/li'
    

if __name__ == '__main__':
    s = ShopPageElements()
    print (s.cart_items_locator())