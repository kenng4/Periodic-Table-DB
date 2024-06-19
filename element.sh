PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

SYM=$1

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #if input not a number
if [[ ! $SYM =~ ^[0-9]+$ ]]
then
LEN=$(echo -n "$SYM" | wc -m)
if [[ $LEN -gt 2 ]]
then
#full name data
  DATA=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where name = '$SYM'")
  if [[ -z $DATA ]]
  then 
    echo "I could not find that element in the database."
  else
    echo "$DATA" | while read BAR BAR NUMBER BAR SYM BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
    do
    echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
    fi
else
#atomic_symbol data
  DATA=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol = '$SYM'")
  if [[ -z $DATA ]]
  then 
    echo "I could not find that element in the database."
  else
    echo "$DATA" | while read BAR BAR NUMBER BAR SYM BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
    do
    echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
    fi
  fi
    else
#atomic_number data
  DATA=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number = $SYM")
  if [[ -z $DATA ]]
  then 
    echo "I could not find that element in the database."
  else
    echo "$DATA" | while read BAR BAR NUMBER BAR SYM BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
    do
    echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
    fi
  fi
fi
