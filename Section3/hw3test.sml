only_capitals ["One", "two", "Three"];
only_capitals ["One"];
only_capitals ["two"];
only_capitals ["One", "Two", "Three"];

val test1 = longest_string1 ["first6", "second7", "thirddd8", "fourthhh9"] = "fourthhh9"
val test2 = longest_string1 ["first9999", "first6", "second7", "thirddd8", "fourthhh9"] = "first9999" 
val test3 = longest_string1 ["first9999", "ssss", "dd"] = "first9999"

val test4 = longest_string2 ["first6", "second7", "thirddd8", "fourthhh9"] = "fourthhh9"
val test5 = longest_string2 ["first9999", "first6", "second7", "thirddd8", "fourthhh9"] = "fourthhh9"  
val test6 = longest_string2 ["first9999", "ssss", "dd"] = "first9999"
val test7 = longest_string2 [] = ""
