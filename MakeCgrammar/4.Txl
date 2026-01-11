%Grammar for input 4:
keys
	const
end keys

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
	[id][list variables]; [NL] [return_statement]
	| [repeat variable_declaration] [return_statement]
	| const [variable_initialization] [return_statement]
	| [print_statement] [return_statement]
end define

define variables
	[id]
end define

define return_statement
	return [return_value]; [NL][EX]
end define

define return_value
	[number]
end define

define variable_declaration
	[id] [id]; [NL]
end define

define print_statement
	printf([stringlit]); [NL]
end define

define variable_initialization
	[id] [id] [assignment_op] [number]; [NL]
	| const [id] [id] [assignment_op] [number]; [NL]
end define

define assignment_op
	'=
end define

%Rules:
function main
    match [program]
	P[program]
end function
