#import "../src/master/latexcompat.typ": *
#show: documentclass();

#set par(justify: true)
#set text(font: ("Latin Modern Roman", "Noto Serif CJK SC"), size: 11pt)
// fontspec
#setromanfont(("Latin Modern Roman", "Noto Serif CJK SC"))
#setsansfont(("TeX Gyre Heros", "Noto Sans CJK SC"))
#setmonofont(("JetBrains Mono NL", "Noto Sans CJK SC"))

// sectsty
#sectsty_h1_style.update(221)

// document metadata
#title[LaTeXCompat Manual]
#author[Neruthes]
#date[#today()]




#let cmdname(content) = {
  v(2pt)
  box(fill: none, outset: (y: 1pt), text(size: 0.87em, textit(texttt(content))))
  v(-4pt)
}

#let indented_block(content) = context {
  let left_margin = 40pt
  block(
    width: 100%,
    inset: (left: left_margin),
    breakable: true,
    content,
  )
}





// begin document
#maketitle()


#section(numbered: false)[Abstract]
This package affords familiar symbols for Typst users with #LaTeX background.



#section[fontspec]

#cmdname[
  \#setromanfont(font)\
  \#setromanfont((font1, font2))
]

#indented_block[Supply a font name string or an array of font names so you can use #texttt[\#textrm] to activate this font.]

#cmdname[
  \#setsansfont(font)\
  \#setsansfont((font1, font2))
]

#indented_block[Supply a font name string or an array of font names so you can use #texttt[\#textsf] to activate this font.]

#cmdname[
  \#setmonofont(font)\
  \#setmonofont((font1, font2))
]

#indented_block[Supply a font name string or an array of font names so you can use #texttt[\#texttt] to activate this font.]

#cmdname[
  \#textrm[...]
]

#indented_block[Use the defined serif font for enclosed content.]

#cmdname[
  \#textsf[...]
]

#indented_block[Use the defined #textsf[sans-serif] font for enclosed content.]

#cmdname[
  \#texttt[...]
]

#indented_block[Use the defined #texttt[monospace] font for enclosed content.]

#cmdname[
  \#mdseries();\
  \#bfseries();
]

#indented_block[Change font weight (regular, #textbf[bold]) on the fly in the current context.]

#cmdname[
  \#upshape();\
  \#itshape();
]

#indented_block[Change font style (normal, #textit[italic]) on the fly in the current context.]

#cmdname[
  \#\_fontspec_super_text_styler(mask, #fbox[content]);
]

#indented_block[Internally, this function is used to implement styling.
You can pass a 3-digit integer as styling mask. \
The digit for 1e2 can be 1/2/3, meaning serif/sans-serif/monospace. \
The digit for 1e1 can be 1/2, meaning regular/bold. \
The digit for 1e0 can be 1/2, meaning normal/italic. \
For example, mask value 312 means #_fontspec_super_text_styler(312)[monospace regular italic].
]




#section[datetime2]

#cmdname[
  \#today();
]

#indented_block[
  Prints the current date as YYYY-MM-DD. Example: #today();.
]







#section[Miscellaneous]

#cmdname[
  \#hspace(width: #fbox[length]);
]

#indented_block[
  If you use \#h(1em) inside \#underline, you get #underline[some stuff like#h(1em)this].
  To avoid this, use \#hspace(1em) to get #underline[stuff like#hspace(1em)this].
]


#cmdname[
  \#fbox(#fbox[content]); \
  \#fboxrule.update(#[length || 0.4pt]); \
  \#fboxsep.update(#[length || 0.4em]); \
  \#fboxcolor.update(#[color || black]);
]

#indented_block[
  Creates an inline #fbox[surrounding box].
  You can change
  #fboxcolor.update(red)
  #fbox[fboxcolor] to change box rule color,
  #fboxcolor.update(black)
  change
  #fboxrule.update(0.8pt)
  #fbox[fboxrule] to change box rule stroke width,
  #fboxrule.update(0.4pt)
  and change 
  #fboxsep.update(0.11em)
  #fbox[fboxsep] to change inner spacing.
  #fboxsep.update(0.11em)
]




