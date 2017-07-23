$("#from").datepicker({
  dateFormat: 'dd/mm/yy',
  minDate: '1',//min date set to next day
  onClose: function(dateStr) {
    var d = $.datepicker.parseDate('dd/mm/yy', dateStr), //get selected date
        date2 = $('#from').datepicker('getDate'),//get selected date
        years = 1 //how many years add to selected date
    d.setFullYear(d.getFullYear() + years); //add x years to selected date 
    date2.setDate(date2.getDate()+1);//add x days to selected date
    $('#to').datepicker('change','minDate', date2);//set to date atleast x days from selecteed date
    $('#to').datepicker('change',"maxDate", d);//set max date to be exactly x year(s) from selected date
    }
});
$("#from").datepicker("setDate", "1");//Set date x day(s) from current date and display it in input field. Needs to be done after initialization of datepicker.
  
$("#to").datepicker({
  dateFormat: 'dd/mm/yy',
  minDate: '+2d',//Set date x days from today
  maxDate: '+1y +1d'//max date x year + 1 day
});