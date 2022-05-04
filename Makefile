.PHONY:

# ==============================================================================
# Docker

single-node:
	@echo Starting single node EvenstoreDB setup
	docker-compose -f single-node/docker-compose.yaml up -d --build

clustered:
	@echo Starting clustered/highly available EvenstoreDB setup
	docker-compose -f clustered/docker-compose.yml up -d --build


# ==============================================================================
# Docker support

FILES := $(shell docker ps -aq)

down-local:
	docker stop $(FILES)
	docker rm $(FILES)

clean:
	docker system prune -f

logs-local:
	docker logs -f $(FILES)