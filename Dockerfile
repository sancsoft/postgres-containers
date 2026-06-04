FROM postgres:18-trixie

RUN apt update && \
    apt install -y \
    postgresql-18-postgis-3 \
    postgresql-18-postgis-3-scripts \
    postgresql-18-timescaledb \
    postgresql-18-pgvector \
    postgresql-18-pg-failover-slots \
    postgresql-18-pgaudit \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY postgresql.conf /etc/postgresql/postgresql.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]