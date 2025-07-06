// Counters
#let fontspec_counter_sec_section = state("fontspec_counter_sec_section", 0)
#let fontspec_counter_sec_subsection = state("fontspec_counter_sec_subsection", 0)
#let fontspec_counter_sec_subsubsection = state("fontspec_counter_sec_subsubsection", 0)

// Spacing
#let fontspec_spacing_pre_h1 = state("fontspec_spacing_pre_h1", 1.3em)
#let fontspec_spacing_pre_h2 = state("fontspec_spacing_pre_h2", 0.7em)
#let fontspec_spacing_pre_h3 = state("fontspec_spacing_pre_h3", 0.3em)

// Font size
#let fontspec_fontsize_h1 = state("fontspec_fontsize_h1", 1.4em)
#let fontspec_fontsize_h2 = state("fontspec_fontsize_h2", 1.15em)
#let fontspec_fontsize_h3 = state("fontspec_fontsize_h3", 1.05em)

// Font weight
#let fontspec_h1_style = state("fontspec_h1_style", 121)
#let fontspec_h2_style = state("fontspec_h2_style", 121)
#let fontspec_h3_style = state("fontspec_h3_style", 121)






#let section(numbered: true, content) = context {
  v(fontspec_spacing_pre_h1.get())
  text(size: fontspec_fontsize_h1.get(), [#_fontspec_super_text_styler(fontspec_h1_style.get(), [
      #if (numbered) {
        counter(heading).step(level: 1)
        [#context {counter(heading).display()}. ]
      }
      #content
    ])])
}
#let subsection(numbered: true, content) = context {
  v(fontspec_spacing_pre_h2.get())
  text(size: fontspec_fontsize_h2.get(), [#_fontspec_super_text_styler(fontspec_h2_style.get(), [
      #if (numbered) {
        counter(heading).step(level: 2)
        [#context {counter(heading).display()}; ]
      }
      #content
    ])])
}
#let subsubsection(numbered: true, content) = context {
  v(fontspec_spacing_pre_h3.get())
  text(size: fontspec_fontsize_h3.get(), [#_fontspec_super_text_styler(fontspec_h3_style.get(), [
      #if (numbered) {
        counter(heading).step(level: 3)
        [#context {counter(heading).display()}; ]
      }
      #content
    ])])
}
