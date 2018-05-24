$(document).ready(function() {
  $('.search_form').submit(function() {
    var start_station;
    var end_station;
    start_station = $(this).find('#arrival_station');
    end_station = $(this).find('#departure_station');

    if(start_station.val() == end_station.val()) {
      alert('Выберите конечную станцию');
      return false;
    }
  });
});
