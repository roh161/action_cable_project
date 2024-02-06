App.chat = App.cable.subscriptions.create("ChatChannel", {
  received: function(data) {
    $('#messages').append("<p>" + data.message + "</p>");
  },
  
  send_message: function(message) {
    this.perform('receive', { message: message });
  }
});

$(document).on('submit', '#new_message', function(e) {
  e.preventDefault();
  var message = $('#message_content').val();
  $('#message_content').val('');
  App.chat.send_message(message);
});
