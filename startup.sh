# !bin/bash
cd ./Project

# Starting stipdonwn version of supabase
cd ./supabase && docker-compose up -d

# Starting the Project files
cd .. && docker-compose up --build -d 
