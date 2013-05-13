$(document).ready(function() {
  if ($('.torrent_controls').size() > 0) {
    $('.torrent_controls').click( function() {
      var target = $(this);
      var id = target.data('id');
      var action = target.data('action');
      var url = '/torrents/'+ id + '/controls';

      $.get(url, {do: action}, function(data, textStatus, xhr) {
        //optional stuff to do after success
        if (data.result == 'success') {
          switch_class(target, action);
        }
      });
    });  
  }
  var switch_class = function (target, action) {
    if (action == 'stop') {
      target.removeClass('btn-warning');
      target.addClass('btn-success');
      target.text("Démarrer");
      target.data('action', 'start');
    } else if (action == 'start') {
      target.removeClass('btn-success');
      target.addClass('btn-warning');
      target.text("Pause");
      target.data('action', 'stop');
    }
  }

if ($('.torrent_controls').size() > 0) {
    function refresh_handler() {
        function refresh() {
           $.get('/torrents.js', null, function(data, textStatus) {
           });
        }
        setInterval(refresh, 10000); //every 10 seconds
    }
    $(document).ready(refresh_handler);
  }
  
});


