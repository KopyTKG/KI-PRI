# !bin/bash
cd ./Project

# Starting the Project files
cd .. && docker-compose up --build -d 

# Start tailwind server
npx tailwindcss -i ./www/input.css -o ./www/html/assets/tailwind.css  --watch 
