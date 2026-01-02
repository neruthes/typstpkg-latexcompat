#let __state_documentclass_params = state("__state_documentclass_params", ())


#let documentclass(..params) = {
  let _docinit(doc) = {
    // Define defaults
    let defaults = (fontsize: 10pt, font: "Linux Libertine")

    // Merge user params into defaults
    // .named() extracts only the key-value pairs from the arguments
    let final_params = defaults + params.named()

    __state_documentclass_params.update(final_params)

    context {
      let current = __state_documentclass_params.get()
      set text(size: current.fontsize, font: current.font)
      doc
    }
  }
  return _docinit
}
// In using:
// #show: documentclass(fontsize: 10pt)
