#let num = 678

// #calc.rem-euclid(212, 100)

#let mask(value, position) = {
  let pow = calc.pow(10, position);
  let rem = calc.rem-euclid(value, pow);
  let my_result = (rem - calc.rem-euclid(value, pow/10) ) * 10 / pow;
  // return [
  //   pow=#pow,
  //   rem=#rem,
  //   my_result=#my_result,
  // ];
  return my_result;
}

#mask(678, 1) \
#mask(678, 2) \
#mask(678, 3) \
