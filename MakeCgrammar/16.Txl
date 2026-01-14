%Grammar for input 16:
keys
	const unsigned signed if else switch case break default for while do '& 
end keys

compounds
	'<= '>= '&& '|| '== '++ '--
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

%if-else statements grammar ----------------------------------------------------------

define if_statement
	if ([expression]) [NL] [if_body]
	[opt else_statement]
end define

define if_body
	{ [NL][IN] [repeat statements][EX] }
	| [IN] [statement] [EX]
end define

define else_statement
	[NL] else [NL] [else_body] [EX]
end define

define else_body
	{ [NL][IN] [repeat statements] [EX]} [IN]
	| [IN] [statement]
end define

%switch statement grammar-------------------------------------------------------------

define switch_statement
	switch ([expression]) [NL] [switch_body] 
end define

define switch_body
	{[NL][IN]
	[repeat default_or_case_statements]
	[EX]}
end define

define default_or_case_statements
	[case_statement]
	| [default_statement]
end define

define case_statement
	case [id_or_data_types]': [NL][IN] [repeat statements] break; [EX][NL]
end define

define default_statement
	default ': [NL][IN] [repeat statements] [EX]
end define

%for-loop grammar -------------------------------------------------------------

define for_loop
	for([for_init]';
	[loop_condition] ';
	[loop_incr]) [NL][IN]
	[statement] %this way only one thing will be in the forloop when no square brackets are included
	[EX]
end define

define for_init
	[id] [assignment_op] [expression]
end define

define loop_condition
	[expression] '<= [expression]
	| [expression] '< [expression]
	| [expression] '>= [expression]
	| [expression] '> [expression]
	| [expression] '== [expression]

end define

define loop_incr
	[id][incr_or_dec]
end define

define incr_or_dec
	'++
	| '--
end define

%while-loop -------------------------------------------------------------

define while_loop
	while ([loop_condition]) [NL]
	{ [NL][IN]
	[repeat while_statements]
	[EX]}
end define

define while_statements
	[loop_incr] ;[NL]
	| [statements]
end define

%do-while-loop--------------------------------------------------------------

define do_while
	do [NL]
	{ [NL][IN]
	[repeat while_statements]
	[EX]}[NL]
	while ([loop_condition])';
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
	| [switch_statement]
	| [for_loop]
	| [while_loop]
	| [do_while]
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
