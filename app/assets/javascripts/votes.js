$(document).ready(function() {

console.log("script loaded - video");

$('.vote_button').on('click', function(){
	console.log('button clicked')
	

	if ($(this).hasClass('vote_up')) {
		console.log("vote up")
		$(this).css("color", "blue")
		var vote_status = 1
		var user = 2


	} else {
		console.log("vote down")
		$(this).css("color", "blue")
		$('.vote_up').css("color", "black")
		vote_status = -1
	}

	// if ($(this).hasClass('vote_up')){
			$.ajax({
            url: '/votes',
            type: 'POST',  
            data: {
            	
            	'curriculum_id' : $('.curric').val(),

            	'value' : vote_status,
            	'video_id' : $('.video').val(),
            	'user_id' : user
            },
            success: function(result){
            	console.log("you added a vote ");
            	console.log(result)

            }
        })
	

	// } else {
	// 	$.ajax({
 //            url: '/votes',
 //            type: 'POST',
 //          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},    
 //            data: {value: vote_status},
 //            success: function(result){
 //            	console.log("you added a vote")
 //            }
 //        })
	// }


})
})