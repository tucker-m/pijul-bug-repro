# About
This repo contains a Docker image that I created to demonstrate a bug
I found in pijul.

In the pijul repo inside of this container, there is a text file called
`somefile`, with one line of text in it on the main channel.

There is another channel, `other-channel`, which has a change that adds a second line of text
to the file. That change's hash is `QR3ZU7BZCUARWZGTS4E52NMB46PNBTMKYITDHIULCHDS4DGGLVMAC`.

On the main channel, if you apply that change, the second line of text doesn't
show up until you do `pijul reset`. You shouldn't have to do `pijul reset`, it
is supposed to show up right away.

## Versions

| Name | Version |
|------|---------|
| OS | Ubuntu 20.04 |
| Pijul | 1.0.0-alpha.38 |
| rustup | 1.23.1 |
| rustc | 1.50.0 |
| cargo | 1.50.0 |

# Reproduction Steps

1. `docker pull docker.pkg.github.com/tucker-m/pijul-bug-repro/reset-before-apply:1`.
2. `docker run --rm -it tucker-m/pijul-bug-repro/reset-before-apply:1 bash`
3. See that there is one line of text in the file.
  - `cat somefile`
4. Apply the change from the other channel that adds another line.
  - `pijul apply QR3ZU7BZCUARWZGTS4E52NMB46PNBTMKYITDHIULCHDS4DGGLVMAC`
5. See that the change was applied in `pijul log`.
6. `cat somefile` to see that the file is still unchanged.
7. `pijul reset`
8. `cat somefile` again to see that there is now another line in the file.
