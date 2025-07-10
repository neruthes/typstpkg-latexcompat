// #import "../src/master/latexcompat.typ": *
#import "@local/latexcompat:0.1.0": *
#documentclass();

#set text(font: ("Latin Modern Roman", "Noto Serif CJK SC"), size: 11pt)


// fontspec
#setromanfont(("Latin Modern Roman", "Noto Serif CJK SC"))
#setsansfont(("TeX Gyre Heros", "Noto Sans CJK SC"))
#setmonofont(("Noto Sans Mono", "Noto Sans CJK SC"))

// sectsty
#fontspec_h1_style.update(221)

// document metadata
#title[Example Document 01]
#author[Developers of LaTeXCompat Package for Typst, namely:\
Neruthes]
#date[#today()]


// begin document

#maketitle()


#section(numbered: false)[Abstract]
You can #textbf[
  bold Text using
  #texttt[textbf] and
  #textmd[unbold text inside content block context using #texttt[textmd]]].
  So cool!



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

#subsection[Deeper Nesting]
#textbf[001 #textmd[002 #textbf[003 #textmd[004 #textbf[005 #textit[006 #textup[007 #textit[008 #textup[009 #textit[010 #textmd[011 #textbf[012]]]]]]]]]]]]
