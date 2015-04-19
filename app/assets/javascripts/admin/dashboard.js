$('document').ready(function(){
	var channels = ['online','offline','organic'];
	var update_subchannels = function(){
		
		var channel_type = $(this).attr('value');
		
		for(type of channels){
			if(channel_type === 'all' || channel_type === type){
				$('#subchannel-collapse #'+type).show();
			}
			else
				$('#subchannel-collapse #'+type).hide();
		}
		
	};
	$('#channel-types button').click(update_subchannels);
	
});
