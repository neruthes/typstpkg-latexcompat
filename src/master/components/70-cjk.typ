// Enabled this show rule to fix CJK punct width
#let CJK_PunctStylePlain(doc) = {
  show regex("[，。、]"): it => box(width: 1em, align(left, it))
  show regex("[！？；：（）【】「」『』❲❳［］]"): it => box(width: 1em, align(center, it))
  doc
}
