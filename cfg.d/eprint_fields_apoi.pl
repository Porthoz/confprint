
##############################################################
#           Metadatos engadidos para o Apoi
##############################################################

push @{$c->{fields}->{eprint}},

###################################################
#          Campos Xenéricos
###################################################
# Referencia administrativa

{
	name => 'referencia',
	type => 'text',
},

# String coa referencia ó soporte
{
	name => 'ref_soporte',
	type => 'text',
        render_value => 'EPrints::Extras::render_preformatted_field',
},

# Título descriptivo da peza

{
	name => 'title',
	type => 'longtext',
	input_rows => 3,
	make_single_value_orderkey => 'EPrints::Extras::english_title_orderkey',
},

# Resumo da peza

{
	name => 'abstract',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 10,
},

# Linguaxe da peza
{
	name => 'linguaxe',
	type => 'set',
	multiple => 1,	
	options => [qw(
		galego
		castelan
	)],
	input_style => 'medium',
},

###################################################
#          Campos suscritos ó estudio etnográfico
##################################################

# Boleano para ver se a peza foi obxeto de estudo
{
	name => 'estudada',
	type => 'boolean',
	input_style => 'checkbox',
},

# Áreas de coñecemento etnográfico da peza
{
	name => 'subjects',
	type => 'subject',
	multiple => 1,
	top => 'subjects',
	browse_link => 'subjects',
},

# checkbox para o tipo de peza
{
	name => 'tipo_peza',
	type => 'set',
        multiple => 0,	
	options => [qw(
		rexistro
		relato
		entrevista
		outros
	)],
	input_style => 'medium',
},

###################################################
#          Campos suscritos á compilación
##################################################

# Data de recollida da peza
{
	name => 'date',
	type => 'date',
	min_resolution => 'year',
},


# Compilador
{
	name => 'creators',
	type => 'compound',
	multiple => 1,
	render_value => \&render_lista_url,
	fields => [
		{
			sub_name => 'name',
			type => 'name',
			hide_honourific => 1,
			hide_lineage => 1,
			family_first => 1,
			browse_link => 'creators',
		},
		
		{
			sub_name => 'id',
			type => 'text',
			input_cols => 5,
			allow_null => 1,
		},

		{
			sub_name => 'url',
			type => 'url',
			input_cols => 5,
			allow_null => 1,
		},
	],
	input_boxes => 2,
},

# Informantes das pezas
{
	name => 'informantes',
	type => 'compound',
	multiple => 1,
	# render_value => 'EPrints::Extras::render_lista_url',
	render_value => \&render_lista_url,
	fields => [
		{
			sub_name => 'name',
			type => 'name',
			hide_honourific => 1,
			hide_lineage => 1,
			family_first => 1,
		},
		{
			sub_name => 'id',
			type => 'text',
			input_cols => 5,
			allow_null => 1,
		},
		{
			sub_name => 'url',
			type => 'url',
			input_cols => 5,
		},

		],
	input_boxes => 2,
},

# Colección
{
	name => 'coleccion',
	type => 'text',
},

# Lugar da recolla / división territorial /Esto quítase
{
	name => 'divisions',
	type => 'subject',
	multiple => 1,
	top => 'divisions',
	browse_link => 'divisions',
},
###################################################
#          Campos suscritos ó lugar da recolla
##################################################
{
	name => 'loc_pais',
	type => 'text',
},

{
	name => 'loc_comunidade',
	type => 'text',
},

{
	name => 'loc_concello',
	type => 'text',
	browse_link =>'concello'
},

{
	name => 'loc_parroquia',
	type => 'text',
},

{
	name => 'loc_lugar',
	type => 'text',
},
###################################################
#          Campos suscritos á transcripción
##################################################


# Texto da peza / Transcripción
{
	name => 'texto_peza',
	type => 'longtext',
	input_rows => 10,
	render_value => \&render_textarea_field,
        #render_value => 'EPrints::Latex::render_string',
},

# Transcriptor da peza
{
	name => 'transcriptores',
	type => 'compound',
	multiple => 1,
	render_value => \&render_lista_url,
	fields => [
		{
			sub_name => 'name',
			type => 'name',
			hide_honourific => 1,
			hide_lineage => 1,
			family_first => 1,
		},
		
		{
			sub_name => 'id',
			type => 'text',
			input_cols => 5,
			allow_null => 1,
		},
	],
	input_boxes => 2,
},

##############################################################
#           Metadatos suscritos á dixitalización
##############################################################

# Soporte da gravación orixinal da peza (checkbox)
{
	name => 'tipo_soporte',
	type => 'set',
	multiple => 1,	
	options => [qw(
		papel
		cinta
		fotografia
		otros
	)],
	input_style => 'medium',
},

{
	name => 'dixitalizadores',
	type => 'compound',
	multiple => 1,
	render_value => \&render_lista_url,
	fields => [
		{
			sub_name => 'name',
			type => 'name',
			hide_honourific => 1,
			hide_lineage => 1,
			family_first => 1,
		},
		
		{
			sub_name => 'id',
			type => 'text',
			input_cols => 5,
			allow_null => 1,
		},
	],
	input_boxes => 2,
},
##############################################################
#           Metadatos suscritos ó estudio musical
##############################################################


#Ambito
{
	name => 'ambito',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'ambito_refran',
	type => 'text',
	render_quiet => 1,
},
	
{
	name => 'cadencias',
	type => 'text',
	render_quiet => 1,

},

{
	name => 'cadencias_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'escala',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'escala_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'numero_de_silabas',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'numero_de_silabas_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'forma_musical',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'forma_musical_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'forma_do_texto',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'forma_do_texto_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'incipit_melodico',
	type => 'text',
	render_quiet => 1,
},
{
	name => 'incipit_melodico_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'compas',
	type => 'text',
},

{
	name => 'compas_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'incipit_do_texto',
	type => 'text',
	render_quiet => 1,
	
},

{
	name => 'incipit_do_texto_refran',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'titulo_da_peza',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'tempo',
	type => 'text',
	render_quiet => 1,
},

{
	name => 'instrumentos',
	type => 'text',
	multiple => 1,
},

{
	name => 'instrumentacion',
	type => 'namedset',
	set_name => 'tipo_instrumentacion',
	multiple => 1,
	input_style => 'medium',
},

{
	name => 'xenero',
	type => 'namedset',
	set_name => 'tipo_xenero',
	#multiple => 1,
	input_style => 'medium',
},

{
	name => 'modo_interpretacion',
	type => 'namedset',
	set_name => 'tipo_modo_interpretacion',
	multiple => 1,
	input_style => 'medium',
	},


##############################################################
#           Notas
##############################################################

{
	name => 'notas_recolla',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 3,
},

# notas sobre o informante
{
	name => 'notas_informante',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 3,
},
# notas sobre a música
{
	name => 'notas_musica',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 3,
},
# notas sobre a dixitalización
{
	name => 'notas_dixitalizacion',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 3,
},
# notas sobre a transcripción
{
	name => 'notas_transcripcion',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 3,
},
# notas xerais
{
	name => 'notas_xerais',
	type => 'longtext',
	render_value => 'EPrints::Latex::render_string',
	input_rows => 3,
},


##############################################################
#           Outros
##############################################################

# Palabras clave de cada rexistro
{
	name => 'keywords',
	type => 'longtext',
	input_rows => 2,
},

;
