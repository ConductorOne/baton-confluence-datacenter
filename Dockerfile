FROM gcr.io/distroless/static-debian11:nonroot
ENTRYPOINT ["/baton-confluence-datacenter"]
COPY baton-confluence-datacenter /