jQuery ->
  $('#autocomplete_product_in_store').autocomplete
    minLength: 2
    source: "/autocompletes/stock_stores"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#product_id').val ui.item.id
        $('#unit_price').val ui.item.retail_price
        $('#barcode').focus()
        $('#cashier_sales_item_form').submit()


  $("#cashier_sale_money").maskMoney()
  $("#cashier_sale_descount").maskMoney()
  
  $("#cashier_sale_payment").change ->
    action = this.form.action
    selected = this.value
    
    if selected is "0"
      $('.cashier_sale_descount').val("0.00")
      showCashInputs()
      submitForm(selected, action)
    else
      hideCashInputs()
      submitForm(selected, action)
    return
  
  showCashInputs = () ->
    $(".cashier_sale_money").show()
    $("#cashier_sale_money").focus()
    $(".cashier_sale_descount").show()
    
  hideCashInputs = () -> 
    $(".cashier_sale_money").hide()
    $(".cashier_sale_descount").hide()
  
  submitForm = (selected, action) -> 
    $.ajax
      type: "PUT"
      url: action
      data:
        cashier_sale: { payment: selected, descount: "0.00" } 
      headers:
        Accept : "text/javascript; charset=utf-8"
       "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
    return
    
  $("#barcode").keyup ->
    field = $(this)
    if field.val().length is 13
      $.ajax
        url: "/products/find_by_barcode.js"
        data:
          term: $(this).val()
    return
      