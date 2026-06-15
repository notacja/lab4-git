#!/bin/bash

SCRIPT_NAME="skrypt.sh"

if [ "$1" = "--date" ]; then
  date +"%Y-%m-%d"
  exit 0
fi

if [ "$1" = "--logs" ]; then
  count="${2:-100}"

  for ((i=1; i<=count; i++)); do
    file="log${i}.txt"
    echo "Nazwa pliku: $file" > "$file"
    echo "Utworzony przez: $SCRIPT_NAME" >> "$file"
    echo "Data: $(date +"%Y-%m-%d %H:%M:%S")" >> "$file"
  done

  echo "Utworzono $count plików log."
  exit 0
fi

echo "Dostępne opcje: --date, --logs"
