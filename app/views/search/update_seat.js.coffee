#TODO: Start here
$("#product_dd").empty().append("<%= escape_javascript(render 'seat/seat' ) %>");
$('.airline_logo').attr( "src" , "<%= image_path "/images/airline/"+ @airline_logo, :class => ".airline_logo" %>" );
