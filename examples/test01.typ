#import "../src/master/latexcompat.typ": *
#show text: documentclass();
// documentclass should return a lambda which is equivalent to...
// #show text: it => context {
//   set text(weight: if fontspec_flag_bf.at(here()) { "bold" } else { "regular" }) if (fontspec_flag_bf.get() != none)
//   set text(style: if fontspec_flag_it.at(here()) { "italic" } else { "normal" }) if (fontspec_flag_it.get() != none)
//   it
// }

#set text(font: ("Latin Modern Roman", "Noto Serif CJK SC"), size: 12pt)

// fontspec
#setromanfont(("Latin Modern Roman", "Noto Serif CJK SC"))
#setsansfont(("TeX Gyre Heros", "Noto Sans CJK SC"))
#setmonofont(("Noto Sans Mono", "Noto Sans CJK SC"))

// document metadata
#title[Example Document 01]
#author[Developers of LaTeXCompat Package for Typst]
#date[2025-07-05]

#maketitle()

#textbf[
  Bold Text using
  #texttt[textbf] and
  #textmd[unbold text inside content block context using #texttt[textmd]]
];



#section[Basic Tests]

Test: textit for #textit[Italic]

Test: textit+textbf for #textit[#textbf[Bold Italic]]

Test: #textrm[textrm for serif font]

Test: #textsf[textsf for sans-serif font]

Test: #texttt[texttt for monospace font]



#section[Change Font on the Fly]

#subsection[Using bfseries and mdseries]

Use #texttt[bfseries] #bfseries(); to bold text on the fly
and use #mdseries(); #texttt[mdseries] to unbold on the fly
without creating tree depth.

#subsection[Using itshape and upshape]

Use #texttt[itshape] #itshape(); to "italic" text on the fly
and use #upshape(); #texttt[upshape] to "normal" on the fly
without creating tree depth.

