################################################################################
# SA：System Administrator
# SA_PASSWORD：user名=saのlogin password
################################################################################
export DOCKER_MSSQL_TAG=2019-CU4-ubuntu-16.04
export DOCKER_MSSQL_HOST=mssql
export MSSQL_SA_PASSWORD=Hoge-pass

pull:
	docker pull mcr.microsoft.com/mssql/server:${DOCKER_MSSQL_TAG}

up:
	docker run \
		--rm \
		--interactive \
		--tty \
		--hostname ${DOCKER_MSSQL_HOST} \
		--name ${DOCKER_MSSQL_HOST} \
		--publish 1433:1433 \
		--publish 2382:2382 \
		--publish 2383:2383 \
		--env ACCEPT_EULA=Y \
		--env SA_PASSWORD=${MSSQL_SA_PASSWORD} \
		--env MSSQL_PID=Express \
		--env MSSQL_LCID=1041 \
		--env MSSQL_COLLATION=Japanese_CI_AS \
		mcr.microsoft.com/mssql/server:${DOCKER_MSSQL_TAG}

clean:
	docker container ls --quiet --filter='name=${DOCKER_MSSQL_HOST}' | xargs -I {} docker container stop {}

wait-for-mssql:
	bash wait-for-mssql.sh

################################################################################
# DBやユーザの初期化
################################################################################
#export MSSQL_DB_NAME=hoge-db
#export MSSQL_USER_NAME=hoge-user
#export MSSQL_USER_PASSWORD=Hoge-pass
#create-db:
#	docker exec -it ${DOCKER_MSSQL_HOST} \
#		/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -t 30 \
