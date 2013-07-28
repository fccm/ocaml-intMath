let () =
  Graphics.open_graph "";
  Graphics.resize_window 400 400;
  while true do
    Graphics.clear_graph ();
    for angle = 0 to pred (360 * 10) do
      let x, y =
        (IntMath.cos angle,
         IntMath.sin angle)
      in
      let x = 100 + x / 10 in
      let y = 100 + y / 10 in
      Graphics.plot x y;
    done;
    let k = Graphics.read_key () in
    if k = '\027' then exit 0;
  done
