#!/usr/bin/env zsh
# ------------------------------------
# Docker aliases and functions.
# ------------------------------------
alias dk="docker"
alias dc="docker-compose"
alias dm="docker-machine"
alias dup="open /Applications/Docker.app"
alias vidc="vi docker-compose.yml"
alias vid="vi Dockerfile"
alias dkspr="docker system prune"
alias dih="docker images | tail -n+2 | head -n10"
alias dcp="docker container prune -f"

# Get latest container ID
alias dl="docker ps -l -q"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dit="docker run -it --rm -P"
alias drrm="docker run --rm -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

alias dct="docker container"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
# dkb() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# =============================================================================
alias dk='docker'
alias dka='docker attach'
alias dkb='docker build'
alias dkd='docker diff'
alias dkdf='docker system df'
alias dke='docker exec'
alias dkE='docker exec -it'
alias dkh='docker history'
alias dkin='docker inspect'
alias dkim='docker import'
alias dkk='docker kill'
alias dkl='docker logs'
alias dkli='docker login'
alias dklo='docker logout'
alias dkls='docker ps'
alias dkp='docker pause'
alias dkP='docker unpause'
alias dkpl='docker pull'
alias dkph='docker push'
alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkr='docker run'
alias dkR='docker run -it --rm'
alias dkRe='docker run -it --rm --entrypoint /bin/bash'
alias dkRM='docker system prune'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkrn='docker rename'
alias dks='docker start'
alias dkS='docker restart'
alias dkss='docker stats'
alias dksv='docker save'
alias dkt='docker tag'
alias dktop='docker top'
alias dkup='docker update'
alias dkV='docker volume'
alias dkv='docker version'
alias dkw='docker wait'
alias dkx='docker stop'

alias dkC='docker container'
alias dkCa='docker container attach'
alias dkCcp='docker container cp'
alias dkCd='docker container diff'
alias dkCe='docker container exec'
alias dkCin='docker container inspect'
alias dkCk='docker container kill'
alias dkCl='docker container logs'
alias dkCls='docker container ls'
alias dkCp='docker container pause'
alias dkCpr='docker container prune'
alias dkCrn='docker container rename'
alias dkCS='docker container restart'
alias dkCrm='docker container rm'
alias dkCr='docker container run'
alias dkCR='docker container run -it --rm'
alias dkCRe='docker container run -it --rm --entrypoint /bin/bash'
alias dkCs='docker container start'
alias dkCss='docker container stats'
alias dkCx='docker container stop'
alias dkCtop='docker container top'
alias dkCP='docker container unpause'
alias dkCup='docker container update'
alias dkCw='docker container wait'

alias dkIb='docker image build'
alias dkIh='docker image history'
alias dkIim='docker image import'
alias dkIin='docker image inspect'
alias dkIls='docker image ls'
alias dkIpr='docker image prune'
alias dkIpl='docker image pull'
alias dkIph='docker image push'
alias dkIrm='docker image rm'
alias dkIsv='docker image save'
alias dkIt='docker image tag'

alias dkV='docker volume'
alias dkVin='docker volume inspect'
alias dkVls='docker volume ls'
alias dkVpr='docker volume prune'
alias dkVrm='docker volume rm'

alias dkN='docker network'
alias dkNs='docker network connect'
alias dkNx='docker network disconnect'
alias dkNin='docker network inspect'
alias dkNls='docker network ls'
alias dkNpr='docker network prune'
alias dkNrm='docker network rm'

alias dkY='docker system'
alias dkYdf='docker system df'
alias dkYpr='docker system prune'

alias dkK='docker stack'
alias dkKls='docker stack ls'
alias dkKps='docker stack ps'
alias dkKrm='docker stack rm'

alias dkW='docker swarm'

# Clean up exited containers (docker < 1.13)
alias dkrmC='docker rm $(docker ps -qaf status=exited)'

# Clean up dangling images (docker < 1.13)
alias dkrmI='docker rmi $(docker images -qf dangling=true)'

# Pull all tagged images
alias dkplI='docker images --format "{{ .Repository }}" | grep -v "^<none>$" | xargs -L1 docker pull'

# Clean up dangling volumes (docker < 1.13)
alias dkrmV='docker volume rm $(docker volume ls -qf dangling=true)'

# Docker Machine
alias dkm='docker-machine'
alias dkma='docker-machine active'
alias dkmcp='docker-machine scp'
alias dkmin='docker-machine inspect'
alias dkmip='docker-machine ip'
alias dkmk='docker-machine kill'
alias dkmls='docker-machine ls'
alias dkmpr='docker-machine provision'
alias dkmps='docker-machine ps'
alias dkmrg='docker-machine regenerate-certs'
alias dkmrm='docker-machine rm'
alias dkms='docker-machine start'
alias dkmsh='docker-machine ssh'
alias dkmst='docker-machine status'
alias dkmS='docker-machine restart'
alias dkmu='docker-machine url'
alias dkmup='docker-machine upgrade'
alias dkmv='docker-machine version'
alias dkmx='docker-machine stop'

# Docker Compose
alias dkcb='docker-compose build'
alias dkcB='docker-compose build --no-cache'
alias dkcd='docker-compose down'
alias dkce='docker-compose exec'
alias dkck='docker-compose kill'
alias dkcl='docker-compose logs'
alias dkcls='docker-compose ps'
alias dkcp='docker-compose pause'
alias dkcP='docker-compose unpause'
alias dkcpl='docker-compose pull'
alias dkcph='docker-compose push'
alias dkcps='docker-compose ps'
alias dkcr='docker-compose run'
alias dkcR='docker-compose run --rm'
alias dkcrm='docker-compose rm'
alias dkcs='docker-compose start'
alias dkcsc='docker-compose scale'
alias dkcS='docker-compose restart'
alias dkcu='docker-compose up'
alias dkcU='docker-compose up -d'
alias dkcv='docker-compose version'
alias dkcx='docker-compose stop'

# ============================
# docker-hub cli tool aliases.
# ============================
alias dh="docker-hub"
