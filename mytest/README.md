
cd $projectRoot
docker build -t jnlp .
docker run -it -v $PWD:/workdir -w /workdir jnlp bash
cd mytest
bash everything.sh
