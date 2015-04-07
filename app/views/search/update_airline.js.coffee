$("#airline_dd").empty().append("<%= escape_javascript(render 'airline/airline' ) %>");

$('.alliance_logo').attr( "src" , "<%= image_path "/images/alliance/"+ @airline.first.logo_alliance, :class => ".alliance_logo" %>" );

