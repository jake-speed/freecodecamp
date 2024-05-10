#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo=$($PSQL "TRUNCATE teams,games")

cat games.csv | while IFS="," read YR RD WIN OPP WIN_GOAL OPP_GOAL
do
  if [[ $YR != year ]]
  then

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
        echo ... adding $WIN to teams: $WINNER_ID
      fi  
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")

      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
        echo ... adding $OPP to teams: $OPPONENT_ID
      fi
    fi

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YR,'$RD',$WINNER_ID,$OPPONENT_ID,$WIN_GOAL,$OPP_GOAL)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo ... ... adding to games - $YR $RD - $WIN vs. $OPP
    fi

  fi
done
