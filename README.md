# ZSH-Environment

## Scripts

- zsh install interactive script `./install.sh`
- docker build interactive script `./test.sh`
  
## Testing Commands

- `docker build -t alpine_testing:latest -f Dockerfile.alpine . && docker run --name alpine_testing -it alpine_testing`
- `docker build -t debian_testing:latest -f Dockerfile.debian . && docker run --name debian_testing -it debian_testing`
- `docker build -t archlinux_testing:latest -f Dockerfile.archlinux . && docker run --name archlinux_testing -it archlinux_testing`
- Old: `docker build -t testing/alpine:latest ./test/alpine && docker run -it  testing/alpine:latest`
- Old: `docker build -t testing . && docker run -it testing`
