(* datatype BaseType = Int of int | Real of real | String of string | Bool of bool | Char of char
fun debug (x, message) =
    case x of
    Int y => print(message ^ Int.toString(y) ^ "\n")
  | Real y => print(message ^ Real.toString(y) ^ "\n")
  | String y => print(message ^ y ^ "\n")
  | Bool y => print(message ^ Bool.toString(y) ^ "\n")
  | Char y => print(message ^ Char.toString(y) ^ "\n")

fun double x = x + x

fun n_times (f, n, x) =
    if n=0
    then x
    else (print f(n,x)); f (n_times(f, n-1, x)))
	


val x1 = n_times(double,4,7) *)

fun sum_list xs =
    case xs of
	[] => 0
      | x::xs => x + sum_list xs

val x = 1
fun f y =
    let
	val x = y+1
    in
	fn z => x + y + z
    end

val x = 3
val g = f 4
val y = 5
val z = g 6
