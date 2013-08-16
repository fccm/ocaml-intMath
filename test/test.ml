module Per = Pervasives
module IMa = IntMath

let pi = 3.14159_26535_89793_23846

let degrees_to_rad = pi /. 180.0
let rad_to_degrees = 180.0 /. pi

let rad_of_degrees a = (float a) *. degrees_to_rad
let degrees_of_rad a = (float a) *. rad_to_degrees

let to_tenth_degrees a = a * 10

let zero v =
  if (abs_float v) < epsilon_float then 0.0
  else v

let i = int_of_float
let f = float_of_int


let test_trigo s f1 f2 a =
  let r1 = f1 (rad_of_degrees a) in
  let r2 = f2 (to_tenth_degrees a) in
  Printf.printf "# %s(%d), res => Per:%.3g IMa:%g\n%!" s a
    (zero r1)
    (float r2 *. 0.001)


let test_inv s f1 f2 v =
  let r1 = f1 v in
  let r2 = f2 (i (v *. 1000.0)) in
  Printf.printf "# %s(%g), res => Per:%.3g IMa:%g\n%!" s v
    (r1 *. rad_to_degrees)
    (float r2 *. 0.1)


let () =
  let args = List.tl (Array.to_list Sys.argv) in
  match args with
  | ["-trigo"; _a] ->
      let a = int_of_string _a in

      test_trigo "cos" Per.cos IMa.cos a;
      test_trigo "sin" Per.sin IMa.sin a;
      test_trigo "tan" Per.tan IMa.tan a;

  | ["-inv-trigo"; _v] ->
      let v = float_of_string _v in

      test_inv "acos" Per.acos IMa.acos v;
      test_inv "asin" Per.asin IMa.asin v;
      test_inv "atan" Per.atan IMa.atan v;

  | _ ->
      assert false

