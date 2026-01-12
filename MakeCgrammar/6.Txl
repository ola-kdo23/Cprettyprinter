%Grammar for input 6:
keys
	const, unsigned, signed
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
	[repeat statement]
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
end define

define variable_initialization
	[id] [id] [assignment_op] [data_types];
	| [variable_description] [id] [id] [assignment_op] [data_types];
	| [variable_description] [id] [assignment_op] [data_types];
	| [id] [assignment_op] [data_types];
end define

define assignment_op
	'=
end define

define variable_description
	const
	| unsigned
	| signed
end define

define statement
	[expression] [NL]
end define

define expression
	[multi_declaration]
	| [return_statement]
	| [variable_declaration]
	| [variable_initialization]
	| [print_statement]
end define

define data_types
	[number]
	| [stringlit]
	| [charlit]
end define
	

%Rules:
function main
    match [program]
	P[program]
end function
