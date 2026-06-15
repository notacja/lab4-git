#!/bin/bash

SCRIPT_NAME="$(basename "$0")"

show_date() {
  date +"%Y-%m-%d"
}

create_logs() {
  count="${1:-100}"

  for i in $(seq 1 "$count"); do
    file="log${i}.txt"
    echo "Nazwa pliku: $file" > "$file"
    echo "Utworzony przez: $SCRIPT_NAME" >> "$file"
    echo "Data: $(date +"%Y-%m-%d %H:%M:%S")" >> "$file"
  done

  echo "Utworzono $count plików log."
}

create_errors() {
  count="${1:-100}"

  for i in $(seq 1 "$count"); do
    dir="error${i}"
    file="${dir}/error${i}.txt"

    mkdir -p "$dir"

    echo "Nazwa pliku: error${i}.txt" > "$file"
    echo "Katalog: $dir" >> "$file"
    echo "Utworzony przez: $SCRIPT_NAME" >> "$file"
    echo "Data: $(date +"%Y-%m-%d %H:%M:%S")" >> "$file"
  done

  echo "Utworzono $count katalogów error."
}

init_repo() {
  REPO_URL="$(git config --get remote.origin.url 2>/dev/null)"

  if [ -z "$REPO_URL" ]; then
    echo "Nie znaleziono adresu repozytorium. Uruchom skrypt w katalogu repo."
    exit 1
  fi

  target="repo_clone_$(date +%s)"
  git clone "$REPO_URL" "$target"

  repo_path="$(pwd)/$target"
  export PATH="$PATH:$repo_path"

  echo "export PATH=\"\$PATH:$repo_path\"" >> ~/.bashrc
  echo "Sklonowano repozytorium do: $repo_path"
  echo "Dodano ścieżkę do PATH w ~/.bashrc"
}

show_help() {
  echo "Dostępne opcje:"
  echo "  --date, -d          wyświetla dzisiejszą datę"
  echo "  --logs, -l          tworzy 100 plików log"
  echo "  --logs N, -l N      tworzy N plików log"
  echo "  --error, -e         tworzy 100 katalogów error"
  echo "  --error N, -e N     tworzy N katalogów error"
  echo "  --init              klonuje repozytorium i dodaje je do PATH"
  echo "  --help, -h          wyświetla pomoc"
}

case "$1" in
  --date|-d)
    show_date
    ;;

  --logs|-l)
    create_logs "$2"
    ;;

  --error|-e)
    create_errors "$2"
    ;;

  --init)
    init_repo
    ;;

  --help|-h)
    show_help
    ;;

  *)
    show_help
    ;;
esac
