#!/bin/bash

# Вказуємо файл для виводу
output_file="Output.log"

# Починаємо запис в файл
echo "Мережева інформація, зібрана за допомогою nmap і tcpdump" > $output_file
echo "------------------------------------------------------" >> $output_file

# Виконуємо nmap для сканування мережі (скануємо діапазон IP-адрес)
echo "Сканування мережі за допомогою nmap:" >> $output_file
nmap -sP 192.168.0.0/24 >> $output_file
echo "------------------------------------------------------" >> $output_file

# Виконуємо tcpdump для збору мережевих пакетів (зберігаємо 10 пакетів)
echo "Захоплення мережевих пакетів за допомогою tcpdump (зберігаємо 10 пакетів):" >> $output_file
tcpdump -c 10 -i any >> $output_file 2>/dev/null
echo "------------------------------------------------------" >> $output_file

echo "Мережева інформація успішно зібрана та збережена у файлі $output_file"
chmod +x network_info.sh
