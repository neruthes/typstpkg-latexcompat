

// Miscellaneous...
#let hrulefill() = box(width: 1fr, stroke: (bottom: black))
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

#let textbf(content) = {
  text(weight: "bold", content)
}

#let textmd(content) = {
  text(weight: "regular", content)
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

// xcolor
#let pagecolor(fill: color) = set page(fill: fill)

#let _at_title = state("document_title", ["Document Title"])
#let _at_author = state("document_author", ["Author"])
#let _at_date = state("document_date", ["Date"])


// Set title, author, and date
#let title(content) = {
  _at_title.update(content)
}
#let author(content) = {
  _at_author.update(content)
}
#let date(content) = {
  _at_date.update(content)
}

#let ATtitle = {
  context {
    _at_title.at(here())
  }
}
#let ATauthor = {
  context {
    _at_author.at(here())
  }
}
#let ATdate = {
  context {
    _at_date.at(here())
  }
}


#let maketitle() = {
  context {
    align(center)[
      #textrm[
        #text(size: 1.6em)[#ATtitle]
        #v(-3pt)

        #text(size: 1em)[#ATauthor]

        #text(size: 1em)[#ATdate]
      ]
    ]
    v(1.5em)
  }
}
#let section(content) = textsf[#textbf[#text(size: 1.45em, content)]]
#let subsection(content) = text(size: 1.31em, textsf[#textbf(content)])
#let subsubsection(content) = textbf[#text(size: 1.1em, content)]
#let documentclass = () => {
  return it => context {
    set text(weight: if fontspec_flag_bf.get() { "bold" } else { "regular" }) if (fontspec_flag_bf.get() != none)
    set text(style: if fontspec_flag_it.get() { "italic" } else { "normal" }) if (fontspec_flag_it.get() != none)
    it
  }
}


