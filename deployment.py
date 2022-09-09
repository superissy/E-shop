import mailbox
import os, sys

# Get the path to the current directory
version = sys.argv[1]
result = os.system(f'docker images -q oluwaseunmusa/eshop:{version}')

if result != "":
    os.system(f'kubectl create deployment eshop --image=oluwaseunmusa/eshop:{version}')
    os.system('kubectl create service eshop nodeport  --tcp=3000:3000')
else:
    print("Image not found")
    os.system(f'docker build -t oluwaseunmusa/eshop:{version} .')
    os.system(f'docker push oluwaseunmusa/eshop:{version}')
    os.system(f'kubectl create deployment eshop --image=oluwaseunmusa/eshop:{version}')
    os.system('kubectl create service eshop nodeport  --tcp=3000:3000')