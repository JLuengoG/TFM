# ZTS Dev Env

`zts-dev-env` is a Docker Compose setup designed to facilitate the development and testing of the ZTS project, a timeseries abstraction layer built on top of Apache HBase.

## Services

This Docker Compose environment includes the following services:

1. **Apache NiFi with ZTS custom processors** (`nifi`): A data integration tool to automate the flow of data between systems, prepared to load ZTS custom processors placed in `nars` directory.
2. **Apache HBase** (`hbase`): A distributed, scalable, big data store, deployed with the tables ZTS needs to operate.
3. **ZTS REST API** (`rest-api`): A jetty server prepared to load the custom REST API for interacting with the ZYLK Time Series data.

## Getting Started

### Prerequisites

- Docker
- Docker Compose

### Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/zts-dev-env.git
    cd zts-dev-env
    ```
2. Place the ZTS NiFi NAR in `nars/`.
    - `nifi-hbase-manager-controller-nar.nar`
    - `nifi-hbase-manager-service-api-nar.nar`
    - `nifi-zts-processors-nar.nar`

3. Place the ZTS REST API WAR in `wars/`.
    - `zts-rest-api.war`

4. Build and start the services:

    ```sh
    docker compose up --build
    ```

5. Access the services via their respective ports.

### Services and Ports

- **NiFi**: Accessible at `https://localhost:8443`
- **HBase**:
  - Master Web UI: `http://localhost:16010`
  - RegionServer Web UI: `http://localhost:16030`
- **REST API**: Accessible at `http://localhost:8081/zts-rest-api`

## Configuration

### NiFi

The NiFi service is configured with a single user (admin) for simplicity.

- Username: `admin`
- Password: `adminadmin333`

NiFi extensions can be added to the `./nars` directory, which is mounted to `/opt/nifi/nifi-current/extensions` inside the container.

### HBase

The HBase service is built from a custom Dockerfile located at `images/hbase/Dockerfile`. This service exposes several ports for its various components, such as Zookeeper and the Master/RegionServer web UIs.

### REST API

The REST API service is built from a custom Dockerfile located at `images/rest-api/Dockerfile`. The `./wars` directory is mounted to `/wars` inside the container, allowing for easy deployment of WAR files.

## Volumes

- **NiFi Extensions**: `./nars` is mounted to `/opt/nifi/nifi-current/extensions`
- **REST API WAR files**: `./wars` is mounted to `/wars`

## Environment Variables

- **NiFi**:
  - `SINGLE_USER_CREDENTIALS_USERNAME`: Username for the single user login.
  - `SINGLE_USER_CREDENTIALS_PASSWORD`: Password for the single user login.

## Troubleshooting

If you encounter any issues, please refer to the logs of the respective services:

```sh
docker-compose logs nifi
docker-compose logs hbase
docker-compose logs rest-api
```

