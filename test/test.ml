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

let test s f1 f2 a =
  let r1 = f1 (rad_of_degrees a) in
  let r2 = f2 (to_tenth_degrees a) in
  Printf.printf "# %s(%d), res => Per:%.3g IMa:%g\n%!" s a
    (zero r1)
    (float r2 *. 0.001)

let () =
  let a = int_of_string Sys.argv.(1) in
  test "cos" Per.cos IMa.cos a;
  test "sin" Per.sin IMa.sin a;
  test "tan" Per.tan IMa.tan a;
  ()

