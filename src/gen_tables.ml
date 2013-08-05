
let pi = 3.14159_26535_89793_23846_26433_83279_50288
let degrees_to_rad = pi /. 180.0
let rad_to_degrees = 180.0 /. pi

let round x =
  int_of_float (floor (x +. 0.5))

let make_trigo_table f =
  Array.init 3600 (fun i ->
    let g = (float_of_int i) *. 0.1 in
    let a = g *. degrees_to_rad in
    round (1000.0 *. (f a))
  )


let make_sqrt_table () =
  Array.init 100_000 (fun i ->
    let g = (float_of_int i) in
    let r = sqrt g in
    round r
  )


let sin_tbl = make_trigo_table sin
let cos_tbl = make_trigo_table cos
let tan_tbl = make_trigo_table tan

let asin_tbl = make_trigo_table asin
let acos_tbl = make_trigo_table acos
let atan_tbl = make_trigo_table atan

let sqrt_tbl = make_sqrt_table ()


let print_table tbl =
  let i = ref 0 in
  print_string "[|\n";
  Array.iter (fun v ->
    Printf.printf "%d;" v;
    incr i; if (!i mod 10) = 0 then print_char '\n'
  ) tbl;
  print_endline "|]\n"


let () =
  print_string "let sin_tbl = ";  print_table sin_tbl;
  print_string "let cos_tbl = ";  print_table cos_tbl;
  print_string "let tan_tbl = ";  print_table tan_tbl;

  print_string "let asin_tbl = ";  print_table asin_tbl;
  print_string "let acos_tbl = ";  print_table acos_tbl;
  print_string "let atan_tbl = ";  print_table atan_tbl;

  print_string "let sqrt_tbl = ";  print_table sqrt_tbl;
;;

