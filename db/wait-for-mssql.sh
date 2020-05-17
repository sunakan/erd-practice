#!/bin/bash

################################################################################
# SQLServerのログから準備が終了したかどうかをチェックする
################################################################################

set -u

readonly MAX_TRY_COUNT=15

status=0
tried_count=0
while [[ $status -eq 0 ]] && [[ $tried_count -lt $MAX_TRY_COUNT ]]; do
  sleep 1
  status=$(docker exec ${DOCKER_MSSQL_HOST} \
    bash -c "grep 'SQL Server is now ready' /var/opt/mssql/log/errorlog | wc -l")
  tried_count=$((tried_count + 1))
  echo tried_count=$tried_count
done

if [[ $status -eq 0 ]]; then
  echo tried to check ready for mssql
  exit 1
else
  echo ready
  exit 0
fi
