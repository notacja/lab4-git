#!/bin/bash

SCRIPT_NAME="skrypt.sh"

show_help() {
  echo "Dostępne opcje:"
  echo "  --date       wyświetla dzisiejszą datę"
  echo "  --logs       tworzy 100 plików log"
  echo "  --logs N     tworzy N plików log"
  echo "  --help       wyświetla pomoc"
}

if [ "$1" = "--date" ]; then
  date +"%Y-%m-%d"
  exit 0
fi

if [ "$1" = "--logs" ]; then
  count="${2:-100}"

  for i in $(seq 1 "$count"); do
    file="log${i}.txt"
    echo "Nazwa pliku: $file" > "$file"
    echo "Utworzony przez: $SCRIPT_NAME" >> "$file"
    echo "Data: $(date +"%Y-%m-%d %H:%M:%S")" >> "$file"
  done

  echo "Utworzono $count plików log."
  exit 0
fi

if [ "$1" = "--help" ]; then
  show_help
  exit 0
fi

show_help
