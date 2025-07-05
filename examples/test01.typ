#import "../src/master/latexcompat.typ" : *

#set text(font: ("Latin Modern Roman", "Noto Serif CJK SC"), size: 12pt)

// fontspec
#setfontsize(12pt)
#setromanfont(("Latin Modern Roman", "Noto Serif CJK SC"))
#setsansfont(("Roboto", "Noto Sans CJK SC"))
#setmonofont(("ocrb10", "Noto Sans CJK SC"))

// document metadata
#title[Example Document 01]
#author[Developers of LaTeXCompat Package for Typst]
#date[2025-07-05]

#maketitle()

#textbf[
  Bold Text using
  #texttt[textbf] and
  #textmd[unbold text on the fly using #texttt[textmd]]
];

Test: #textit[Italic]

Test: #textit[#textbf[Bold Italic]]

Test: #textrm[textrm for serif font]

Test: #textsf[textsf for sans-serif font]

Test: #texttt[texttt for monospace font]

