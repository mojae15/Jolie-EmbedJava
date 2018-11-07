include "console.iol"
include "string_utils.iol"

type Split_request: void{
	.s: string
	.reg: string

}

type Split_res: void{
	.s_array*: string
}

interface FuncInterface{
	RequestResponse: split(Split_request)(Split_res)
}

outputPort Func{
	Interfaces: FuncInterface
}

embedded {
	Java: "Func" in Func
}



main{

	split@Func( {.s = "Hej med Dig", .reg = " "})(res);

	valueToPrettyString@StringUtils(res)(s);
	println@Console(s)()

}