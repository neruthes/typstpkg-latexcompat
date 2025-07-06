#let _roman_font = state("fontspec_roman_font", none)
#let _sans_font = state("fontspec_sans_font", none)
#let _mono_font = state("fontspec_mono_font", none)

// "series"
#let fontspec_flag_bf = state("fontspec_flag_bf", none)
#let bfseries() = context fontspec_flag_bf.update(true)
#let mdseries() = context fontspec_flag_bf.update(false)

// "shape"
#let fontspec_flag_it = state("fontspec_flag_it", none)
#let itshape() = context fontspec_flag_it.update(true)
#let upshape() = context fontspec_flag_it.update(false)




#let setromanfont(font_name) = {
  _roman_font.update(font_name)
}

#let setsansfont(font_name) = {
  _sans_font.update(font_name)
}

#let setmonofont(font_name) = {
  _mono_font.update(font_name)
}

// #let textbf(content) = {
//   text(weight: "bold", content)
// }

#let textbf(content) = context {
  let tmp_flag = fontspec_flag_bf.get()
  [#bfseries();#content]
  fontspec_flag_bf.update(tmp_flag)
}

#let textmd(content) = context {
  let tmp_flag = fontspec_flag_bf.get()
  [#mdseries();#content]
  fontspec_flag_bf.update(tmp_flag)
}


#let textrm(content) = {
  // Wrap the content that depends on `here()` in a `context` block
  context {
    let font = _roman_font.at(here()) // `here()` is now valid within this context
    if font != none {
      text(font: font, content)
    } else {
      text(font: "serif", content)
    }
  }
}

#let textsf(content) = {
  // Wrap the content that depends on `here()` in a `context` block
  context {
    let font = _sans_font.at(here()) // `here()` is now valid within this context
    if font != none {
      text(font: font, content)
    } else {
      text(font: "sans-serif", content)
    }
  }
}

#let texttt(content) = {
  // Wrap the content that depends on `here()` in a `context` block
  context {
    let font = _mono_font.at(here()) // `here()` is now valid within this context
    if font != none {
      text(font: font, content)
    } else {
      text(font: "monospace", content)
    }
  }
}

#let textup(content) = {
  text(style: "normal", content)
}

#let textit(content) = {
  text(style: "italic", content)
}

// Small caps not supported?
// #let textsc(content) = {
//   text(small-caps: true, content)
// }




#let fontsize(content) = {
  text(size: length, content)
}
