#import "../src/master/latexcompat.typ": *
#show text: documentclass();


#set text(font: ("Latin Modern Roman", "Noto Serif CJK SC"), size: 11pt)
// fontspec
#setromanfont(("Latin Modern Roman", "Noto Serif CJK SC"))
#setsansfont(("TeX Gyre Heros", "Noto Sans CJK SC"))
#setmonofont(("Noto Sans Mono", "Noto Sans CJK SC"))

// sectsty
#fontspec_h1_style.update(221)

// document metadata
#title[LaTeXCompat Manual]
#author[Neruthes]
#date[#today()]




#let cmdname(content) = {
  block(fill: luma(230), inset: 5pt, below: -8pt, text(size: 0.91em, textit(texttt(content))))
}

#let indented_block(content) = {
  par(hanging-indent: 40pt, first-line-indent: 40pt, content)
  v(4pt)
  // content
}



// begin document
#maketitle()


#section(numbered: false)[Abstract]
This package affords familiar symbols for Typst users with #LaTeX(); background.



#section[fontspec]

#cmdname[
  \#setromanfont(font)\
  \#setromanfont((font1, font2))
] \
#indented_block[Supply a font name string or an array of font names so you can use \#textrm to activate this font.]

#cmdname[
  \#setsansfont(font)\
  \#setsansfont((font1, font2))
] \
#indented_block[Supply a font name string or an array of font names so you can use \#textsf to activate this font.]
