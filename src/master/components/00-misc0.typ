

// Miscellaneous...
#let hrulefill() = box(width: 1fr, stroke: (bottom: black))


#let LaTeX() = {
  box({
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
