echo "Criando as imagens..."

docker build -t goliver10/projeto-backend:1.0 backend/.
docker build -t goliver10/projeto-database:1.0 database/.

echo "Fazendo o push das imagens..."

docker push goliver10/projeto-backend:1.0
docker push goliver10/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml