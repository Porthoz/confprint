$c->{search}->{simple} = 
{
	search_fields => [
		{
			id => "q",
			meta_fields => [
				"title",
				"abstract",
				"ref_soporte",
				"documents",
		 		"subjects",
				"date", 
				"creators_name",
		 		"realizador_recolla_name",
				"informantes_name",
				"informante_grupo",
				"coleccion",
				"dixitalizadores_name",
				"transcriptores_name",
				# "tipo_peza",
				"texto_peza", 
				"coleccion",
				"divisions",
				"keywords",
                "tempo",
				"incipit_melodico",
			]
		},
	],
	preamble_phrase => "cgi/search:preamble",
	title_phrase => "cgi/search:simple_search",
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
		
