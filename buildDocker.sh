docker login ghcr.io


#docker buildx imagetools create \
#--annotations "org.opencontainers.image.source=https://github.com/joshfieldstad/kargo-helm.git" \
#  ghcr.io/akuity/guestbook:v0.0.1 \
#  -t ghcr.io/joshfieldstad/guestbook:v0.0.5

# Pull the existing image
docker pull ghcr.io/akuity/guestbook:v0.0.1

# Create a new image with the label
docker build --label "org.opencontainers.image.source=https://github.com/joshfieldstad/kargo-helm.git" \
  --tag ghcr.io/joshfieldstad/guestbook:v0.0.5 \
  - <<EOF
FROM ghcr.io/akuity/guestbook:v0.0.1
LABEL org.opencontainers.image.url https://github.com/joshfieldstad/guestbook
LABEL org.opencontainers.image.description "A simple guestbook application"
LABEL org.opencontainers.image.source https://github.com/joshfieldstad/kargo-helm
EOF

# Push the new image
docker push ghcr.io/joshfieldstad/guestbook:v0.0.5
