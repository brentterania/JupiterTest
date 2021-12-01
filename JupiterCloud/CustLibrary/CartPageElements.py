import re
from _overlapped import NULL

class CartPageElements():

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

#Utility
    def _get_cart_table(self):
        return '//table[@class="table table-striped cart-items"]/tbody'
    
    def _get_strong_by_class(self, clas):
        return '//strong[@class="' + clas + '"]'
    
#Elements
    def cart_items_locator(self):
        return self._get_cart_table() + '/tr'
    
    def cart_name_locator(self, index):
        return self._get_cart_table() + '/tr[' + str(index) + ']/td'
    
    def price_locator(self, index):
        return self._get_cart_table() + '/tr[' + str(index) + ']/td[2]'

    def quantity_locator(self, index):
        return self._get_cart_table() + '/tr[' + str(index) + ']//input[@name="quantity"]'
    
    def sub_total_locator(self, index):
        return self._get_cart_table() + '/tr[' + str(index) + ']/td[4]'

    def total_locator(self):
        return self._get_strong_by_class('total ng-binding')
    
    def remove_non_numeric(self, string):
        return re.sub("[^\d.]+", "", str(string))
    
    def compute_sub_total(self, amount_1, amount_2, currency=""):
        
        amount_1 = self.remove_non_numeric(amount_1)
        amount_2 = self.remove_non_numeric(amount_2)
        
        sub_total = float(amount_1) * float(amount_2)
        
        if currency != "":
            return currency + str(sub_total)
        else:
            return sub_total
    
if __name__ == '__main__':
    cp = CartPageElements()
#     print(cp.remove_non_numeric("$99.32"))
    print(cp.compute_sub_total('$10.99', 2, '$'))