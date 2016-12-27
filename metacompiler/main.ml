type binary_ty =
	| ADD
	| MUL
	| DIV
	| SUB

type unary_ty =
	| NEG
	| EXP

type const_arith = {
	(*value = ((offset + (parameter_size*mul))/divider);
	While this may be clunky, it is able to make hopefully all valid
	integer calculations. TODO: Check that this actually works.
	Like formally. Any it cannot handle should be added.*)
	offset:int;
	multiplier:int;
	divider:int;
}
type param_d =
	| CONST_P of int
	| INPUT_P of string
	| DEPENDENT_P of const_arith * param_d

type index_d =
	| CONST_I of const_arith * param_d
	| INPUT_I of string * param_d
	| DEPENDENT_I of const_arith * index_d
	| SUM_I of index_d * index_d
	| RANGE_I of range_d
and range_d = {
	start:index_d;
	endi:index_d;
	incr:int;
}

type variable_ty =
	| FLOAT
	| INT

type variable =
	| INDEX of index_d
	| PARAMETER of param_d
	| VARIABLE of variable_ty

type data_ty =
	| TEMPORARY
	| STORED of string
	| INPUT of string
	| OUTPUT of string
	| CONST_FLOAT of float
	| CONST_INT of int


type var_arr = {
	var:variable;
	size:param_d;
	ty:data_ty;
}

type data_access = {
	varr:var_arr;
	index:index_d;
}

type expression =
	| BINARY of binary_ty * expression * expression
	| UNARY of unary_ty * expression
	| LOAD of data_access

type condition_d = {express:expression;}

type header_ty =
    | FOR of range_d
    | WHILE of condition_d
    | IF of condition_d

type block_ty =
	| ASSIGN of (expression * data_access)
	| BLOCK of (header_ty * (block_ty list))

let begin_arith = {offset=0;multiplier=0;divider=1;}
let end_arith = {offset=0;multiplier=1;divider=1;}

let len = INPUT_P("arrsize")
let data1 = {var=VARIABLE(FLOAT);size=len;ty=INPUT("data1");}
let data2 = {var=VARIABLE(FLOAT);size=len;ty=INPUT("data2");}
let outdata = {var=VARIABLE(FLOAT);size=len;ty=OUTPUT("outdata");}
let for_range = {start=CONST_I(begin_arith,len);endi=CONST_I(end_arith,len);incr=1}
let for_loop = BLOCK(NULL_BLOCK,FOR(for_range))
let sum = CONST_FLOAT(0.0)
let d1load = LOAD({varr=data1;index=RANGE_I(for_range)})
let d2load = LOAD({varr=data2;index=RANGE_I(for_range)})
let mulval = BINARY(MUL,d1load,d2load)
let assignval = ASSIGN(mulval,{varr=outdata;index=RANGE_I(for_range)})
let assignchunk = BLOCK(for_loop,assignval)

let head_str head =
	match head with
	FOR(range_d)

let rec to_str x =
	match x with
	ASSIGN(exp,da) ->
	| BLOCK(head,newblocks) -> String.concat " " (List.map to_str newblocks)



let rec fact x = if x == 0 then 1 else x * fact (x-1)
let _ = Printf.printf "%d" (fact 50)
