# nom

markdown note management helper

## installation

note: `nom` is written for python 3.

install with either:

    pip install nom

or from source:

    git clone https://github.com/frnsys/nom.git
    cd nom
    pip install --editable .

If you wish to use `nom clip` (to convert clipboard HTML into markdown notes) on OSX, you also need the following:

    pip install pyobjc

On Linux, you need `pygobject`. You can check that it's installed by starting a python interpreter and running:

    from gi.repository import Gdk, Gtk

## usage

```
nom --help

Usage: nom [OPTIONS] COMMAND [ARGS]...

Options:
  --help  Show this message and exit.

Commands:
  clip    convert html in the clipboard to markdown
  export  export a note to html
  preach  export a note to an html presentation
  view    view a note in the browse
```

A bit more about each command:

- `clip`: copy some text from a webpage, then run `nom clip -s ~/notes/foo.md`. This will save the html as markdown to `~/notes/foo.md` and also download any images to `~/notes/assets/foo/`.
    - if you don't pass `-s`, the markdown is output to stdout
    - pass `-e` to open the resulting markdown file in `EDITOR`. only available if `-s` is specified
    - pass `-v` to compile and then view the note in your browser
    - pass `-o` to overwrite an existing note, if there is one
- `view`: compiles and opens a note in the browser
    - pass `-w` to continually watch the original markdown file and its assets and recompile on changes
- `export`: to export a markdown file with its assets as a self-contained site, run `nom export ~/notes/foo.md .`. This will create a folder `foo` with the compiled note and its assets.
    - pass `-w` to continually watch the original markdown file and its assets and recompile on changes
    - pass `-v` to view the compiled note in your browser
    - pass `-s` with a path to a stylesheet to apply style overrides
- `preach`: similar to `export`, except it creates an HTML slideshow, interpreting `---` as slide breaks. Slides are advanced using the arrow keys. Accepts the same options as `export`.


## markdown extensions

`nom` supports the following extra markdown patterns:

- embed a pdf: `![](/path/to.pdf)`
- embed an mp4: `![](/path/to.mp4)`
    - to autoplay an mp4: `![](/path/to.mp4){: autoplay}`
- embed an iframe: `@[](https://web.site)`

for the `preach` functionality there are some built-in CSS classes for convenience:

- fullscreen iframe: `@[](https://web.site){: .fullscreen}`
- fullscreen background image: `![](/path/to.jpg){: .background}`

