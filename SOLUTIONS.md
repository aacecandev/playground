Dockerfile

- multi-stage builder steps can be joined
- golang:1.18.0-buster can be replaced with a smaller alpine image
- builder image tag has been substituted with a digest to avoid mutability issues
- 

Trust and security

- cosign sign image
- syft generate sbom
- 