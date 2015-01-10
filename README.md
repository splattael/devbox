# My devbox

Run my devbox everywhere!

## Usage

    $ docker run -it --rm -v $(pwd):/src splattael/devbox

## Bash script

```bash
function devbox() {
  if [ "$1" != "" ]; then
    local pwd=$1
  else
    local pwd=$(pwd)
  fi

  docker run -it --rm -v $pwd:/src splattael/devbox
}
```

    $ devbox            # open current dir in devbox
    $ devbox /some/src  # open /some/src in devbox 
