$(document).ready(function() {
	$('#address').keyup(function() {	
	var address = $(this).val();
   	var resultView = $('#resultaddress');
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/admin/address.gbg',
			data : {'address' : address},
			success : function(data) {
				 if(data.size==0 || address=="") {
					$('#resultaddress').empty();
					$('#resultaddress').hide();
				 } else{
					makeList(data);
					 
				 }
			}
		});
	});
	function makeList(data) {
		var output ='<table>';
		var zsize = data.ziplist.length;
		for(var i=0;i<zsize;i++) {
			output += '<tr>';		
			output += 	'<td class="address">';
			output += '<span>'+data.ziplist[i].address+'</span>';
			output += 	'</td>';		
			output += '</tr>';
		}
		output += '</table>';	
		$('#resultaddress').empty();
		$('#resultaddress').show();
		$('#resultaddress').append(output);
	}
	$(document).on('click','.address',function() {
		$('#address').val($(this).children('span').text());
		$('#resultaddress').empty();
		$('#resultaddress').hide();
	});
	$(document).on('focusin','#person',function() {
		$('#resultperson').show();
	});
	
});
var adult=1;
var child=0;
function adultplus() {
	if(adult==9) {
		$('#adultplus').parents('div').children('span').text('9');
	} else {
		$('#adultplus').parents('div').children('span').text(++adult);
	}
}

function adultminus() {
	if(adult==1) {
		$('#adultminus').parents('div').children('span').text('1');
	} else {
		$('#adultminus').parents('div').children('span').text(--adult);
	}
}
function childplus() {
	if(child==9){
		$('#childplus').parents('div').children('span').text('9');
	} else {
		$('#childplus').parents('div').children('span').text(++child);
	}
}

function childminus() {
	if(child==0){
		$('#childminus').parents('div').children('span').text('0');	
	} else {
		$('#childminus').parents('div').children('span').text(--child);
	}
}

function personcancel() {
	$('#resultperson').hide();
}

function personok() {
	if(child==0) {
		$('#person').val("성인"+adult+"명");	
	} else {
		$('#person').val("성인"+adult+"명,어린이"+child+"명");		
	}
	$('#resultperson').hide();
}