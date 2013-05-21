function refresh_messages() {
  function refresh() {
    $.get('/messages.js', null, function(data, textStatus) {
      
    });
  }
  setInterval(refresh, 10000);
}
$(document).ready(refresh_messages);
