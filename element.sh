#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

fail() {
  echo $1
  exit
}


if [[ -z $1 ]]
then
  fail "Please provide an element as an argument." 
else

# find element based on incoming argument
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    if [[ ! -z $ATOMIC_NUMBER ]]
    then
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")
    fi
  else
    NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
    if [[ ! -z $NAME ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$1'")
    else
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
      if [[ ! -z $SYMBOL ]]
      then
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
        NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$1'")
      fi
    fi
  fi

# find properties based on element
  if [[ -z $ATOMIC_NUMBER ]]
  then
    fail "I could not find that element in the database."
  else
    PROPS=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    echo $PROPS | sed 's/|/ | /g' | while read TYPE BAR MASS BAR MELTING BAR BOILING
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi
