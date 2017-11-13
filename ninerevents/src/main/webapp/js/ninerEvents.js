/**
 * 
 */

$(function() {
	$("#datepicker").datepicker({
		autoSize : true
	});
	
	
	var upcomingEventsSuccess= function(data,status){
		
		if (!data) {
			var sResult = '<table class = "table"><thead class="thead-light"><tr><th colspan="2">';
			sResult += 'No Events Found</th> </tr> </thead>';
			$('#upcomingEvents').append(sResult);
			return;
		}
			var sResult = '';
			$.each(data,function(date,events){
				sResult += '<thead class="thead-light"><tr><th colspan="2">';
				sResult += moment(date).format('LL')+ '</th> </tr> </thead><tbody>';
				events.forEach(function(event){
					sResult += '<tr><td class="col-*-6">' + event.eventName + '</td>';
					sResult += '<td class="col-*-6">' + event.start_time + '</td> </tr>';
					sResult += '</tbody>'
				});
			});
			$('#upcomingEvents').append(sResult);
	}
	
	$.ajax({
		  url: '/ninerevents/webapi/event/upcomingEvents',
		  success: upcomingEventsSuccess,
		  error:function(resp){
			  console && console.log('Error in geting upcoming events:',resp);
		  },
		  dataType: 'json'
		});
	
});