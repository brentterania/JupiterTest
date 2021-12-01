class ContactPageElements():

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
#Utility
    def _get_input_by_id(self, id):
        return '//input[@id = "' + id + '"]'
    
    def _get_anchor_by_text(self, text):
        return '//a[contains(text(), "' + text + '")]'

    def _get_span_by_id(self, id):
        return '//span[@id = "' + id + '"]'
    
    def _get_textarea_by_id(self, id):
        return '//textarea[@id = "' + id + '"]'
    
    def _get_div_by_class(self, clas):
        return '//div[@class = "' + clas + '"]'  
    
#Elements       
    def forename_locator(self):
        return self._get_input_by_id('forename')
    
    def surname_locator(self):
        return self._get_input_by_id('surname')
        
    def email_locator(self):
        return self._get_input_by_id('email')
    
    def telephone_locator(self):
        return self._get_input_by_id('telephone')
    
    def message_locator(self):
        return self._get_textarea_by_id('message')
    
    def submit_locator(self):
        return self._get_anchor_by_text('Submit')

    def submission_message_locator(self):
        return  self._get_div_by_class('alert alert-success')
    
    def sending_feedback_popup(self):
        return '//div[@style = "display: block;"]/div[@class="modal-body"]'
    
#Error Elements
    def forname_error_locator(self):
        return self._get_span_by_id('forename-err')
    
    def email_error_locator(self):
        return self._get_span_by_id('email-err')
    
    def message_error_locator(self):
        return self._get_span_by_id('message-err')