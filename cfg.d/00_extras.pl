# use HTML::Parser;

sub render_xeo
{
	my( $session, $field, $value ) = @_;

	my $f = $field->get_property( "fields_cache" );
	my $fmap = {};	
	foreach my $field_conf ( @{$f} )
	{
		my $fieldname = $field_conf->{name};
		my $field = $field->{dataset}->get_field( $fieldname );
		$fmap->{$field_conf->{sub_name}} = $field;
	}

	my $ul = $session->make_element( "ul" );
	foreach my $row ( @{$value} )
	{
		my $li = $session->make_element( "li" );
		
		
if (defined $row->{url}) {
		
		my $link = $session->render_link( $row->{url},"_blank" );
		if( defined $row->{lugar} )
		{
			$link->appendChild( $session->make_text ($row->{lugar}) );
		}
		else
		{
			
		}
		$li->appendChild($fmap->{tipo}->render_single_value($session,$row->{tipo}));
		$li->appendChild ($link);
}#if
else{
		
		#$li->appendChild( $session->make_text ($tipo));
		$li->appendChild($fmap->{tipo}->render_single_value($session,$row->{tipo}));
		$li->appendChild( $session->make_text ($row->{lugar}) );
}

		$ul->appendChild( $li );
	

}#foreach

	return $ul;
}

sub render_lista_url
{
	my( $session, $field, $value ) = @_;

	my $f = $field->get_property( "fields_cache" );
	my $fmap = {};	
	foreach my $field_conf ( @{$f} )
	{
		my $fieldname = $field_conf->{name};
		my $field = $field->{dataset}->get_field( $fieldname );
		$fmap->{$field_conf->{sub_name}} = $field;
	}

	my $ul = $session->make_element( "ul" );
	foreach my $row ( @{$value} )
	{
		my $li = $session->make_element( "li" );

	if (defined $row->{url}) {

		my $link = $session->render_link( $row->{url},"_blank" );
		if( defined $row->{name} )
		{
			$link->appendChild( $fmap->{name}->render_single_value( $session, $row->{name} ) );
		}
		else
		{
			my $text = $row->{name};
			#if( length( $text ) > 40 ) { $text = substr( $text, 0, 40 )."..."; }
			$link->appendChild( $session->make_text( $text ) );
		}

		$li->appendChild ($link);
	}#if
	else{
		$li->appendChild( $fmap->{name}->render_single_value( $session, $row->{name} ) );
	}

		$ul->appendChild( $li );
	

}#foreach

	return $ul;
}

#para hacer textareas
sub render_textarea_field
{
	my( $session , $field , $value ) = @_;

	my $area = $session->make_element( "textarea", readonly =>"readonly", cols =>"75",rows =>"40", style =>"text-align: justify; margin: 1em auto 0em auto" );
	$value =~ s/\r\n/\n/g;
	$area->appendChild( $session->make_text( $value ) );
	
	return $area;

}

sub render_autores
{
	my( $session, $field, $value ) = @_;

	my $f = $field->get_property( "fields_cache" );
	my $fmap = {};	
	foreach my $field_conf ( @{$f} )
	{
		my $fieldname = $field_conf->{name};
		my $field = $field->{dataset}->get_field( $fieldname );
		$fmap->{$field_conf->{sub_name}} = $field;
	}

	my $ul = $session->make_element( "ul" );
	foreach my $row ( @{$value} )
	{
		my $li = $session->make_element( "li" );

if (defined $row->{url}) {

		my $link = $session->render_link( $row->{url} );
		if( defined $row->{name} )
		{
			$link->appendChild( $fmap->{name}->render_single_value( $session, $row->{name} ) );
		}
		else
		{
			my $text = $row->{name};
			#if( length( $text ) > 40 ) { $text = substr( $text, 0, 40 )."..."; }
			$link->appendChild( $session->make_text( $text ) );
		}

		$li->appendChild ($link);
}#if
else{
		$li->appendChild( $fmap->{name}->render_single_value( $session, $row->{name} ) );
}

		$ul->appendChild( $li );
	

}#foreach

	return $ul;
}
