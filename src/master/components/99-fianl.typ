#let documentclass = () => {
  return it => context {
    set text(weight: if fontspec_flag_bf.get() { "bold" } else { "regular" }) if (fontspec_flag_bf.get() != none)
    set text(style: if fontspec_flag_it.get() { "italic" } else { "normal" }) if (fontspec_flag_it.get() != none)
    it
  }
}


