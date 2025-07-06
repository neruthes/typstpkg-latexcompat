#let _calc_ext_mask_dec(value, position) = {
  // _calc_ext_mask_dec(468, 1) = 8
  // _calc_ext_mask_dec(468, 2) = 6
  // _calc_ext_mask_dec(468, 3) = 4
  let pow = calc.pow(10, position);
  let rem = calc.rem-euclid(value, pow);
  let my_result = (rem - calc.rem-euclid(value, pow/10) ) * 10 / pow;
  return my_result;
}
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



#let setromanfont(input_font_spec) = {
  _roman_font.update(input_font_spec)
}

#let setsansfont(input_font_spec) = {
  _sans_font.update(input_font_spec)
}

#let setmonofont(input_font_spec) = {
  _mono_font.update(input_font_spec)
}



// NOTE: Mutating context aggressively might cause layout convergence warning

// NOTE: Possible alternative approach: https://discord.com/channels/1054443721975922748/1391247361455689790/1391489700027695234

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

#let textup(content) = context {
  let tmp_flag = fontspec_flag_it.get()
  [#upshape();#content]
  fontspec_flag_it.update(tmp_flag)
}
#let textit(content) = context {
  let tmp_flag = fontspec_flag_it.get()
  [#itshape();#content]
  fontspec_flag_it.update(tmp_flag)
}


#let textrm(content) = {
  context {
    let font = _roman_font.get()
    if font != none {
      text(font: font, content)
    } else {
      text(font: "serif", content)
    }
  }
}

#let textsf(content) = {
  context {
    let font = _sans_font.get()
    if font != none {
      text(font: font, content)
    } else {
      text(font: "sans-serif", content)
    }
  }
}

#let texttt(content) = {
  context {
    let font = _mono_font.get()
    if font != none {
      text(font: font, content)
    } else {
      text(font: "monospace", content)
    }
  }
}


// Really this this API?
// #let fontsize(content) = {
//   text(size: length, content)
// }




// Styling lambda mapping
#let _fontspec_super_text_styler(mask, content) = context {
  // ====================================================
  // mask default value is 111 meaning rm/md/up
  // 222 means sf/bf/it
  // 3** means tt/*/*
  // ====================================================
  // Parse mask...
  let f_rmsftt = _calc_ext_mask_dec(mask, 3)
  let f_mdbf = _calc_ext_mask_dec(mask, 2)
  let f_upit = _calc_ext_mask_dec(mask, 1)
  // Default stylers
  let tf_1 = textrm
  let tf_2 = textmd
  let tf_3 = textup
  // Override stylers
  if (f_rmsftt == 2) { tf_1 = textsf }
  if (f_rmsftt == 3) { tf_1 = texttt }
  if (f_mdbf == 2) { tf_2 = textbf }
  if (f_upit == 2) { tf_3 = textit }
  // tf_1[#tf_2[#tf_3[#content]]]
  tf_1(tf_2(tf_3(content)))
}


// Miscellaneous...
#let hrulefill() = box(width: 1fr, stroke: (bottom: black))

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
#let documentclass = () => {
  return it => context {
    set text(weight: if fontspec_flag_bf.get() { "bold" } else { "regular" }) if (fontspec_flag_bf.get() != none)
    set text(style: if fontspec_flag_it.get() { "italic" } else { "normal" }) if (fontspec_flag_it.get() != none)
    it
  }
}


