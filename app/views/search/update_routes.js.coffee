$("#routes1_dd").empty().append("<%= escape_javascript(render 'routes/routes1' ) %>");
$("#routes2_dd").empty().append("<%= escape_javascript(render 'routes/routes2' ) %>");
$('.aircraft_logo').attr( "src" , "<%= image_path "/images/aircraft/"+ @aircraft_logo.pop, :class => ".aircraft_logo" %>" );