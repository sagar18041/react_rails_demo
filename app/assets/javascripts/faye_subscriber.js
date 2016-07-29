FayeSubscriber = {
  // incoming: function(message, callback) {
  // 	if(message.channel == "/meta/subscribe") {
  //   	console.log('incoming', message);
  //   }
  //   callback(message);
  // },
  outgoing: function(message, callback) {
  	if(message.channel == "/meta/subscribe") {
    	// console.log('outgoing', message);
    	if (!message.ext) message.ext = {};
       message.ext.subscriber_chat_id = 'xyz' ;
        
    }
    callback(message);
  }
};