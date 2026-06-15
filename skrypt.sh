#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

show_date() {
  date +"%Y-%m-%d"
}

create_logs() {
  for i in $(seq 1 100); do
    file="log${i}.txt"

    echo "Nazwa pliku: $file" > "$file"
    echo "Utworzony przez: $SCRIPT_NAME" >> "$file"
    echo "Data: $(date +"%Y-%m-%d %H:%M:%S")" >> "$file"
  done

  echo "Utworzono 100 plików log."
}

show_help() {
  echo "Dostępne opcje:"
  echo "  --date    wyświetla dzisiejszą datę"
  echo "  --logs    tworzy 100 plików log"
  echo "  --help    wyświetla pomoc"
}

case "$1" in
  --date)
    show_date
    ;;

  --logs)
    create_logs
    ;;

  --help)
    show_help
    ;;

  *)
    echo "Nieznana opcja. Użyj --help"
    ;;
esac
