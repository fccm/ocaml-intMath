(** Trigo math with ints *)
(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Using integers for trigo math may seem unusual,
    the goal is to get deterministic results. *)

(** The angles are not in degrees in the interval (0 .. 360),
    but in tenth of degrees in the interval (0 .. 3600). *)

val sin : int -> int
val cos : int -> int
val tan : int -> int

val asin : int -> int
val acos : int -> int
val atan : int -> int

val sqrt : int -> int


module Unsafe : sig

  val sin : int -> int
  val cos : int -> int
  val tan : int -> int

  val asin : int -> int
  val acos : int -> int
  val atan : int -> int

  val sqrt : int -> int
end

(**/**)

val unsafe_sin : int -> int
val unsafe_cos : int -> int
val unsafe_tan : int -> int

val unsafe_asin : int -> int
val unsafe_acos : int -> int
val unsafe_atan : int -> int

val unsafe_sqrt : int -> int

