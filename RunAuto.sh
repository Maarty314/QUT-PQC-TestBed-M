cd /Documents/QUT/2026/Sem2/EGH-490/QUT-PQC-TestBed-M

docker compose up -d --build
sleep 5
docker compose down
sleep 4

for i in $(seq 1 100)
do
    docker compose up -d
    echo "up $i"
    sleep 2
    docker compose down
    echo "down $i"
    sleep 4
done
