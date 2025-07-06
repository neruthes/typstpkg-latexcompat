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
  tf_1(tf_2(tf_3(content)))
}


