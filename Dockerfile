# Dockerfile - Keycloak 26.0.2 for Render (Postgres)
FROM quay.io/keycloak/keycloak:26.0.2

# Set build-time environment for Postgres
ENV KC_DB=postgres
ENV KC_HEALTH_ENABLED=false
ENV KC_METRICS_ENABLED=false

# Build optimized server with Postgres config baked in
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

# Start Keycloak with HTTP mode (no SSL)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--http-enabled=true", "--hostname-strict=false", "--hostname-strict-backchannel=false"]
