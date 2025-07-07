// #let num = 678

// // #calc.rem-euclid(212, 100)

// #let mask(value, position) = {
//   let pow = calc.pow(10, position)
//   let rem = calc.rem-euclid(value, pow)
//   let my_result = (rem - calc.rem-euclid(value, pow / 10)) * 10 / pow
//   // return [
//   //   pow=#pow,
//   //   rem=#rem,
//   //   my_result=#my_result,
//   // ];
//   return my_result
// }

// #mask(678, 1) \
// #mask(678, 2) \
// #mask(678, 3) \

#let blockquote(body) = {
  // Define the desired left margin
  let left-margin = 2em // You can adjust this value

  // Apply the margin to the content using a block
  block(
    width: 100% - left-margin, // Adjust width to account for the margin
    inset: (left: left-margin), // Apply the left inset
    body,
    breakable: true // Explicitly set breakable to true (it's the default, but good for clarity)
  )
}

// Example Usage:
#blockquote[
  This is the first paragraph within the blockquote. It should have a consistent left margin applied to all its lines, and it should span multiple pages if the content is long enough.

  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
]

This is a regular paragraph outside the blockquote, to show the difference.

#blockquote[
  This is another blockquoted paragraph.
  It also demonstrates the consistent left margin and multi-page spanning capability.
  Typst's layout engine handles page breaks gracefully when margins are applied this way.
]
