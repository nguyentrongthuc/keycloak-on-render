# Dockerfile
FROM quay.io/keycloak/keycloak:26.0.2

# Copy config nếu cần (ở đây không cần thêm)
ENV KC_HEALTH_ENABLED=false
ENV KC_METRICS_ENABLED=false

# Build Keycloak ở chế độ production
RUN /opt/keycloak/bin/kc.sh build

# Expose cổng 8080 (Render sẽ map tự động)
EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
