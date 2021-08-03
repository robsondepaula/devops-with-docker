# To start the container
docker run -it --name web-it ubuntu sh -c 'echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'

# To add missing curl
docker exec -it web-it bash                                                                                                   ✔ ╱ 14:38:33 
apt update
apt install curl