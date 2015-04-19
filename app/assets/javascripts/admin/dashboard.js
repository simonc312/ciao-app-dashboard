$('document').ready(function(){
	var subchannels = ['online','offline','organic'];
	var update_subchannels = function(){
		
		var channel_type = $(this).attr('value');
		
		for(var i=0; i<subchannels.length;i++){
			var cur_channel_type = subchannels[i];
			if(channel_type === 'all' || channel_type === cur_channel_type){
				$('#subchannel-collapse #'+cur_channel_type).show();
			}
			else
				$('#subchannel-collapse #'+cur_channel_type).hide();
		}
		
	};
	$('#channel-types button').click(update_subchannels);
	
});
