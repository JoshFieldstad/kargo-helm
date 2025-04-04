docker login ghcr.io


docker buildx imagetools create \
  ghcr.io/akuity/guestbook:v0.0.1 \
  -t ghcr.io/joshfieldstad/guestbook:v0.0.3

