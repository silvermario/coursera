(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* val all_except_option = fn : string * string list -> string list option  *)

fun all_except_option1 ( s: string, lst: string list )=
    let
	fun helper (s, lst)=
   	   case lst of
	       [] => []
	     | x::xs => if same_string(s,x) then
			    helper(s, xs)
			else
			    x :: helper(s, xs)
	val tl_ans = helper(s, lst)
	   
    in
	if tl_ans = lst then
	    NONE
	else
	    SOME tl_ans
    end
 
fun all_except_option ( s: string, lst: string list )=
    case lst of
	[] => NONE
      | x::xs => case(same_string(s,x)) of
		     true =>  SOME(xs)
		  | false => case (all_except_option(s, xs)) of
				 NONE => NONE
				 | SOME y  => SOME(x::y) 


(* val get_substitutions1 = fn : string list list * string -> string list  *)

fun get_substitutions1 ( lst: string list list, s: string ) =
    case lst of
	[] => []
	| x::xs => case(all_except_option(s,x)) of
		   NONE => get_substitutions1(xs,s)
		   | SOME y => y@(get_substitutions1(xs,s))


(* val get_substitutions2 = fn : string list list * string -> string list  *)

fun get_substitutions2 (  xs: string list list, s: string ) =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
		| x::xs' => case(all_except_option(s,x)) of
			       NONE => aux(xs', acc)
			       | SOME y => aux(xs', acc@y)
    in
	aux(xs, [])
    end

(* val similar_names = fn : string list list * {first:string, last:string, middle:string}  
-> {first:string, last:string, middle:string} list *)

fun similar_names (lst: string list list, {first:string, middle:string, last:string} ) =

   let
      
      (*  val {first = f, middle = m, last = l} = full_name
       val names_list = get_substitutions2(lst, f) *)
       fun names(acc)=
	   case acc of
	       [] => [] 
	       | x::xs' => {first=x, middle=middle, last=last}::names(xs') 
   in
     {first = first, middle = middle, last = last} :: names(get_substitutions2(lst, first))
   end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* val card_color = fn : card -> color *)

fun card_color (suit, rank)=
    case suit of
	Spades => Black
	| Clubs => Black 
     | _ => Red 


(* val card_value = fn : card -> int *)

fun card_value (suit, rank)=
    case rank of
	Num  x  => x
	| Ace => 11
	| _ => 10 

(* val remove_card = fn : card list * card * exn -> card list *)

fun remove_card (cs: card list, c:card, e:exn)=
    case cs of
	[] => raise e
        | x::cs'  => case (x = c) of
			 true => cs'
		         | false  => x::(remove_card(cs',c,e)) 


(* val all_same_color = fn : card list -> bool *)

fun all_same_color (cs : card list )=
    case cs of
	[] => true
     | x::[] => true
     | head::neck::rest =>  card_color(head) = card_color(neck) andalso all_same_color(neck::rest)
				  
   
(* val sum_cards = fn : card list -> int *)


fun sum_cards (cs)=
    let
	fun add_card(cs, acc)=
	    case cs of
		[] => acc
	     | x::xs' => add_card(xs',acc + card_value(x))
    in
	add_card(cs,0)
    end
	    


(* val score = fn : card list * int -> int *)

fun score (cs: card list, goal: int )=
    let
	val tl_ans = sum_cards(cs)
	val samecolor = all_same_color(cs)
    in
	case tl_ans > goal of
	    true => (case samecolor of
			true => ((tl_ans - goal) * 3) div 2
		     | false => (tl_ans - goal) * 3 )
	  | false =>(  case samecolor of
			true => (goal - tl_ans) div 2
		     | false => goal - tl_ans
		    )
    end

(*
val officiate = fn : card list * move list * int -> int *)

fun officiate (cards, moves:move list, goal:int)=
    let
	fun game(game_state)=
	    case game_state of
		(_, [], held_cards, goal) => score(held_cards,goal)
	      | ([], _, held_cards, goal) => score(held_cards,goal)
	      | ((card'::cards'), move'::moves', held_cards, goal) =>  case move' of
								     Discard c =>   game(cards', moves',( remove_card (held_cards, c, IllegalMove)),goal) 
								     | Draw  => 
								       (* case (card_value(card')+sum_cards(held_cards)) > goal of *)
								        case (sum_cards(card'::held_cards)) > goal of
									     true => score(card'::held_cards, goal)
									  | false  =>  game(cards', moves', card'::held_cards, goal)
								      
							     
	    


    in
	game(cards, moves, [], goal)
    end
