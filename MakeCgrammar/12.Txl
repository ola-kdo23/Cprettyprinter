%Grammar for input 12:
keys
	const unsigned signed if else '&
end keys

compounds
	'<= '>= '&& '|| '==
end compounds

define program
	[c_function]
end define

define c_function
	[function_head] [NL]
	{ [NL][IN]
	  [function_body]
	}
end define

define function_head
	[return_type] [function_name]()
end define

define function_name
	[id]
end define

define return_type
	int
end define

define function_body
	[repeat statements]
end define

define multi_declaration
	[id][list variables];
end define

define variables
	[id]
end define

define return_statement
	return [return_value]; [EX]
end define

define return_value
	[number]
end define

define variable_declaration
	[variable_description] [id] [id];
	| [id] [id];
end define

define print_statement
	printf([stringlit]);
	| printf([stringlit],[expression]);
end define

define read_statement
	scanf([stringlit],[address]);
end define

define address
	'&[id]
end define

define if_statement
	if ([expression]) [NL][IN] [statement] % removed [EX], might need it back
	[opt else_statement] [EX]
	|if ([expression]) [NL] { [NL][IN] [repeat statements][EX] } [NL]
	[opt else_statement] [EX]
end define

define else_statement
	else [NL][IN][statement]
	|else [NL] { [NL][IN][repeat statements] [EX] } [IN]
end define

define variable_initialization
	[id] [id] [assignment_op] [expression];
	| [variable_description] [id] [id] [assignment_op] [expression];
	| [variable_description] [id] [assignment_op] [expression];
	| [id] [assignment_op] [expression];
end define

define assignment_op
	'=
end define

define variable_description
	const
	| unsigned
	| signed
end define

define statements
	[statement] [NL]
end define

define statement
	[multi_declaration]
	| [return_statement]
	| [variable_declaration]
	| [variable_initialization]
	| [print_statement]
	| [read_statement]
	| [if_statement]
end define

define id_or_data_types
	[number]
	| [stringlit]
	| [charlit]
	| [id]
end define
	
define expression
	[id_or_data_types]
	|[opt (][not_op] [expression] [opt )]
	|[opt (][expression] [op] [expression] [opt )]
end define

define term
	[id_or_data_types]
end define

define op
	'+
	|'-
	|'/
	|'*
	|'>
	| [assignment_op]
	|'<
	| [or_operator]
	| [and_operator]
	| [equality_operator]
end define

define or_operator
	'||
end define

define and_operator
	'&&
end define

define equality_operator
	'==
end define

define not_op
	'!
end define
	

%Rules:
function main
    match [program]
	P[program]
end function
