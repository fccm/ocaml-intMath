(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)

include Tables

let unsafe_sin a =
  Array.unsafe_get sin_tbl a

let unsafe_cos a =
  Array.unsafe_get cos_tbl a

let unsafe_tan a =
  Array.unsafe_get tan_tbl a

let unsafe_asin a =
  Array.unsafe_get asin_tbl a

let unsafe_acos a =
  Array.unsafe_get acos_tbl a

let unsafe_atan a =
  Array.unsafe_get atan_tbl a

let unsafe_sqrt a =
  Array.unsafe_get sqrt_tbl a


module Unsafe = struct

let sin = unsafe_sin
let cos = unsafe_cos
let tan = unsafe_tan

let asin = unsafe_asin
let acos = unsafe_acos
let atan = unsafe_atan

let sqrt = unsafe_sqrt

end


let safe a =
  if a >= 3600
  then (a mod 3600) else
  if a < 0
  then 3600 + (a mod 3600) else
  (a)


let sin a = unsafe_sin (safe a)
let cos a = unsafe_cos (safe a)
let tan a = unsafe_tan (safe a)

let asin a = unsafe_asin (safe a)
let acos a = unsafe_acos (safe a)
let atan a = unsafe_atan (safe a)


let sqrt_len = Array.length sqrt_tbl

let sqrt x =
  if x < 0 || x >= sqrt_len then invalid_arg "sqrt" else
  unsafe_sqrt x

