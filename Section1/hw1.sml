(* val is_older = fn : (int * int * int) * (int * int * int) -> bool *)

fun is_older ( date1 : int * int * int, date2 : int * int * int) =
    if #1 date2 > #1 date1
    then true
    else 
	if #1 date2 = #1 date1 andalso #2 date2 > #2 date1
	then true
	else
	    #1 date2 = #1 date1 andalso #2 date2 = #2 date1 andalso #3 date2 > #3 date1
	
(* val number_in_month = fn : (int * int * int) list * int -> int *)	

fun number_in_month (dates : ( int * int * int ) list, month: int )=
    if null dates
    then 0
    else
	let val xs = hd(dates)
	in
	    if #2 xs = month
	    then 1 + number_in_month(tl(dates), month)
	    else number_in_month(tl(dates), month)
	end

(* val number_in_months = fn : (int * int * int) list * int list -> int *)	    
fun number_in_months (dates : (int * int * int) list, months : int list )=
    if null months 
    then 0
    else
	number_in_month(dates, hd(months)) + number_in_months(dates, tl(months))
	
(* val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list *)

fun dates_in_month ( dates : ( int * int * int ) list, month: int ) =
    if null dates
    then []
    else
	let val date = hd(dates)
	in
	    if #2 date = month
	    then date :: dates_in_month(tl(dates), month)
	    else dates_in_month(tl(dates), month)
	end

(* val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list *)

fun dates_in_months ( dates : ( int * int * int ) list, months: int list ) =
    if null months
    then []
    else
	dates_in_month(dates, hd(months) ) @ dates_in_months(dates, tl(months))


(* val get_nth = fn : string list * int -> string  *)

fun get_nth ( elements: string list, n: int )=
    if n = 1
    then
	hd(elements)
    else
	get_nth(tl( elements), n-1)

(* val date_to_string = fn : int * int * int -> string *)

fun date_to_string ( date: int * int * int  )=
    let
	val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	 get_nth(months,#2 date)^ " " ^Int.toString( #3 date) ^ ", " ^ Int.toString( #1 date)
    end


(* val number_before_reaching_sum = fn : int * int list -> int *)

fun number_before_reaching_sum ( sum: int, xs : int list )=
    if sum >  hd(xs)
    then 
	1 + number_before_reaching_sum(sum - hd(xs) , tl(xs))
    else
	0


(* val what_month = fn : int -> int *)

fun what_month (day : int )=
    let
	val months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	number_before_reaching_sum(day, months) + 1
    end


(* val month_range = fn : int * int -> int list *)

fun month_range (day1 : int, day2: int)=
    if day1 > day2
    then []
    else
	let
	    val month1 = what_month(day1)
	    val month2 = what_month(day2)
	    fun count_up (month1 : int, month2 : int)=		
		if month1 = month2
		then
		    month2 :: []
		else
		    month1 :: count_up(month1 +1, month2)
				      
	in
	    count_up( month1, month2)
	end


(* val oldest = fn : (int * int * int) list -> (int * int * int) option *)

fun oldest ( dates : ( int * int * int ) list )=
    if null dates
    then NONE
    else
	let
	    fun oldest_nonempty ( dates : (int * int * int ) list )=
		if null (tl dates)
		     then hd dates
		     else let val tl_ans = oldest_nonempty (tl dates)
			  in
			      if is_older( hd dates, tl_ans)
			      then hd dates
			      else tl_ans
			  end
	in
	    SOME (oldest_nonempty dates)
	end
	
	
