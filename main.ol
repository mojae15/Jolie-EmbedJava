include "console.iol"
include "string_utils.iol"
include "queue_utils.iol"

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

constants {
	stringToSplit = "Hej med dig",
	regex = " "
}

main{

	request.s = stringToSplit;
	request.reg = regex;

	split@Func( request )( res );


	valueToPrettyString@StringUtils(res)(s);
	//size@QueueUtils(res.s_array)(test);

	print@Console("[")();

	for(i = 0, i < #res.s_array-1, i++){
		print@Console("\""+ res.s_array[i]+"\", ")()
	};

	println@Console("\""+ res.s_array[#res.s_array-1]+"\"]")()


	

}