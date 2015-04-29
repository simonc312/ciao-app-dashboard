$('document').ready(function(){
	var channels = ['online','offline','organic'];
	var update_subchannels = function(){
		
		var channel_type = $(this).attr('value');
		
/* Experimental for of loop doesn't compile to heroku

		for(type of channels){
			if(channel_type === 'all' || channel_type === type){
				$('#subchannel-collapse #'+type).show();
			}
			else
				$('#subchannel-collapse #'+type).hide();
		}*/

	for(var i=0; i<channels.length;i++){
		var type = channels[i];
		if(channel_type === 'all' || channel_type === type){
			$('#subchannel-collapse #'+type).show();
		}
		else
			$('#subchannel-collapse #'+type).hide();
	}	
		
	};
	$('#channel-types button').click(update_subchannels);

	//reveal modal popup on click edit for total costs
	$('#ticker-bar #edit_total_costs').click(function(e){	
		e.preventDefault();
		$('#fixedCostModal').modal('show');
	});


	//add focus to the fixed cost modal popup 
	$('#fixedCostModal').on('shown.bs.modal', function () {
  $('#fixedCostModal input').first().focus();
})
	
});
