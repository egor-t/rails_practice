$(document).ready(function() {
  var carriage_type;
  var carriage_seats;

  carriage_seats = $('.carriage_seats');
  carriage_type = $('#carriage_type');

  display_correct_carriage_seats(carriage_type.val());

  carriage_type.on('change', function (e) {
    $(".carriage_seats input").val("");
    carriage_seats.hide();
    display_correct_carriage_seats(this.value);
  });


  function display_correct_carriage_seats(carriage_type) {
    switch (carriage_type) {
        case 'EconomyCarriage':
            $('.top_seats').show();
            $('.bottom_seats').show();
            $('.side_top_seats').show();
            $('.side_bottom_seats').show();
            break;
        case 'CoupeCarriage':
            $('.top_seats').show();
            $('.bottom_seats').show();
            break;
        case 'SvCarriage':
            $('.bottom_seats').show();
            break;
        case 'SeatCarriage':
            $('.seating_place').show();
            break;
    }
  };
});

    