var ready;
ready = function() {
  $('.datepicker').pickadate();
  $("#order_customer_id").select2();
  $("#search_mobile").select2();
};

$(document).ready(ready);
$(document).on('page:load', ready);
