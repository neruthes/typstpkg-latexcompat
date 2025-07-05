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
        #text(size: fontspec_base_fontsize.at(here()) * 1.6)[#ATtitle]
        #v(-3pt)

        #text(size: fontspec_base_fontsize.at(here()))[#ATauthor]
        // #v(-2pt)

        #text(size: fontspec_base_fontsize.at(here()))[#ATdate]
      ]
    ]
    v(fontspec_base_fontsize.at(here()) * 1.5)
  }
}
