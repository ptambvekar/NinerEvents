/**
 * 
 */

$(function() {
	//populate Locations options
	$.get({
		url:'/ninerevents/webapi/event/eventLocations',
		success: function(response){
			if(!response || 1>response.length){
				console && console.log('No option was found for event-type dropdown:');
				return;
			}
			
			var categoryDropDown=$('#input-venue');
			htmlstring="<option label=' '>Any</option>";
			response.forEach(function(location){
				htmlstring += "<option value='"+location.id +"'>"+location.venueName+"</option>"
			});
			categoryDropDown.append(htmlstring);
			
		},
		error:function(resp){
			  console && console.log('Error in geting location dropdown:',resp);
		},
	});
	//populate Category options
	$.get({
		url:'/ninerevents/webapi/event/eventTypes',
		success: function(response){
			if(!response || 1>response.length){
				console && console.log('No option was found for event-type dropdown:');
				return;
			}
			
			var categoryDropDown=$('#input-event');
			htmlstring="<option label=' '>Any</option>";
			response.forEach(function(category){
				htmlstring += "<option value='"+category.id +"'>"+category.categoryName+"</option>"
			});
			categoryDropDown.append(htmlstring);
			
		},
		error:function(resp){
			  console && console.log('Error in geting category dropdown:',resp);
		},
	});
	
	
	$('#searchForm').on('submit',function(e){
		e.preventDefault();
		var form=$(this)
		var searchInputs=form.serializeArray();
		var searchQuery={}
		searchInputs.forEach(function(input){
			searchQuery[input.name]=input.value
		})
		$.post({
			url:'/ninerevents/webapi/event/searchresults',
			data:JSON.stringify(searchQuery),
			success:function(response){
				console.log(response)
			},
			dataType:'json',
			contentType:'application/json'
		});
		
	});
	
	$("#fullCalendar")
			.fullCalendar({
						themeSystem : 'standard',
						allDayDefault : false,
						aspectRatio : 1.7,
						cache : true,
						eventBackgroundColor : 'lightblue',
						header : {
							left : 'prev',
							center : 'title',
							right : 'today,month,basicWeek,basicDay,next',
							backgroundColor : '#6495ED'
						},
						events : function(start, end, timezone, callback) {
							// Check if the default start date is 1st of the
							// month or not.
							if (1 != start.get('date')) {// if not, that
								// means the
								// calendar shows
								// some days from
								// previous month in
								// the calendar.
								start.add('1', 'months') // hence go to next
								// month first, and
								// then LATER,
								// calculate start
								// date and end date
								// of that month
							}
							var today = $("#fullCalendar").fullCalendar(
									'getDate')

							dataToSend = {// we want to load only future
								// events and hence set start date
								// as current date if the 'start' is
								// in current month.
								startDate : today.isSame(start, 'month') ? today.format("YYYY-MM-DD HH:mm:ss").toString(): start.startOf('month').format("YYYY-MM-DD HH:mm:ss").toString(),
								endDate : start.endOf('month').format("YYYY-MM-DD HH:mm:ss").toString()
							}
							$.post({
									url : '/ninerevents/webapi/event/monthlyEvents',
									data : JSON.stringify(dataToSend),
									dataType : 'json',
									contentType : 'application/json',
									success : function(resp) {
										if (!resp || 1 > resp.length) {
											alert('No events posted for this month');
											return;
										}
										resp.forEach(function(event) {
											//event.url="/ninerevents/jsp/eventDetails.jsp";
											event.url = "/ninerevents/jsp/EventDetail.jsp?event="+ event.id
										});
										callback(resp);
									}
								});
						}
					});

});