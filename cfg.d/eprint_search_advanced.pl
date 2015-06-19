
$c->{search}->{advanced} = 
{
	search_fields => [
		{ meta_fields => [ "title" ] },
		# { meta_fields => [ "type" ] },
		{ meta_fields => [ "tipo_peza" ] },
		{ meta_fields => [ "subjects" ] },
		{ meta_fields => [ "creators_name" ] },
		{ meta_fields => [ "date" ] },
		{ meta_fields => [ "loc_concello", "loc_parroquia","loc_lugar" ] },		
		{ meta_fields => [ "coleccion" ] },
		{ meta_fields => [ "informantes_name" ] },
		# { meta_fields => [ "transcriptores_name" ] },
		# { meta_fields => [ "dixitalizadores_name" ] },		
		# { meta_fields => [ "title" ] },		
		# { meta_fields => [ "abstract" ] },
		# { meta_fields => [ "linguaxe" ] },
		# { meta_fields => [ "titulo_da_peza" ] },
		{ meta_fields => [ "incipit_do_texto" ] },
		{ meta_fields => [ "xenero" ] },
		{ meta_fields => [ "modo_interpretacion" ] },
		{ meta_fields => [ "instrumentacion" ] },
		{ meta_fields => [ "instrumentos" ] },
		{ meta_fields => [ "tempo" ] },
		{ meta_fields => [ "texto_peza" ] },
		{ meta_fields => [ $EPrints::Utils::FULLTEXT ] },
		{ meta_fields => [ "documents.format" ] },
	],
	preamble_phrase => "cgi/advsearch:preamble",
	title_phrase => "cgi/advsearch:adv_search",
	citation => "result",
	page_size => 20,
	order_methods => {
		"byyear" 	 => "-date/creators_name/title",
		"byyearoldest"	 => "date/creators_name/title",
		"byname"  	 => "creators_name/-date/title",
		"bytitle" 	 => "title/creators_name/-date"
	},
	default_order => "byyear",
	show_zero_results => 1,
};

