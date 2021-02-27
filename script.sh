#!/bin/bash
sam --version 
node --version                                                               
#sam init --runtime nodejs
#cd sam-app/
cd hello-world
npm install 
npm run test

cd ..
sam build
sam package --template-file .aws-sam/build/template.yaml --output-template-file .aws-sam/build/packaged.yaml --s3-bucket convey011 --profile ajprod --region us-east-1
sam deploy --template-file /home/ajay/convey/lambdasam4/sam-app/.aws-sam/build/packaged.yaml --stack-name sam-app --capabilities CAPABILITY_IAM --profile ajprod --region us-east-1
sam local invoke --profile ajprod --region us-east-1

#Start Local Lambda in Local
#sam local start-api --profile ajprod --region us-east-1
#curl http://127.0.0.1:3000/hello #On Browser

#Invoke Your Lambda fn directly............................
sam local invoke "HelloWorldFunction" -e events/event.json --profile ajprod --region us-east-1
echo "Your Lambda function at local executed successfully.."

