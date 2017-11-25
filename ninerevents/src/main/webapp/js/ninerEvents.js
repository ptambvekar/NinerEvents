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
	
var eventDetailSuccess= function(event,status){	
		
		if (!event) {
			var sResult = '<table class = "table"><thead class="thead-light"><tr><th colspan="2">';
			sResult += 'No Events Found</th> </tr> </thead>';
			$('#eventDetail').append(sResult);
			return;
		}
			var sResult = ' ';
				sResult += ' <div class = "card-header"> <h3>'+event.eventName+'</h3> </div>' + 
				'<div class = "card-body">'+
                '<div class = "row-ml-2"> <h5>'+event.eventDescription+' </h5></div> <hr> <div class = "row"> <div class = "col-xs-12 col-md-6"> <h5>Venue</h5><div>'+
                 event.venue_name+' </div></div><div class = "col-xs-12 col-md-6"><h5> Event Date and Time </h5><div> '+event.event_date+                         
                '</div><div> '+event.start_time+' </div></div></div> <br/> <div class = "row justify-content-center"><div class = "col-*-12"><h5>Contact Information</h5></div></div>'+
                '<div class = "row justify-content-center"><div class = "col-*-12"><div>'+event.first_name+' '+event.last_name+
                '</div><div> '+event.phone_number+' </div> <div> '+event.email_address+' </div></div></div></div> <div class = "card-footer">'+
                '<a href="#register-modal" class="btn btn-outline-success btn-success btn-lg" role="button" data-toggle="modal" data-target="#register-modal">'+
                'Register </a></div><div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="register-modal" aria-hidden="true"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title" id="exampleModalLabel">Register</h5><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><form><div class="modal-body"><div class="container-fluid"><div class="form-group row"><label for="input-email" class="col-sm-2 col-form-label">Email</label><div class="col-sm-10"><div class="input-group"><input type="text" class="form-control" id="input-email" placeholder="example@email.com"/><div class="input-group-addon"><i class="material-icons">email</i></div></div></div></div></div></div><div class="modal-footer"><button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">Close</button><button type="button" class="btn btn-outline-primary">Register</button></div></form></div></div></div>'
                
			$('#eventDetail').append(sResult);
	}
	
	$.ajax({
		  url: '/ninerevents/webapi/event/eventDetail',
		  success: eventDetailSuccess,
		  error:function(resp){
			  console && console.log('Error in geting upcoming events:',resp);
		  },
		  dataType: 'json'
		});

});