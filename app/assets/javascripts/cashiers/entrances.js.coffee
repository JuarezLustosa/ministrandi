$(document).ready ->
  $(document).bind "ajaxError", "simple_form#new_cashier_entrance", (event, jqxhr, settings, exception) ->
    
    # note: jqxhr.responseJSON undefined, parsing responseText instead
    $(event.data).render_form_errors $.parseJSON(jqxhr.responseText)
    return
  return

jQuery ->
  $("#cashier_entrance_money").maskMoney()
