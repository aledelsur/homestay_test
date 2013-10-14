$(document).ready(function(){

  // Datepicker
  $('#start_date').datepicker({
    dateFormat: 'yy-mm-dd',
    defaultDate: '-4m',
    onSelect: function(selected) {
        $("#end_date").datepicker("option","minDate", selected)
      }
  });

  // Datepicker
  $('#end_date').datepicker({
    dateFormat: 'yy-mm-dd',
    defaultDate: '-4m',
    onSelect: function(selected) {
        $("#start_date").datepicker("option","maxDate", selected)
      }    
  });
  
  // Form Validations
  $("#search_form").submit(function(){
    var start_date = $("#start_date").val();
    var end_date = $("#end_date").val();

  	if (start_date == "" || end_date == ""){
			alert("You have to select a Start Date and End Date");
			return false;
		}
  });

  // Cycle plugin
  $('#slider-right').cycle({ 
      fx:    'fade',
      speed:  'fast', 
      timeout: 3000, 
      pause:   1
  });

  // s3ShareIt plugin
  $('body').s3ShareIt({'opacity':.7});

  // Bootstrap Tooltip plugin
  $('#start_date, #end_date, #customDropdown1').tooltip();

});