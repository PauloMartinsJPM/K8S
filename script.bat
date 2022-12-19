echo "Criando as Imagens ...."

docker build -t Paulo/projeto-back:1.0 backend /.
docker build -t Paulo/projeto-db:1.0 database/.

echo "Realizando a push das imagens..."

docker push Paulo/projeto-back:1.0
docker push Paulo/projeto-db:1.0

echo "Criando serviços no cluster kubernetes ..."

kubectl apply -f ./services.yml

echo "Criando os deployments ... "

kubectl apply -f ./deployment.yml

echo "Finalizando Script ..."