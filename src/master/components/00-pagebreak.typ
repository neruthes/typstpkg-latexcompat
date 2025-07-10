// If local force >= global threshold, insert force break
// Use to toggle manual pagebreaks
// force=0 && threshold=1, for identifying which tries need to be forced
#let _pagebreak_trypagebreak_force_threshold = state("_pagebreak_trypagebreak_force_threshold", 1)

// To find which trypagebreaks are really necessary...
#let stopalltrypagebreak() = context _pagebreak_trypagebreak_force_threshold.update(999)


// Set this local override as an alternative way to supply "force" param to trypagebreak
// Not sure whether useful...
#let _trypagebreak_force_local_override = state("_trypagebreak_force_local_override", 0)


#let trypagebreak(force: 0) = context {
  let real_local_value = calc.max(force, _trypagebreak_force_local_override.get())
  if (real_local_value >= _pagebreak_trypagebreak_force_threshold.get()) {
    pagebreak()
  }
}
