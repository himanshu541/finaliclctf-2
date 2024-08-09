generate_key() {
  local prefix=$1
  local suffix=$2
  local middle_part=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
  echo "${prefix}${middle_part}${suffix}"
}

key1=$(generate_key "a1B2cD3E" "1xYz9wV5")
key2=$(generate_key "b4C5dE6F" "2yZa8xW4")
key3=$(generate_key "c7D8eF9G" "3zAb1yX3")
key4=$(generate_key "d9E0fG1H" "4aBc2zY4")
key5=$(generate_key "e2F3gH4I" "5bCd5yZ6")
key6=$(generate_key "f4G5hI6J" "6cDe7zA8")
key7=$(generate_key "g6H7iJ8K" "7dEf9yB0")
key8=$(generate_key "h8I9jK0L" "8eFg1zC2")
key9=$(generate_key "i0J1kL2M" "9fGh3yD4")
key10=$(generate_key "j2K3lM4N" "0gHi5zE6")
key11=$(generate_key "k4L5mN6O" "ahIj7yF8")
key12=$(generate_key "l6M7nO8P" "biJk9zG0")

echo "KEY1: $key1" > ./app_server/src/key1.txt
echo "KEY2: $key2" > ./ssh_server/vm1/key2.txt
echo "KEY3: $key3" > ./ssh_server/vm1/key3.txt
echo "KEY4: $key4" > ./php/src/key4.txt
echo "KEY5: $key5" > ./ssh_server/vm2/key5.txt
echo "KEY6: $key6" > ./ssh_server/vm2/key6.txt
echo "Take Away the flag7 it belongs to your local KEY7: $key7" > ./ssh_server/vm1/key7.txt
echo "KEY8: $key8" > ./ssh_server/vm3/forensic/key8.txt
echo "KEY9: $key9" > ./ssh_server/vm3/forensic/key9.txt
echo "KEY10: $key10" > ./ssh_server/vm3/forensic/key10.txt
echo "KEY11: $key11" > ./ssh_server/vm3/forensic/key11.txt
echo "KEY12: $key12" > ./ssh_server/vm3/forensic/key12.txt

# Print the key to the console
docker-compose up --build -d
