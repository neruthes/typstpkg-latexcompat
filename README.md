# LaTeXCompat

LaTeX compatibility commands within Typst.




## Installation

### Get Package

```
git clone https://github.com/neruthes/typstpkg-latexcompat &&
cd typstpkg-latexcompat && ./make.sh fast
```

### Use Package

```typst
#import "../src/master/latexcompat.typ" : * // Import all symbols
#import "../src/master/latexcompat.typ" as latex // Import under name
#import "@local/latexcompat:0.1.0": * // Local package in ~/.local/share/typst/packages/local/latexcompat/0.1.0/
```




## Features

## Document Metadata

- `#title[My Title]`
- `#author[Author Name]`
- `#date[2023-04-26]`
- `#maketitle();`

## Section Headings

- Numbered:
  - `#section[...]`
  - `#subsection[...]`
  - `#subsubsection[...]`
- Unnumbered: 
  - `#section(numbered: false)[...]`
  - `#subsection(numbered: false)[...]`
  - `#subsubsection(numbered: false)[...]`


### fontspec

- `#textrm[...]`
- `#textsf[...]`
- `#texttt[...]`
- `#textmd[...]`
- `#textbf[...]`
- `#textup[...]`
- `#textit[...]`
- `#mdseries();`
- `#bfseries();`
- `#upseries();`
- `#itseries();`

### datetime2

- `#today();`


### Miscellaneous

- `#hrulefill();`



## Copyright

Copyright (c) 2024-2025 Neruthes.

Published with the MIT license.
