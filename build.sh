docker build --no-cache --build-arg GITHUB_TOKEN=`cat ~/ghub.token` -t pl-miner . 
docker tag pl-miner localhost:5000/pl-miner:latest
docker push localhost:5000/pl-miner:latest
