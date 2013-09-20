Tmux Zoom Window Feature
========================

`zoomwin.sh` provides a feature to zoom-in and zoom-out a window even if you use tmux 1.7 or ealier.

## Usage

### If you use tmux 1.8 or later only

Simply use `tmux resize-pane -Z`

```
bind-key {key} resize-pane -Z
```

### If you need to use tmux 1.7 or earlier

Use `zoomwin.sh`.
Clone this repository and copy `zoomwin.sh` to `~/.tmux`.

```
bind-key {key} run "/bin/bash -c 'if [ -f $HOME/.tmux/zoomwin.sh ]; then bash ~/.tmux/zoomwin.sh; else tmux resize-pane -Z; fi'"
```

`zoomwin.sh` use `resize-pane -Z` according to your tmux version properly. So you don't need prepare more than one `tmux.conf`.

## License

    Copyright (c) 2013 rhysd

    MIT License

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
