

// Miscellaneous...
#let hrulefill() = box(width: 1fr, stroke: (bottom: 0.4pt + black))


#let LaTeX() = {
  box(baseline: 24%, {
    [L]
    h(-0.2em)
    box(baseline: -33%, text(size: 0.75em)[A])
    h(-0.05em)
    [T]
    h(-0.05em)
    box(baseline: 33%, [E])
    h(-0.05em)
    [X]
  })
}


#let hspace(width) = context {
  box(width: width, repeat(sym.space.nobreak))
}


#let fboxsep = state("fboxsep", 0.4em)
#let fboxrule = state("fboxrule", 0.4pt)
#let fboxcolor = state("fboxcolor", black)
#let fbox(content) = context {
  box(stroke: fboxrule.get() + fboxcolor.get(), inset: fboxsep.get(), baseline: fboxsep.get(), content)
}





