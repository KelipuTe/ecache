#!/usr/bin/env bash

set -e
docker-compose -f script/integration_test_compose.yml down
docker-compose -f script/integration_test_compose.yml up -d

go test -race -cover ./... -tags=e2e
docker-compose -f script/integration_test_compose.yml down