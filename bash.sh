#!/bin/bash
echo -e "Hello, welcome to mimo \n  Please note, you must have an existing aws profile to use me\nSelect from the avalable Options below \n1. Create new bcket \n2. Bulk upload files to Bucket \n3. Upload single file to bucket \n\n                     More options coming soon!\n"
read response
if [ $response == 1 ]
then
echo "What is the name of the bucket you want to create"
read bucketname
echo "Okay"
echo "what user are u using"
read users
bucketpart="s3://$bucketname"
person="--profile $users"
aws s3 mb $bucketpart $person && echo "Success " || echo "Creation Failed"
elif [ $response == 2 ]
then
echo "What is the name of your bucket"
read bucketname
echo "Okay"
bucketpart="s3://$bucketname"
echo "What is the path of the folder of d files you want to upload"
read folderparth

echo "Do you wish to make them public (y/n)?"
read choice
if [ $choice == n ]
then
aws s3 cp $folderparth $bucketpart --recursive && echo "Success " || echo "Upload Failed"
elif [ $choice == y ]
then
aws s3 cp $folderparth $bucketpart --recursive --acl public-read && echo "Success " || echo "Upload Failed"
else
echo "Invalid choice"
fi

elif [ $response == 3 ]
then
echo "What is the name of your bucket"
read bucketname
echo "Okay"
bucketpart="s3://$bucketname"
echo "What is the path of the file you want to upload"
read fileparth
echo "Do you wish to make it public (y/n)?"
read choice

if [ $choice == n ]
then
aws s3 cp $fileparth $bucketpart && echo "Success " || echo "Upload Failed"
elif [ $choice == y ]
then
aws s3 cp $fileparth $bucketpart --acl public-read && echo "Success " || echo "Upload Failed"
else
echo "Invalid choice"
fi

fi



















