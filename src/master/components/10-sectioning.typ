// Counters
#let sectsty_sectioning_number_width_h1 = state("sectsty_sectioning_number_width_h1", 36pt)
#let sectsty_sectioning_number_width_h2 = state("sectsty_sectioning_number_width_h2", 36pt)
#let sectsty_sectioning_number_width_h3 = state("sectsty_sectioning_number_width_h3", 36pt)

// Spacing
#let sectsty_spacing_pre_h1 = state("sectsty_spacing_pre_h1", 1.3em)
#let sectsty_spacing_pre_h2 = state("sectsty_spacing_pre_h2", 0.7em)
#let sectsty_spacing_pre_h3 = state("sectsty_spacing_pre_h3", 0.3em)

// Font size
#let sectsty_fontsize_h1 = state("sectsty_fontsize_h1", 1.35em)
#let sectsty_fontsize_h2 = state("sectsty_fontsize_h2", 1.12em)
#let sectsty_fontsize_h3 = state("sectsty_fontsize_h3", 1.0em)

// Font family/weight/style
#let sectsty_h1_style = state("sectsty_h1_style", 121)
#let sectsty_h2_style = state("sectsty_h2_style", 121)
#let sectsty_h3_style = state("sectsty_h3_style", 121)






#let section(numbered: true, content) = context {
  block({
    v(sectsty_spacing_pre_h1.get())
    text(size: sectsty_fontsize_h1.get(), [#_fontspec_super_text_styler(sectsty_h1_style.get(), [
        #if (numbered) {
          counter(heading).step(level: 1)
          box(width: sectsty_sectioning_number_width_h1.get())[#context { counter(heading).display() }. ]
        }
        #content
      ])])
  })
}
#let subsection(numbered: true, content) = context {
  block({
    v(sectsty_spacing_pre_h2.get())
    text(size: sectsty_fontsize_h2.get(), [#_fontspec_super_text_styler(sectsty_h2_style.get(), [
        #if (numbered) {
          counter(heading).step(level: 2)
          box(width: sectsty_sectioning_number_width_h2.get())[#context { counter(heading).display() }. ]
        }
        #content
      ])])
  })
}
#let subsubsection(numbered: true, content) = context {
  block({
    v(sectsty_spacing_pre_h3.get())
    text(size: sectsty_fontsize_h3.get(), [#_fontspec_super_text_styler(sectsty_h3_style.get(), [
        #if (numbered) {
          counter(heading).step(level: 3)
          box(width: sectsty_sectioning_number_width_h3.get())[#context { counter(heading).display() }. ]
        }
        #content
      ])])
  })
}
