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
				sResult += moment(date).format('LL') + '</th> </tr> </thead><tbody>';
				events.forEach(function(event){
					sResult += '<tr><td class="col-*-6"> <a href="/ninerevents/jsp/EventDetail.jsp?event='+event.eventId+'" >' + event.eventName + '</a></td>';
					sResult += '<td class="col-*-6">' + moment(event.startDateTime).format('hh:mm A')+ '</td> </tr>';
					sResult += '</tbody>'
				});
			});
			$('#upcomingEvents').append(sResult);
	}
	
	var importantEventsSuccess= function(data,status){
		
		if (!data) {
			var sResult = '<table class = "table"><tr><th colspan="2">';
			sResult += 'No Events Found</th> </tr> </thead>';
			$('#importantEvents').append(sResult);
			return;
		}
			var sResult = '';
			data.forEach(function(event){
				sResult += '<thead><tr>';
				sResult += '<tr><td> <a href="/ninerevents/jsp/EventDetail.jsp?event='+event.eventId+'" >' + event.eventName + '</a></td></tr>';
					sResult += '</tbody>'
			});
			$('#importantEvents').append(sResult);
	}
	
	var featuredEventsSuccess= function(data,status){
		
		if (!data) {
			var sResult = '<table class = "table"><tr><th colspan="2">';
			sResult += 'No Events Found</th> </tr> </thead>';
			$('#featuredEvents').append(sResult);
			return;
		}
			var sResult = '';
			data.forEach(function(event){
					sResult += '<div class = "col-sm-4 col-md-4 col-xs-12"><div class="card text-center"><div class="card-header bg-primary text-white">';
					sResult += '<th align = "center">' + event.eventName + '</th>';
					sResult += '</div><div class="card-body bg-light h-200"><p class="card-title">';
				    sResult += event.eventDescription + '</p><hr/><p class = "card-text">' + moment(event.startDateTime).format('DD MMM YYYY');
				    sResult += "<br>"+moment(event.startDateTime).format('hh:mm A');
				    sResult += '</p></div><div class="card-footer text-muted"><a href="/ninerevents/jsp/EventDetail.jsp?event='+event.eventId+'" class="btn btn-primary">Register</a></div></div></div>'
			});
			$('#featuredEvents').append(sResult);
	}
	
	$.ajax({
		  url: 'webapi/event/upcomingEvents',
		  success: upcomingEventsSuccess,
		  error:function(resp){
			  console && console.log('Error in geting upcoming events:',resp);
		  },
		  dataType: 'json'
		});
	

	$.ajax({
		  url: 'webapi/event/importantEvents',
		  success: importantEventsSuccess,
		  error:function(resp){
			  console && console.log('Error in geting important events:',resp);
		  },
		  dataType: 'json'
		});
	
	$.ajax({
		  url: 'webapi/event/featuredEvents',
		  success: featuredEventsSuccess,
		  error:function(resp){
			  console && console.log('Error in geting featured events:',resp);
		  },
		  dataType: 'json'
		});
	
	
});