#let _calc_ext_mask_dec(value, position) = {
  // _calc_ext_mask_dec(468, 1) = 8
  // _calc_ext_mask_dec(468, 2) = 6
  // _calc_ext_mask_dec(468, 3) = 4
  let pow = calc.pow(10, position);
  let rem = calc.rem-euclid(value, pow);
  let my_result = (rem - calc.rem-euclid(value, pow/10) ) * 10 / pow;
  return my_result;
}
