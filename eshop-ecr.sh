aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 129224467924.dkr.ecr.us-east-2.amazonaws.com
docker build -t eshop-repository .
docker tag eshop-repository:latest 129224467924.dkr.ecr.us-east-2.amazonaws.com/eshop-repository:latest
docker push 129224467924.dkr.ecr.us-east-2.amazonaws.com/eshop-repository:latest
# EKS
aws eks --region us-east-2 update-kubeconfig --name eks-blueprints

function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

pause