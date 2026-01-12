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
	[repeat expression]
end define

define multi_declaration
	[id][list variables];
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
	[variable_description] [id] [id]; [NL]
	| [id] [id];[NL]
end define

define print_statement
	printf([stringlit]); [NL]
end define

define variable_initialization
	[id] [id] [assignment_op] [data_types]; [NL]
	| [variable_description] [id] [id] [assignment_op] [data_types]; [NL]
	| [variable_description] [id] [assignment_op] [data_types]; [NL]
	| [id] [assignment_op] [data_types]; [NL]
end define

define assignment_op
	'=
end define

define variable_description
	const
	| unsigned
	| signed
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
